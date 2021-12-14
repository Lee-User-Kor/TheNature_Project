package com.thenature.community;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.thenature.comment.CommentSvc;
import com.thenature.comment.CommentVO;
import com.thenature.common.Paging;
import com.thenature.image.ImageSvc;
import com.thenature.image.ImageVO;
import com.thenature.liketable.LikeTableSvc;
import com.thenature.liketable.LikeTableVO;
import com.thenature.member.MemberVO;

@Controller
public class CommunityCtr {

	@Autowired
	CommunitySvc communityService;
	@Autowired
	ImageSvc imageService;
	@Autowired
	CommentSvc commentService;
	@Autowired
	LikeTableSvc ltService;
	
	@RequestMapping(value = "community")
	public String community(ModelMap modelMap, Paging pag,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			String search_keyword) {
		
		if(search_keyword == null || search_keyword == "") {
			int total = communityService.countContentsCommunity();
			if(nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if(nowPage == null) {
				nowPage = "1";
			} else if(cntPerPage == null) {
				cntPerPage = "10";
			}
			pag = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			modelMap.addAttribute("paging", pag);
			
			List<CommunityVO> cVOList = communityService.selectCommunity(pag);
			
			modelMap.addAttribute("cVOList", cVOList);
		}else {
			int total = communityService.countContentsCommunityBySearch(search_keyword);
			if(nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if(nowPage == null) {
				nowPage = "1";
			} else if(cntPerPage == null) {
				cntPerPage = "10";
			}
			pag = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			pag.setSearch_keyword(search_keyword);
			modelMap.addAttribute("paging", pag);
			
			List<CommunityVO> cVOList = communityService.selectSearchCommunity(pag);
			
			modelMap.addAttribute("cVOList", cVOList);
		}
		
		return "view/community";
	}
	
	@RequestMapping(value = "community_detail")
	public String community_detail(ModelMap modelMap, int idx, HttpSession session, Paging pag,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		
		Object obj = idx;
		
		int total = commentService.countContentsCommunityComment(obj);
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
		pag.setCommunity_detail_idx(idx);
		
		CommunityVO cVO = communityService.selectCommunityDetail(obj);
		MemberVO mVO = (MemberVO) session.getAttribute("member");
		List<CommunityVO> cVOList = communityService.selectCommunityList();
		
		if(mVO != null) {
			LikeTableVO likevo = new LikeTableVO();
			likevo.setMember_idx(mVO.getIdx());
			likevo.setTable_idx(cVO.getIdx());
			likevo.setTable_name("board_community");
			
			LikeTableVO like = ltService.find_like(likevo);
			
			int like_check = 0;
			if(like != null) {
				like_check = 1;
			}
			modelMap.addAttribute("like_check", like_check);
		}
		
		int view_cnt = cVO.getView_count();
		view_cnt = view_cnt + 1;
		cVO.setView_count(view_cnt);

		commentService.plusViewCnt(cVO);
		
		ImageVO iVO = imageService.selectCommunityDetailImage(obj);
		List<CommentVO> cmtVOList = commentService.selectCommunityDetailCmt(pag);
		
		modelMap.addAttribute("cVOList", cVOList);
		modelMap.addAttribute("cVO", cVO);
		modelMap.addAttribute("iVO", iVO);
		modelMap.addAttribute("cmtVOList", cmtVOList);
		
		return "view/community_detail";
	}
	
	@RequestMapping(value = "ajax_like_activate_community", method = RequestMethod.POST)
	@ResponseBody
	public int ajax_like_activate_community(LikeTableVO ltVO) {
		int result = 0;
		
		int row = ltService.addLikeTableCommunity(ltVO);
		
		if(row == 1) {
			result = 1;
		} else {
			result = 0;
		}
		
		return result;
	}
	
	@RequestMapping(value = "ajax_like_deactivate_community", method = RequestMethod.POST)
	@ResponseBody
	public int ajax_like_deactivate_community(LikeTableVO ltVO) {
		int result = 0;
		
		int row = ltService.deleteLikeTableCommunity(ltVO);
		
		if(row == 1) {
			result = 1;
		} else {
			result = 0;
		}
		
		return result;	
	}
	
	// #####################################################################
	// ######################   About Comment Start   ######################
	// #####################################################################
	@RequestMapping(value = "ajax_comment_write", method = RequestMethod.POST)
	@ResponseBody
	public int ajax_comment_write(CommentVO cmtVO, @RequestParam("community_idx") String c_idx) {
		int result = 0;
		
		cmtVO.setTable_name("board_community");
		cmtVO.setTable_idx(Integer.parseInt(c_idx));
		int row = commentService.communityDetailComment(cmtVO);
		
		if(row != 0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}
	
	@RequestMapping(value = "ajax_comment_read", method = RequestMethod.POST)
	@ResponseBody
	public Object ajax_comment_read(@RequestParam("community_idx") String c_idx) {
		
		CommentVO cmtVO = new CommentVO();
		cmtVO.setTable_name("board_community");
		cmtVO.setTable_idx(Integer.parseInt(c_idx));
		cmtVO = commentService.ajaxCommunityDetailComment(cmtVO);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("cmtVO", cmtVO);
		
		return result;
	}
	
	@RequestMapping(value = "ajax_cmt_modi", method = RequestMethod.POST)
	@ResponseBody
	public int ajax_cmt_modi(CommentVO cmtvo) {
		int result = 0;
		
		int row = commentService.cmtModi(cmtvo);
		if(row == 1) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}
	
	@RequestMapping(value = "ajax_cmt_del", method = RequestMethod.POST)
	@ResponseBody
	public int ajax_cmt_del(CommentVO cmtvo) {
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
	
	
	@RequestMapping(value = "community_write", method = RequestMethod.GET)
	public String community_write_get() {
		return "view/community_write";
	}
	
	@RequestMapping(value = "community_write", method = RequestMethod.POST)
	public String community_write_post(HttpSession session, CommunityVO cvo, MultipartFile[] img_path) {
		
		for(int i = 0; i < img_path.length; i++) {
			if(img_path.length > 1) {
				return "redirect:/write_fail";
			}
//			String path = "C:\\The_Nature_space\\";
			String path = "/home/thewell/The_Nature_space/";
			File dir = new File(path + "community_file");
			if(!dir.exists()) {
				dir.mkdirs();
			}
			if(img_path[i].getOriginalFilename() != "") {
				String originalFileName = img_path[0].getOriginalFilename();
				String afterDot = originalFileName.substring(originalFileName.indexOf("."));
				String sysFileName = UUID.randomUUID().toString() + afterDot;
				String saveFile = dir + File.separator + sysFileName;
				try {
					img_path[0].transferTo(new File(saveFile));
					
					communityService.writeCommunity(cvo);
					
					CommunityVO cVO = communityService.findIdxForCommunity(cvo);
					ImageVO iVO = new ImageVO();
					iVO.setTable_name("board_community");
					iVO.setTable_idx(cVO.getIdx());
					iVO.setImg_path(sysFileName);
					imageService.writeCommunityImage(iVO);
					
				} catch (Exception e) {
					System.out.println("ERROR MSG : " + e);
					e.printStackTrace();
				}
			}else {
				communityService.writeCommunity(cvo);
			}
		}
		
		return "redirect:/community";
	}
	
}
