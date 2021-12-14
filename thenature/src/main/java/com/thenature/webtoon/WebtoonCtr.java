package com.thenature.webtoon;

import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thenature.comment.CommentSvc;
import com.thenature.comment.CommentVO;
import com.thenature.common.Paging;
import com.thenature.liketable.LikeTableSvc;
import com.thenature.liketable.LikeTableVO;
import com.thenature.member.MemberVO;
import com.thenature.member.PointRankVO;

@Controller
public class WebtoonCtr {

	@Autowired
	WebtoonSvc webtoonService;
	@Autowired
	WebtoonDetailSvc webtoonDetailService;
	@Autowired
	CommentSvc commentService;
	@Autowired
	LikeTableSvc ltService;
	
	@RequestMapping(value = "tree_webtoon")
	public String tree_webtoon(String mode, ModelMap modelMap, HttpSession session, Paging pag,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		int total = webtoonService.countContentsWebtoon();
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "8";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {
			cntPerPage = "8";
		}
		pag = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		modelMap.addAttribute("paging", pag);
		
		List<WebtoonVO> wVOList = webtoonService.treeWebtoon(pag);
		
		// 로그인 시, 웹툰 좋아요 목록 받아오기
		MemberVO mVO = (MemberVO) session.getAttribute("member");
		if (mVO != null) {
			List<LikeTableVO> ltVOList2 = ltService.findLikeForHomeWebtoon(mVO);
			for (int i = 0; i < wVOList.size(); i++) {
				for (int j = 0; j < ltVOList2.size(); j++) {
					if (wVOList.get(i).getIdx() == ltVOList2.get(j).getTable_idx()) {
						wVOList.get(i).setIsLike("y");
						break;
					} else {
						wVOList.get(i).setIsLike("n");
					}
				}
			}
		}
		// 좋아요 갯수 받아오기
		for(int i = 0; i < wVOList.size(); i++) {
			int like_cnt = ltService.countLikeWebtoon(wVOList.get(i));
			wVOList.get(i).setLike_count(like_cnt);
		}
		if(mode.equals("pop")) {
			Comparator<WebtoonVO> comparatorLikeCnt = new Comparator<WebtoonVO>() {
				public int compare(WebtoonVO a, WebtoonVO b) {
					return b.getLike_count() - a.getLike_count();
				}
			};
			
			Collections.sort(wVOList, comparatorLikeCnt);
		}
		
		modelMap.addAttribute("wVOList", wVOList);
		
		return "view/tree_webtoon";
	}

	@RequestMapping(value = "webtoon_list")
	public String webtoon_list(String title, ModelMap modelMap, Paging pag,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		
		int total = webtoonDetailService.countContentsWebtoonDetail();
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "8";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {
			cntPerPage = "8";
		}
		pag = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		modelMap.addAttribute("paging", pag);
		
		WebtoonVO wVO = webtoonService.selectWebtoonList(title);
		pag.setTitle(wVO.getTitle());
		List<WebtoonDetailVO> wdVOList = webtoonDetailService.selectWebtoonDetailList(pag);
		
		modelMap.addAttribute("wVO", wVO);
		modelMap.addAttribute("wdVOList", wdVOList);
		
		return "view/webtoon_list";
	}

	@RequestMapping(value = "webtoon_detail")
	public String webtoon_detail(ModelMap modelMap, String title, String round, Paging pag,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		
		int rnd = Integer.parseInt(round);
		WebtoonDetailVO wdVO = new WebtoonDetailVO();
		wdVO.setBw_title(title);
		wdVO.setRound(rnd);
		wdVO = webtoonDetailService.selectWebtoonDetail(wdVO);
		int maxRound = webtoonDetailService.maxRound(wdVO);
		
		int view_cnt = wdVO.getView_count();
		view_cnt = view_cnt + 1;
		wdVO.setView_count(view_cnt);
		webtoonDetailService.plusViewCntWebtoonDetail(wdVO);
		
//		Object obj = wdVO.getIdx();
		int total = commentService.countContentsWebtoonDetailComment(wdVO);
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {
			cntPerPage = "5";
		}
		pag = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		modelMap.addAttribute("paging", pag);
		pag.setWebtoon_detail_idx(wdVO.getIdx());
		
		List<CommentVO> cmtVOList = commentService.selectWebtoonDetailCmt(pag);
		
		modelMap.addAttribute("wdVO", wdVO);
		modelMap.addAttribute("maxRound", maxRound);
		modelMap.addAttribute("cmtVOList", cmtVOList);
		
		return "view/webtoon_detail";
	}

	// #####################################################################
	// ###################### About Comment Start ######################
	// #####################################################################
	@RequestMapping(value = "ajax_comment_write_webtoon", method = RequestMethod.POST)
	@ResponseBody
	public int ajax_comment_write_webtoon(CommentVO cmtVO, @RequestParam("webtoon_detail_idx") String c_idx) {
		int result = 0;

		cmtVO.setTable_name("board_webtoon_detail");
		cmtVO.setTable_idx(Integer.parseInt(c_idx));
		int row = commentService.communityDetailComment(cmtVO);

		if (row != 0) {
			result = 1;
		} else {
			result = 0;
		}

		return result;
	}
	@RequestMapping(value = "ajax_comment_read_webtoon", method = RequestMethod.POST)
	@ResponseBody
	public Object ajax_comment_read_webtoon(@RequestParam("webtoon_detail_idx") String c_idx) {
		
		CommentVO cmtVO = new CommentVO();
		cmtVO.setTable_name("board_webtoon_detail");
		cmtVO.setTable_idx(Integer.parseInt(c_idx));
		cmtVO = commentService.ajaxCommunityDetailComment(cmtVO);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("cmtVO", cmtVO);
		
		return result;
	}
	@RequestMapping(value = "ajax_cmt_modi_webtoon", method = RequestMethod.POST)
	@ResponseBody
	public int ajax_cmt_modi_webtoon(CommentVO cmtvo) {
		int result = 0;
		
		int row = commentService.cmtModi(cmtvo);
		if(row == 1) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}
	
	@RequestMapping(value = "ajax_cmt_del_webtoon", method = RequestMethod.POST)
	@ResponseBody
	public int ajax_cmt_del_webtoon(CommentVO cmtvo) {
		int result = 0;
		
		int row = commentService.cmtDel(cmtvo);
		if(row == 1) {
			result = 1;
		}else {
			result = 0;
		}
		return result;
	}
	// #####################################################################
	// #######################   About Comment END   #######################
	// #####################################################################
	
}
