package com.thenature.main;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thenature.comment.CommentSvc;
import com.thenature.comment.CommentVO;
import com.thenature.community.CommunitySvc;
import com.thenature.community.CommunityVO;
import com.thenature.image.ImageSvc;
import com.thenature.image.ImageVO;
import com.thenature.liketable.LikeTableSvc;
import com.thenature.liketable.LikeTableVO;
import com.thenature.member.CommunityRankVO;
import com.thenature.member.MemberSvc;
import com.thenature.member.MemberVO;
import com.thenature.member.PointRankVO;
import com.thenature.member.PointSvc;
import com.thenature.member.PointVO;
import com.thenature.member.PresentRankVO;
import com.thenature.tree.TreeCommentarySvc;
import com.thenature.tree.TreeCommentaryVO;
import com.thenature.video.TreeVideoSvc;
import com.thenature.video.TreeVideoVO;
import com.thenature.webtoon.WebtoonDetailSvc;
import com.thenature.webtoon.WebtoonDetailVO;
import com.thenature.webtoon.WebtoonSvc;
import com.thenature.webtoon.WebtoonVO;

@Controller
@Component
public class HomeCtr {

	@Autowired
	TreeCommentarySvc tcService;
	@Autowired
	CommunitySvc communityService;
	@Autowired
	ImageSvc imgService;
	@Autowired
	LikeTableSvc ltService;
	@Autowired
	TreeVideoSvc tvService;
	@Autowired
	WebtoonSvc webtoonService;
	@Autowired
	WebtoonDetailSvc webtoonDetailService;
	@Autowired
	MemberSvc memberService;
	@Autowired
	PointSvc pointService;
	@Autowired
	CommentSvc cmtService;
	
	
	int value = 0;
	
	@Scheduled(cron = "0 0 0 * * *")
	public void todayTc() {
		// ????????? ?????? ?????? ?????????
		System.out.println("???????????? ??????");
		int min = 1;
		int max = tcService.countTreeCommentary();
		Random random = new Random();
		value = random.nextInt(max + min) + min;
	}
	
	
	@RequestMapping(value = "home")
	public String home(ModelMap modelMap, HttpSession session) {
		// ????????? ?????? ????????????
		Object obj = value;
		TreeCommentaryVO tcVO = tcService.getRandomVO(obj);
		modelMap.addAttribute("todayTcVO", tcVO);
		
		// ???????????? ????????????
		List<CommunityVO> cVOList = communityService.selectCommunityForHome();
		
		// ???????????? ????????? ????????????
		List<ImageVO> imgVOList = new ArrayList<ImageVO>();
		for(CommunityVO cvo : cVOList) {
			ImageVO imgVO = imgService.selectCommunityImgForHome(cvo);
			imgVOList.add(imgVO);
		}
		modelMap.addAttribute("imgVOList", imgVOList);
		
		// ????????????, ???????????? ????????? ?????? ????????????
		MemberVO mVO = (MemberVO) session.getAttribute("member");
		if(mVO != null) {
			List<LikeTableVO> ltVOList1 = ltService.findLikeForHomeCommunity(mVO);
			for(int i = 0; i < cVOList.size(); i++) {
				for(int j = 0; j < ltVOList1.size(); j++) {
					if(cVOList.get(i).getIdx() == ltVOList1.get(j).getTable_idx()) {
						cVOList.get(i).setIsLike("y");
						break;
					}else {
						cVOList.get(i).setIsLike("n");
					}
				}
			}
		}
		
		// ???????????? ?????? ????????????
		for(CommunityVO cvo : cVOList) {
			int cmtCnt = cmtService.cntCommunityCmtForHome(cvo);
			cvo.setCmt_count(cmtCnt);
		}
		
		modelMap.addAttribute("cVOList", cVOList);
		
		// ?????? ?????? ????????????
		List<TreeVideoVO> tvVOList = tvService.selectTreeVideoForHome();
		for(TreeVideoVO tvVO : tvVOList) {
			System.out.println("tvVO : " + tvVO.getVideo_path());
		}
		modelMap.addAttribute("tvVOList", tvVOList);
		
		// ?????? ????????????
		List<WebtoonVO> webtoonVOList = webtoonService.selectWebtoonForHome();
		
		// ????????????, ?????? ????????? ?????? ????????????
		if (mVO != null) {
			List<LikeTableVO> ltVOList2 = ltService.findLikeForHomeWebtoon(mVO);
			for (int i = 0; i < webtoonVOList.size(); i++) {
				for (int j = 0; j < ltVOList2.size(); j++) {
					if (webtoonVOList.get(i).getIdx() == ltVOList2.get(j).getTable_idx()) {
						webtoonVOList.get(i).setIsLike("y");
						break;
					} else {
						webtoonVOList.get(i).setIsLike("n");
					}
				}
			}
		}
		
		// ?????? ?????? ?????? ????????????
		for(WebtoonVO webtoonVO : webtoonVOList) {
			List<WebtoonDetailVO> wdVOList = webtoonDetailService.selectByEachWebtoonForHome(webtoonVO);
			int totalCmtCnt = 0;
			for(WebtoonDetailVO webtoonDetailVO : wdVOList) {
				int cmtCnt = cmtService.cntWebtoonDetailCmt(webtoonDetailVO);
				webtoonDetailVO.setCmt_count(cmtCnt);
				totalCmtCnt = totalCmtCnt + webtoonDetailVO.getCmt_count(); 
			}
			webtoonVO.setCmt_count(totalCmtCnt);
		}
		
		modelMap.addAttribute("webtoonVOList",webtoonVOList);
		
		
		// ???????????? ??????
		List<MemberVO> mVOList = memberService.allMember();
		List<CommunityRankVO> crVOList = new ArrayList<CommunityRankVO>();
		for(int i = 0; i < mVOList.size(); i++) {
			CommunityRankVO crVO = new CommunityRankVO();
			crVO.setMember_id(mVOList.get(i).getId());
			crVO.setCount(memberService.countCommunity(mVOList.get(i)));
			crVOList.add(crVO);
		}
		// ????????? ??? ??????
		Comparator<CommunityRankVO> comparator = new Comparator<CommunityRankVO>() {
			public int compare(CommunityRankVO a, CommunityRankVO b) {
				return b.getCount() - a.getCount();
			}
		};
		
		Collections.sort(crVOList, comparator);
		modelMap.addAttribute("crVOList", crVOList);
		
		// ????????? ??????
		List<PointRankVO> prVOList = new ArrayList<PointRankVO>();
		for(int i = 0; i < mVOList.size(); i++) {
			int plusPoint = 0;
			int minusPoint = 0;
			// ????????? ????????? ??????
			// plus ?????????
			List<PointVO> plusPointList = pointService.findPlusByMember(mVOList.get(i));
			for(PointVO pVO : plusPointList) {
				 plusPoint += pVO.getPoint();
			}
			List<PointVO> minusPointList = pointService.findMinusByMember(mVOList.get(i));
			for(PointVO pVO : minusPointList) {
				minusPoint += pVO.getPoint();
			}
			PointRankVO prVO = new PointRankVO();
			prVO.setMember_id(mVOList.get(i).getId());
			prVO.setPoint(plusPoint - minusPoint);
			prVOList.add(prVO);
		}
		// ????????? ??????
		Comparator<PointRankVO> comparatorPoint = new Comparator<PointRankVO>() {
			public int compare(PointRankVO a, PointRankVO b) {
				return b.getPoint() - a.getPoint();
			}
		};
		
		Collections.sort(prVOList, comparatorPoint);
		modelMap.addAttribute("prVOList", prVOList);
		
		// ???????????? ??????
		List<PresentRankVO> presentRankVOList = new ArrayList<PresentRankVO>();
		for(int i = 0; i < mVOList.size(); i++) {
			// ????????? ???????????? ??????
			int presentCheckCnt = memberService.presentCheckCntByMember(mVOList.get(i));
			PresentRankVO presentRankVO = new PresentRankVO();
			presentRankVO.setMember_id(mVOList.get(i).getId());
			presentRankVO.setCount(presentCheckCnt);
			presentRankVOList.add(presentRankVO);
		}
		// ???????????? ??????
		Comparator<PresentRankVO> comparatorPresentCheck = new Comparator<PresentRankVO>() {
			public int compare(PresentRankVO a, PresentRankVO b) {
				return b.getCount() - a.getCount();
			}
		};

		Collections.sort(presentRankVOList, comparatorPresentCheck);
		modelMap.addAttribute("presentRankVOList", presentRankVOList);
		
		
		
		
		return "view/home";
	}
	
	// ####################################################################
	// ##################### like function ################################
	// ####################################################################
	@RequestMapping(value = "ajax_like_activate", method = RequestMethod.POST)
	@ResponseBody
	public int ajax_like_activate(LikeTableVO ltVO) {
		int result = 0;
		
		int row = ltService.addLikeTable(ltVO);
		
		if(row == 1) {
			result = 1;
		}else {
			result = 0;
		}
		return result;
	}
	@RequestMapping(value = "ajax_like_deactivate", method = RequestMethod.POST)
	@ResponseBody
	public int ajax_like_deactivate(LikeTableVO ltVO) {
		int result = 0;
		
		int row = ltService.deleteLikeTable(ltVO);
		
		if(row == 1) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}
	@RequestMapping(value = "ajax_like_activate_webtoon", method = RequestMethod.POST)
	@ResponseBody
	public int ajax_like_activate_webtoon(LikeTableVO ltVO) {
		int result = 0;
		
		int row = ltService.addLikeTableWebtoon(ltVO);
		
		if(row == 1) {
			result = 1;
		}else {
			result = 0;
		}
		return result;
	}
	@RequestMapping(value = "ajax_like_deactivate_webtoon", method = RequestMethod.POST)
	@ResponseBody
	public int ajax_like_deactivate_webtoon(LikeTableVO ltVO) {
		int result = 0;
		
		int row = ltService.deleteLikeTableWebtoon(ltVO);
		
		if(row == 1) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}
	// ####################################################################
	// ##################### like function ################################
	// ####################################################################
}
