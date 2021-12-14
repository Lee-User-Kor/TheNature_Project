package com.thenature.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
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
import com.thenature.community.CommunitySvc;
import com.thenature.community.CommunityVO;
import com.thenature.image.ImageSvc;
import com.thenature.image.ImageVO;
import com.thenature.inquiry.NoticeSvc;
import com.thenature.inquiry.NoticeVO;
import com.thenature.inquiry.QnaSvc;
import com.thenature.inquiry.QnaVO;
import com.thenature.member.MemberSvc;
import com.thenature.member.MemberVO;
import com.thenature.tree.TreeCardSvc;
import com.thenature.tree.TreeCardVO;
import com.thenature.tree.TreeCommentarySvc;
import com.thenature.tree.TreeCommentaryVO;
import com.thenature.video.TreeArSvc;
import com.thenature.video.TreeArVO;
import com.thenature.video.TreeVideoSvc;
import com.thenature.video.TreeVideoVO;
import com.thenature.webtoon.WebtoonDetailSvc;
import com.thenature.webtoon.WebtoonDetailVO;
import com.thenature.webtoon.WebtoonSvc;
import com.thenature.webtoon.WebtoonVO;

@Controller
public class AdminCtr {

	@Autowired
	CommunitySvc communityService;
	@Autowired
	QnaSvc qnaService;
	@Autowired
	WebtoonSvc webtoonService;
	@Autowired
	WebtoonDetailSvc webtoonDetailService;
	@Autowired
	CommentSvc commentService;
	@Autowired
	TreeCommentarySvc tcService;
	@Autowired
	TreeVideoSvc tvService;
	@Autowired
	TreeArSvc taService;
	@Autowired
	NoticeSvc noticeService;
	@Autowired
	QnaSvc qnaServivce;
	@Autowired
	ImageSvc imageService;
	@Autowired
	TreeCardSvc cardService;
	@Autowired
	MemberSvc memberService;
	
	@RequestMapping(value = "admin/logout")
	public String logout_admin(HttpSession session) {
		session.removeAttribute("member");
		return "view/admin/logout";
	}
	
	@RequestMapping(value = "admin/producer_main")
	public String admin_main() {
		return "view/admin/producer_main";
	}
	
	@RequestMapping(value = "admin/admin_main")
	public String adminMain(ModelMap modelMap) {
		
		List<CommunityVO> cVOList = communityService.selectRecentCommunity();
		List<QnaVO> qVOList = qnaService.selectRecentQna();
		List<WebtoonDetailVO> wdVOList = webtoonDetailService.selectRecentWebtoonDetail();
		List<CommentVO> cmtVOList = commentService.selectRecentComment();
		
		modelMap.addAttribute("cVOList", cVOList);
		modelMap.addAttribute("qVOList", qVOList);
		modelMap.addAttribute("wdVOList", wdVOList);
		modelMap.addAttribute("cmtVOList", cmtVOList);
		
		return "view/admin/admin_main";
	}
	
	@RequestMapping(value = "admin/notice_list")
	public String admin_notice_list(ModelMap modelMap, Paging pag,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
	
		int total = noticeService.countContents();
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
		
		List<NoticeVO> nVO = noticeService.getAllNotice(pag);
		modelMap.addAttribute("noticeVO", nVO);
		
		return "view/admin/notice_list";
	}

	@RequestMapping(value = "admin/notice_write", method = RequestMethod.GET)
	public String admin_notice_write() {
		return "view/admin/notice_write";
	}
	
	@RequestMapping(value = "admin/notice_write", method = RequestMethod.POST)
	public String admin_notice_write(NoticeVO nVO) {
		int row = noticeService.addNotice(nVO);
		return "redirect:/admin/notice_list";
	}
	
	@RequestMapping(value = "admin/notice_modify", method = RequestMethod.GET)
	public String admin_notice_modify(int no, ModelMap modelMap) {
		Object obj = no;
		NoticeVO nVO = noticeService.getDetailNotice(obj);
		modelMap.addAttribute("noticeVO", nVO);
		return "view/admin/notice_modify";
	}
	
	@RequestMapping(value = "admin/notice_modify", method = RequestMethod.POST)
	public String admin_notice_modify(NoticeVO nVO) {
		int row = noticeService.modifyNotice(nVO);
		return "redirect:/admin/notice_list";
	}
	
	@ResponseBody
	@RequestMapping(value = "admin/delete_notice", method = RequestMethod.POST)
	public String admin_notice_delete(@RequestParam(value = "check[]", defaultValue = "") List<String> check) {
		
		int cnt = 0;
		for(String c : check) {
			noticeService.deleteNotice(c);
		}
		for(String c : check) {
			cnt = noticeService.deleteNoticeCnt(c);
			cnt = cnt + cnt;
		}
		return String.valueOf(cnt);
	}
	
	
	@RequestMapping(value = "admin/qna_list")
	public String admin_qna_list(ModelMap modelMap, Paging pag,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		int total = qnaService.countContentsQna();
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
		
		List<QnaVO> qVO = qnaService.getAllQna(pag);
		modelMap.addAttribute("qnaVO", qVO);
		
		return "view/admin/qna_list";
	}

	@RequestMapping(value = "admin/qna_write", method = RequestMethod.GET)
	public String admin_qna_write(int no, ModelMap modelMap) {
		
		Object obj = no;
		QnaVO qVO = qnaService.getDetailQna(obj);
		modelMap.addAttribute("qnaVO", qVO);
		
		return "view/admin/qna_write";
	}
	
	@RequestMapping(value = "admin/qna_write", method = RequestMethod.POST)
	public String admin_qna_write(QnaVO qVO) {
		int row = qnaService.addApply(qVO);
		return "redirect:/admin/qna_list";
	}
	
	@RequestMapping(value = "admin/qna_modify", method = RequestMethod.GET)
	public String admin_qna_modify(int no, ModelMap modelMap) {
		Object obj = no;
		QnaVO qVO = qnaService.getDetailQna(obj);
		modelMap.addAttribute("qVO", qVO);
		
		return "view/admin/qna_modify";
	}
	
	@RequestMapping(value = "admin/qna_modify", method = RequestMethod.POST)
	public String qna_modify(QnaVO qVO) {
		qnaService.qnaApplyModify(qVO);
		return "redirect:/admin/qna_list";
	}
	
	@ResponseBody
	@RequestMapping(value = "admin/delete_qna", method = RequestMethod.POST)
	public String delete_qna(@RequestParam(value = "check[]", defaultValue = "") List<String> check) {
		int cnt = 0;
		for(String c : check) {
			qnaService.qnaDelete(c);
		}
		for(String c : check) {
			cnt = qnaService.qnaDeleteCnt(c);
			cnt = cnt + cnt;
		}
		
		System.out.println(cnt);
		return String.valueOf(cnt);
	}
	
	@ResponseBody
	@RequestMapping(value = "admin/delete_qna_apply", method = RequestMethod.POST)
	public String delete_qna_apply(@RequestParam(value = "check[]", defaultValue="") List<String> check) {
		int cnt = 0;
		for(String c : check) {
			qnaService.qnaDeleteApply(c);
		}
		
		System.out.println(cnt);
		return String.valueOf(cnt);
	}
	
	@RequestMapping(value = "admin/community_list")
	public String admin_community_list(ModelMap modelMap, Paging pag,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		int total = communityService.countContentsCommu();
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
		
		return "view/admin/community_list";
	}
	
	@ResponseBody
	@RequestMapping(value = "admin/delete_community", method = RequestMethod.POST)
	public String delete_community(@RequestParam(value = "check[]", defaultValue = "") List<String> check) {
		
		int cnt = 0;
		for(String c : check) {
			communityService.deleteCommunity(c);
			commentService.commentDeleteCommu(c);
		}
		for(String c : check) {
			cnt = communityService.deleteCommunityCnt(c);
			cnt = cnt + cnt;
		}
		return String.valueOf(cnt);
	}
	
	
	@RequestMapping(value = "admin/webtoon_list")
	public String admin_webtoon_list(ModelMap modelMap, Paging pag,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		int total = webtoonDetailService.countContentsWebtoonDetail();
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
		
		List<WebtoonDetailVO> wdVOList = webtoonDetailService.adminWebtoonList(pag);
		modelMap.addAttribute("wdVOList", wdVOList);
		
		return "view/admin/webtoon_list";
	}
	
	
	@RequestMapping(value = "admin/webtoon_write", method = RequestMethod.GET)
	public String admin_webtoon_write_get() {
		return "view/admin/webtoon_write";
	}
	@RequestMapping(value = "admin/webtoon_write", method = RequestMethod.POST)
	public String admin_webtoon_write_post(WebtoonVO wvo, MultipartFile[] thumbnail_file) {
		
		for(int i = 0; i < thumbnail_file.length; i++) {
//			String path = "C:\\The_Nature_space\\";
			String path = "/home/thewell/The_Nature_space/";
			File dir = new File(path + "webtoon_file");
			if(!dir.exists()) {
				dir.mkdirs();
			}
			if(thumbnail_file[i].getOriginalFilename() != "") {
				String originalFileName = thumbnail_file[0].getOriginalFilename();
				String afterDot = originalFileName.substring(originalFileName.indexOf("."));
				String sysFileName = UUID.randomUUID().toString() + afterDot;
				String saveFile = dir + File.separator + sysFileName;
				try {
					System.out.println("try 진입");
					thumbnail_file[0].transferTo(new File(saveFile));
					wvo.setThumbnail(sysFileName);
					webtoonService.writeWebtoon(wvo);
				} catch (Exception e) {
					System.out.println("ERROR MSG : " + e);
					e.printStackTrace();
				}
			}
		}
		return "redirect:/admin/webtoon_list";
	}

	@RequestMapping(value = "admin/webtoon_write_detail", method = RequestMethod.GET)
	public String admin_webtoon_write_detail_get(HttpSession session, ModelMap modelMap) {
		
		MemberVO mVO = (MemberVO) session.getAttribute("member");
		
		List<WebtoonVO> wVOList = new ArrayList<WebtoonVO>();
		
		if(mVO.getGrade() > 2) {
			wVOList = webtoonService.adminWriteDetail();
		}else {
			wVOList = webtoonService.producerWriteDetail(mVO);
		}
		
		modelMap.addAttribute("wVOList", wVOList);
		
		return "view/admin/webtoon_write_detail";
	}
	@RequestMapping(value = "admin/webtoon_write_detail", method = RequestMethod.POST)
	public String admin_webtoon_write_detail_post(WebtoonDetailVO wdvo, @RequestParam("thumbnail_file") MultipartFile[] tfile, @RequestParam("content_file") MultipartFile[] cfile) {
		
		System.out.println("thumbnail_file.length : " + tfile.length);
		System.out.println("thumbnail_file : " + tfile[0].getOriginalFilename());
		System.out.println("content_file.length : " + cfile.length);
		System.out.println("content_file : " + cfile[0].getOriginalFilename());
		
		for(int i = 0; i < tfile.length; i++) {
			if(i == 0) {
//				String path = "C:\\The_Nature_space\\";
				String path = "/home/thewell/The_Nature_space/";
				File dir = new File(path + "webtoon_file");
				if(!dir.exists()) {
					dir.mkdirs();
				}
				if(tfile[i].getOriginalFilename() != "") {
					String originalFileName1 = tfile[0].getOriginalFilename();
					String afterDot1 = originalFileName1.substring(originalFileName1.indexOf("."));
					String sysFileName1 = UUID.randomUUID().toString() + afterDot1;
					String saveFile1 = dir + File.separator + sysFileName1;
					String originalFileName2 = cfile[0].getOriginalFilename();
					String afterDot2 = originalFileName2.substring(originalFileName2.indexOf("."));
					String sysFileName2 = UUID.randomUUID().toString() + afterDot2;
					String saveFile2 = dir + File.separator + sysFileName2;
					try {
						tfile[0].transferTo(new File(saveFile1));
						cfile[0].transferTo(new File(saveFile2));
						wdvo.setThumbnail(sysFileName1);
						wdvo.setImg_path(sysFileName2);
						
						webtoonDetailService.writeWebtoonDetail(wdvo);
					} catch (Exception e) {
						System.out.println("ERROR MSG : " + e);
						e.printStackTrace();
					}
				}
			}
		}
		
		
		return "redirect:/admin/webtoon_list";
	}
	
	@RequestMapping(value = "admin/modify_webtoon", method = RequestMethod.GET)
	public String modify_webtoon(String webtoon_detail_idx, ModelMap modelMap) {
		WebtoonDetailVO wdVO = webtoonDetailService.findWebtoonByIdx(webtoon_detail_idx);
		List<WebtoonVO> wVO = webtoonService.adminWriteDetail();
		modelMap.addAttribute("wdVO", wdVO);
		modelMap.addAttribute("wVO", wVO);
		return "view/admin/webtoon_write_detail";
	}
	
	@RequestMapping(value = "admin/modify_webtoon", method = RequestMethod.POST)
	public String modify_webtoon(WebtoonDetailVO wdVO, @RequestParam("thumbnail_file") MultipartFile[] tfile, @RequestParam("content_file") MultipartFile[] cfile) {
		if(tfile[0].getOriginalFilename() == "" && cfile[0].getOriginalFilename() == "") {
			// 썸네일, 내용 이미지 둘 다 수정하지 않을 때
			webtoonDetailService.updateWebtoonNoFile(wdVO);
		} else if(tfile[0].getOriginalFilename() != "" && cfile[0].getOriginalFilename() == "") {
			// 썸네일만 수정할 때
//			String path = "C:\\The_Nature_space\\";
			String path = "/home/thewell/The_Nature_space/";
			File dir = new File(path + "webtoon_file");
			if(!dir.exists()) {
				dir.mkdirs();
			}
			String originalFileName = tfile[0].getOriginalFilename();
			String afterDot = originalFileName.substring(originalFileName.indexOf("."));
			String sysFileName = UUID.randomUUID().toString() + afterDot;
			String saveFile = dir + File.separator + sysFileName;
			try {
				tfile[0].transferTo(new File(saveFile));
				wdVO.setThumbnail(sysFileName);
				webtoonDetailService.updateWebtoonWithThumbnail(wdVO);
			} catch (Exception e) {
				System.out.println("ERROR : " + e);
				e.printStackTrace();
			} 
		} else if(tfile[0].getOriginalFilename() == "" && cfile[0].getOriginalFilename() != "") {
			// 내용 이미지만 수정할 때
//			String path = "C:\\The_Nature_space\\";
			String path = "/home/thewell/The_Nature_space/";
			File dir = new File(path + "webtoon_file");
			if(!dir.exists()) {
				dir.mkdirs();
			}
			String originalFileName = cfile[0].getOriginalFilename();
			String afterDot = originalFileName.substring(originalFileName.indexOf("."));
			String sysFileName = UUID.randomUUID().toString() + afterDot;
			String saveFile = dir + File.separator + sysFileName;
			try {
				cfile[0].transferTo(new File(saveFile));
				wdVO.setImg_path(sysFileName);
				webtoonDetailService.updateWebtoonWithContent(wdVO);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		} else {
			// 썸네일, 내용 이미지 둘 다 수정할 때
//			String path = "C:\\The_Nature_space\\";
			String path = "/home/thewell/The_Nature_space/";
			File dir = new File(path + "webtoon_file");
			if(!dir.exists()) {
				dir.mkdirs();
			}
			String originalFileName = tfile[0].getOriginalFilename();
			String afterDot = originalFileName.substring(originalFileName.indexOf("."));
			String sysFileName = UUID.randomUUID() + afterDot;
			String saveFile = dir + File.separator + sysFileName;
			String originalFileName2 = tfile[0].getOriginalFilename();
			String afterDot2 = originalFileName2.substring(originalFileName2.indexOf("."));
			String sysFileName2 = UUID.randomUUID() + afterDot2;
			String saveFile2 = dir + File.separator + sysFileName2;
			try {
				tfile[0].transferTo(new File(saveFile));
				cfile[0].transferTo(new File(saveFile2));
				
				wdVO.setImg_path(sysFileName2);
				wdVO.setThumbnail(saveFile);
				
				webtoonDetailService.updateWebtoonWithFiles(wdVO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/admin/webtoon_list";
	}
	
	@ResponseBody
	@RequestMapping(value = "admin/delete_webtoon", method = RequestMethod.POST)
	public String delete_webtoon(@RequestParam(value = "check[]", defaultValue = "") List<String> check) {
		int cnt = 0;
		for(String c : check) {
			webtoonDetailService.webtoonDelete(c);
			commentService.commentDeleteWebtoon(c);
		}
		for(String c : check) {
			cnt = webtoonDetailService.webtoonDeleteCnt(c);
			cnt = cnt + cnt;
		}
		return String.valueOf(cnt);
	}
	
	@RequestMapping(value = "admin/comment_list")
	public String admin_comment_list(ModelMap modelMap, Paging pag,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		int total = commentService.countContentsCmt();
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {
			cntPerPage = "10";
		}	
		pag = new Paging(total,Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		modelMap.addAttribute("paging", pag);
		
		List<CommentVO> comVO = commentService.allCommentList(pag);			//5
		List<CommunityVO> commuVO = communityService.selectTitleCommu();	//10
		List<WebtoonDetailVO> wVO = webtoonDetailService.selectTitleWebtoonDetail();
		
		
		for(int i = 0; i < comVO.size(); i++) {
			if(comVO.get(i).getTable_name().equals("board_community")) {
				for(int j = 0; j < commuVO.size(); j++) {
					if(commuVO.get(j).getIdx() == comVO.get(i).getTable_idx()) {
						comVO.get(i).setPost_title(commuVO.get(j).getTitle());
					}
				}
			} else if(comVO.get(i).getTable_name().equals("board_webtoon_detail")) {
				for(int j = 0; j < wVO.size(); j++) {
					if(wVO.get(j).getIdx() == comVO.get(i).getTable_idx()) {
						comVO.get(i).setBw_title(wVO.get(j).getBw_title());
						comVO.get(i).setPost_title(wVO.get(j).getTitle());
						comVO.get(i).setRound(wVO.get(j).getRound());
					}
				}
			}
		}
		
		modelMap.addAttribute("comVO", comVO);		
		return "view/admin/comment_list";
	}
	
	@ResponseBody
	@RequestMapping(value = "admin/delete_comment", method = RequestMethod.POST) 
	public String delete_comment(@RequestParam(value = "check[]", defaultValue = "") List<String> check) {
		int cnt = 0;
		for(String c : check) {
			commentService.commentDelete(c);
		}
		for(String c : check) {
			cnt = commentService.commentDeleteCnt(c);
			cnt = cnt + cnt;
		}
		return String.valueOf(cnt);
	}
	
	
	@RequestMapping(value = "admin/tree_commentary_list")
	public String tree_commentary_list(ModelMap modelMap, Paging pag,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		int total = tcService.countContentsTc();
		
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
		
		List<TreeCommentaryVO> tcVO = tcService.tcList(pag);
		modelMap.addAttribute("tcVO", tcVO);
		
		return "view/admin/tree_commentary_list";
	}

	@RequestMapping(value = "admin/tree_commentary_write", method = RequestMethod.GET)
	public String tree_commentary_write() {
		return "view/admin/tree_commentary_write";
	}
	
	@RequestMapping(value = "admin/tree_commentary_write", method = RequestMethod.POST)
	public String tree_commentary_write(HttpSession session, TreeCommentaryVO tcVO, 
			@RequestParam("tc_thumnail") MultipartFile[] tfile, @RequestParam("tc_audio") MultipartFile[] afile, @RequestParam("tc_image") MultipartFile[] ifile) {
				
//		String path = "C:\\The_Nature_space\\";
		String path = "/home/thewell/The_Nature_space/";
		File dir = new File(path + "tree_commentary_file");
		if (!dir.exists()) {
			dir.mkdirs();
		}
		if(tfile[0].getOriginalFilename() != "") {
			String originalFileName = tfile[0].getOriginalFilename();
			String afterDot = originalFileName.substring(originalFileName.indexOf("."));
			String sysFileName = UUID.randomUUID().toString() + afterDot;
			String saveFile = dir + File.separator + sysFileName;
			
			if(afile[0].getOriginalFilename() != "") {
				String originalFileName2 = afile[0].getOriginalFilename();
				String afterDot2 = originalFileName2.substring(originalFileName2.indexOf("."));
				String sysFileName2 = UUID.randomUUID().toString() + afterDot2;
				String saveFile2 = dir + File.separator + sysFileName2;
				try {
					System.out.println("try 진입");
					tfile[0].transferTo(new File(saveFile));
					afile[0].transferTo(new File(saveFile2));
					
					tcVO.setThumnail(sysFileName);
					tcVO.setTree_audio(sysFileName2);
					
					tcService.writeTc(tcVO);
					
				} catch (Exception e) {
					System.out.println("ERROR MSG : " + e);
					e.printStackTrace();
				}
			}else {
				try {
					System.out.println("try 진입");
					tfile[0].transferTo(new File(saveFile));
					
					tcVO.setThumnail(sysFileName);
					
					tcService.writeTcWithoutAudio(tcVO);
					
				} catch (Exception e) {
					System.out.println("ERROR MSG : " + e);
					e.printStackTrace();
				}
			}
		}
		
		int table_idx = tcService.findTcIdx();
		
		if(ifile[0].getOriginalFilename() != "") {
			for(int i = 0; i < ifile.length; i++) {
				String originalFileName = ifile[i].getOriginalFilename();
				String afterDot = originalFileName.substring(originalFileName.indexOf("."));
				String sysFileName = UUID.randomUUID().toString() + afterDot;
				String saveFile = dir + File.separator + sysFileName;
				try {
					System.out.println("try ����");
					ifile[i].transferTo(new File(saveFile));
					
					ImageVO iVO = new ImageVO();
					iVO.setTable_name("tree_commentary");
					iVO.setTable_idx(table_idx);
					iVO.setImg_path(sysFileName);
					
					imageService.addTcImage(iVO);
					
				} catch (Exception e) {
					System.out.println("ERROR MSG : " + e);
					e.printStackTrace();
				}
			}
		}
		return "redirect:/admin/tree_commentary_list";
	}
	
	@RequestMapping(value = "admin/tree_commentary_modify", method = RequestMethod.GET)
	public String tree_commentary_modify(int no, ModelMap modelMap) {
		Object obj = no;
		TreeCommentaryVO tcVO = tcService.getDetailCommentary(obj);
		List<ImageVO> iVO = imageService.selectCommentaryDetailImage(obj);
		modelMap.addAttribute("tcVO", tcVO);
		modelMap.addAttribute("iVO", iVO);
		
		return "view/admin/tree_commentary_modify";
	}
	
	@RequestMapping(value = "admin/tree_commentary_modify", method = RequestMethod.POST)
	public String tree_commentary_modify(TreeCommentaryVO tcVO,
			@RequestParam("tc_thumnail") MultipartFile[] tfile, @RequestParam("tc_audio") MultipartFile[] afile, @RequestParam("tc_image") MultipartFile[] ifile) {
		if(tfile[0].getOriginalFilename() == "" && afile[0].getOriginalFilename() == "" && ifile[0].getOriginalFilename() == "") {
			// 썸네일, 오디오, 이미지 모두 수정하지 않을 때
			tcService.updateTreeCommentaryNoFile(tcVO);
		} else if(tfile[0].getOriginalFilename() != "" && afile[0].getOriginalFilename() == "" && ifile[0].getOriginalFilename() == "") {
			// 썸네일만 수정할 때
//			String path = "C:\\The_Nature_space\\";
			String path = "/home/thewell/The_Nature_space/";
			File dir = new File(path + "tree_commentary_file");
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			String originalFileName = tfile[0].getOriginalFilename();
			String afterDot = originalFileName.substring(originalFileName.indexOf("."));
			String sysFileName = UUID.randomUUID().toString() + afterDot;
			String saveFile = dir + File.separator + sysFileName;
			
			System.out.println("saveFile : " + saveFile);
			
			try {
				tfile[0].transferTo(new File(saveFile));
				tcVO.setThumnail(sysFileName);
				tcService.updateTreeCommentaryWithThumbnail(tcVO);
			} catch (Exception e) {	
				System.out.println("ERROR : " + e);
				e.printStackTrace();
			}
		} else if(tfile[0].getOriginalFilename() == "" && afile[0].getOriginalFilename() != "" && ifile[0].getOriginalFilename() == "") {
			// 오디오만 수정할 때
//			String path = "C:\\The_Nature_space\\";
			String path = "/home/thewell/The_Nature_space/";
			File dir = new File(path + "tree_commentary_file");
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			String originalFileName = afile[0].getOriginalFilename();
			String afterDot = originalFileName.substring(originalFileName.indexOf("."));
			String sysFileName = UUID.randomUUID().toString() + afterDot;
			String saveFile = dir + File.separator + sysFileName;
			
			try {
				afile[0].transferTo(new File(saveFile));
				tcVO.setTree_audio(sysFileName);
				tcService.updateTreeCommentaryWithAudio(tcVO);					
			} catch (Exception e) {
				System.out.println("ERROR : " + e);
				e.printStackTrace();
			} 
			
		} else if(tfile[0].getOriginalFilename() == "" && afile[0].getOriginalFilename() == "" && ifile[0].getOriginalFilename() != "") {
			// 이미지만 수정할 때
			tcService.updateTreeCommentaryNoFile(tcVO);
			
//			String path = "C:\\The_Nature_space\\";
			String path = "/home/thewell/The_Nature_space/";
			File dir = new File(path + "tree_commentary_file");
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			int updateIdx = tcVO.getIdx();
			List<ImageVO> iVOList = imageService.selectOneIdx(updateIdx);
			
			System.out.println("ifileLength : " + ifile.length);
			for(int i = 0; i < ifile.length; i++) {
				String originalFileName = ifile[i].getOriginalFilename();
				String afterDot = originalFileName.substring(originalFileName.indexOf("."));
				String sysFileName = UUID.randomUUID().toString() + afterDot;
				String saveFile = dir + File.separator + sysFileName;
				
				try {
					ifile[i].transferTo(new File(saveFile));
					iVOList.get(i).setImg_path(sysFileName);
					imageService.updateTreeCommentaryWithImage(iVOList.get(i));
				} catch (Exception e) {
					System.out.println("ERROR : " + e);
					e.printStackTrace();
				}
			}
		} else if(tfile[0].getOriginalFilename() != "" && afile[0].getOriginalFilename() != "" && ifile[0].getOriginalFilename() == "") {
			// 썸네일, 오디오만 수정할 때
//			String path = "C:\\The_Nature_space\\";
			String path = "/home/thewell/The_Nature_space/";
			File dir = new File(path + "tree_commentary_file");
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			String originalFileName = tfile[0].getOriginalFilename();
			String afterDot = originalFileName.substring(originalFileName.indexOf("."));
			String sysFileName = UUID.randomUUID().toString() + afterDot;
			String saveFile = dir + File.separator + sysFileName;
			String originalFileName2 = afile[0].getOriginalFilename();
			String afterDot2 = originalFileName2.substring(originalFileName2.indexOf("."));
			String sysFileName2 = UUID.randomUUID().toString() + afterDot2;
			String saveFile2 = dir + File.separator + sysFileName2;
			
			try {
				tfile[0].transferTo(new File(saveFile));
				afile[0].transferTo(new File(saveFile2));
				
				tcVO.setThumnail(sysFileName);
				tcVO.setTree_audio(sysFileName2);
				
				tcService.updateTreeCommentaryThumbnailAudio(tcVO);
			} catch (Exception e) {
				System.out.println("ERROR : " + e);
				e.printStackTrace();
			}
			
		} else if(tfile[0].getOriginalFilename() != "" && afile[0].getOriginalFilename() == "" && ifile[0].getOriginalFilename() != "") {
			// 썸네일, 이미지만 수정할 때
//			String path = "C:\\The_Nature_space\\";
			String path = "/home/thewell/The_Nature_space/";
			File dir = new File(path + "tree_commentary_file");
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			String originalFileName = tfile[0].getOriginalFilename();
			String afterDot = originalFileName.substring(originalFileName.indexOf("."));
			String sysFileName = UUID.randomUUID().toString() + afterDot;
			String saveFile = dir + File.separator + sysFileName;
			
			try {
				tfile[0].transferTo(new File(saveFile));
				tcVO.setThumnail(sysFileName);
				tcService.updateTreeCommentaryWithThumbnail(tcVO);
			} catch (Exception e) {
				System.out.println("ERROR : " + e);
				e.printStackTrace();
			}
			
			// 이미지
			int updateIdx = tcVO.getIdx();
			List<ImageVO> iVOList = imageService.selectOneIdx(updateIdx);
			
			for(int i = 0; i < ifile.length; i++) {
				String originalFileName2 = ifile[i].getOriginalFilename();
				String afterDot2 = originalFileName2.substring(originalFileName2.indexOf("."));
				String sysFileName2 = UUID.randomUUID().toString() + afterDot2;
				String saveFile2 = dir + File.separator + sysFileName2;
				
				try {
					ifile[i].transferTo(new File(saveFile2));
					iVOList.get(i).setImg_path(sysFileName2);
					imageService.updateTreeCommentaryWithImage(iVOList.get(i));
				} catch (Exception e) {
					System.out.println("ERROR : " + e);
					e.printStackTrace();
				} 
			}
			
		} else if(tfile[0].getOriginalFilename() == "" && afile[0].getOriginalFilename() != "" && ifile[0].getOriginalFilename() != "") {
			// 오디오, 이미지만 수정할 때
//			String path = "C:\\The_Nature_space\\";
			String path = "/home/thewell/The_Nature_space/";
			File dir = new File(path + "tree_commentary_file");
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			String originalFileName = afile[0].getOriginalFilename();
			String afterDot = originalFileName.substring(originalFileName.indexOf("."));
			String sysFileName = UUID.randomUUID().toString() + afterDot;
			String saveFile = dir + File.separator + sysFileName;
			
			try {
				afile[0].transferTo(new File(saveFile));
				tcVO.setTree_audio(sysFileName);
				tcService.updateTreeCommentaryWithAudio(tcVO);
			} catch (Exception e) {
				e.printStackTrace();
			} 
			
			int updateIdx = tcVO.getIdx();
			List<ImageVO> iVOList = imageService.selectOneIdx(updateIdx);
			
			// 이미지
			for(int i = 0; i < ifile.length; i++) {
				String originalFileName2 = ifile[i].getOriginalFilename();
				String afterDot2 = originalFileName2.substring(originalFileName2.indexOf("."));
				String sysFileName2 = UUID.randomUUID().toString() + afterDot2;
				String saveFile2 = dir + File.separator + sysFileName2;
				
				try {
					ifile[i].transferTo(new File(saveFile2));
					iVOList.get(i).setImg_path(sysFileName2);
					imageService.updateTreeCommentaryWithImage(iVOList.get(i));
				} catch (Exception e) {
					System.out.println("ERROR : " + e);
					e.printStackTrace();
				}
			}
		} else {
			// 썸네일, 오디오, 이미지 모두 수정할 때
//			String path = "C:\\The_Nature_space\\";
			String path = "/home/thewell/The_Nature_space/";
			File dir = new File(path + "tree_commentary_file");
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			String originalFileName = tfile[0].getOriginalFilename();
			String afterDot = originalFileName.substring(originalFileName.indexOf("."));
			String sysFileName = UUID.randomUUID().toString() + afterDot;
			String saveFile = dir + File.separator + sysFileName;
			String originalFileName2 = afile[0].getOriginalFilename();
			String afterDot2 = originalFileName2.substring(originalFileName2.indexOf("."));
			String sysFileName2 = UUID.randomUUID().toString() + afterDot2;
			String saveFile2 = dir + File.separator + sysFileName2;
			
			try {
				tfile[0].transferTo(new File(saveFile));
				afile[0].transferTo(new File(saveFile2));
				
				tcVO.setThumnail(sysFileName);
				tcVO.setTree_audio(sysFileName2);
				
				tcService.updateTreeCommentaryThumbnailAudio(tcVO);
			} catch (Exception e) {
				System.out.println("ERROR : " + e);
				e.printStackTrace();
			} 
			
			// 이미지
			int updateIdx = tcVO.getIdx();
			List<ImageVO> iVOList = imageService.selectOneIdx(updateIdx);
			
			for(int i = 0; i < ifile.length; i++) {
				String originalFileName3 = ifile[i].getOriginalFilename();
				String afterDot3 = originalFileName3.substring(originalFileName3.indexOf("."));
				String sysFileName3 = UUID.randomUUID().toString() + afterDot3;
				String saveFile3 = dir + File.separator + sysFileName3;
				
				try {
					ifile[i].transferTo(new File(saveFile3));
					iVOList.get(i).setImg_path(sysFileName3);
					imageService.updateTreeCommentaryWithImage(iVOList.get(i));
				} catch (Exception e) {
					System.out.println("ERROR : " + e);
					e.printStackTrace();
				} 
			}
		}
		return "redirect:/admin/tree_commentary_list";
	}
	
	@ResponseBody
	@RequestMapping(value = "admin/delete_commentary", method = RequestMethod.POST)
	public String delete_commentary(HttpServletRequest request, ModelMap modelMap,
			@RequestParam(value = "check[]", defaultValue = "") List<String> check) {
		int cnt = 0;
		for(String c : check) {
			tcService.deleteCommentary(c);
		}
		for(String c : check) {
			cnt = tcService.deleteCommentaryCnt(c);
			cnt = cnt + cnt;
		}
		return String.valueOf(cnt);
	}
	
	@RequestMapping(value = "admin/tree_card_list")
	public String tree_card_list(ModelMap modelMap, Paging pag,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		int total = cardService.countContentsCard();
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
		
		List<TreeCardVO> cardVO = cardService.adminTreeCardList(pag);
		modelMap.addAttribute("cardVO", cardVO);
		
		return "view/admin/tree_card_list";
	}
	
	@RequestMapping(value = "admin/tree_card_write", method = RequestMethod.GET)
	public String tree_card_write() {
		return "view/admin/tree_card_write";
	}
	
	@RequestMapping(value = "admin/tree_card_write", method = RequestMethod.POST)
	public String tree_card_write(TreeCardVO cardVO, @RequestParam("i_path") MultipartFile[] ifile) {
//		String path = "C:\\The_Nature_space\\";
		String path = "/home/thewell/The_Nature_space/";
		File dir = new File(path + "tree_card_file");
		if (!dir.exists()) {
			dir.mkdirs();
		}
		if(ifile[0].getOriginalFilename() != "") {
			String originalFileName = ifile[0].getOriginalFilename();
			String afterDot = originalFileName.substring(originalFileName.indexOf("."));
			String sysFileName = UUID.randomUUID().toString() + afterDot;
			String saveFile = dir + File.separator + sysFileName;
			
			try {
				System.out.println("try 진입");
				ifile[0].transferTo(new File(saveFile));
				
				cardVO.setImg_path(sysFileName);
				
				cardService.addTreeCard(cardVO);
				
			} catch (Exception e) {
				System.out.println("ERROR MSG : " + e);
				e.printStackTrace();
			}
		}
		return "redirect:/admin/tree_card_list";
	}
	
	@RequestMapping(value = "admin/tree_card_modify", method = RequestMethod.GET) 
	public String tree_card_modify(ModelMap modelMap, String idx) {
		TreeCardVO cardVO = cardService.selectOneCard(idx);
		modelMap.addAttribute("cardVO", cardVO);
		return "view/admin/tree_card_write";
	}
	
	@RequestMapping(value = "admin/tree_card_modify", method = RequestMethod.POST)
	public String tree_card_modify(TreeCardVO cardVO, @RequestParam("i_path") MultipartFile[] ifile) {
		if(ifile[0].getOriginalFilename() == "") {
			// 카드 이미지를 변경하지 않을 때
			cardService.modifyCardNoFile(cardVO);
		} else {
			// 수정 시 카드 이미지도 같이 수정할 때
//			String path = "C:\\The_Nature_space\\";
			String path = "/home/thewell/The_Nature_space/";
			File dir = new File(path + "tree_card_file");
			if(!dir.exists()) {
				dir.mkdirs();
			}
			String originalFileName = ifile[0].getOriginalFilename();
			String afterDot = originalFileName.substring(originalFileName.indexOf("."));
			String sysFileName = UUID.randomUUID().toString() + afterDot;
			String saveFile = dir + File.separator + sysFileName;
			try {
				ifile[0].transferTo(new File(saveFile));
				cardVO.setImg_path(sysFileName);
				cardService.modifyCardWithImg(cardVO);
			} catch (Exception e) {
				System.out.println("ERROR : " + e);
				e.printStackTrace();
			}
		}
		return "redirect:/admin/tree_card_list";
	}
	
	@RequestMapping(value = "admin/tree_card_delete", method = RequestMethod.POST)
	@ResponseBody
	public String tree_card_delete(@RequestParam(value = "check[]", defaultValue = "") List<String> check) {
		int cnt = 0;
		for(String c : check) {
			cnt = cardService.deleteCardCnt(c);
			System.out.println("카운트 갯수 : " + cnt);
			cnt = cnt + cnt;
		}
		for(String c : check) {
			cardService.deleteCard(c);
		}
		System.out.println("cnt : " + cnt);
		return String.valueOf(cnt);
	}
	
	@RequestMapping(value = "admin/video_list")
	public String video_list(ModelMap modelMap, Paging pag,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		int total = tvService.countContentsTv();
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
		
		List<TreeVideoVO> tvVO = tvService.treeVideoList(pag);
		modelMap.addAttribute("tvVO", tvVO);
		
		return "view/admin/video_list";
	}

	@RequestMapping(value = "admin/video_write", method = RequestMethod.GET)
	public String video_write() {
		return "view/admin/video_write";
	}
	
	@RequestMapping(value = "admin/video_write", method = RequestMethod.POST)
	public String video_write(TreeVideoVO tvVO, @RequestParam("tv_video") MultipartFile[] vfile, @RequestParam("tv_thumbnail") MultipartFile[] tfile) {
//		String path = "C:\\The_Nature_space\\";
		String path = "/home/thewell/The_Nature_space/";
		File dir = new File(path + "tree_video");
		if (!dir.exists()) {
			dir.mkdirs();
		}
		if(vfile[0].getOriginalFilename() != "") {
			String originalFileName = vfile[0].getOriginalFilename();
			String afterDot = originalFileName.substring(originalFileName.indexOf("."));
			String sysFileName = UUID.randomUUID().toString() + afterDot;
			String saveFile = dir + File.separator + sysFileName;
			
			if(tfile[0].getOriginalFilename() != "") {
				String originalFileName2 = tfile[0].getOriginalFilename();
				String afterDot2 = originalFileName2.substring(originalFileName2.indexOf("."));
				String sysFileName2 = UUID.randomUUID().toString() + afterDot2;
				String saveFile2 = dir + File.separator + sysFileName2;
				try {
					vfile[0].transferTo(new File(saveFile));
					tfile[0].transferTo(new File(saveFile2));
					
					tvVO.setVideo_path(sysFileName);
					tvVO.setThumbnail(sysFileName2);
					
					tvService.tvWrite(tvVO);
				} catch(Exception e) {
					System.out.println("ERROR : " + e);
					e.printStackTrace();
				}
			} else {
				try {
					vfile[0].transferTo(new File(saveFile));
					
					tvVO.setVideo_path(sysFileName);
					
					tvService.tvWriteNoThumbnail(tvVO);
				} catch(Exception e) {
					System.out.println("ERROR : " + e);
					e.printStackTrace();
				}
			}
		}
		return "redirect:/admin/video_list";
	}
	
	@RequestMapping(value = "admin/video_modify", method = RequestMethod.GET)
	public String video_modify(int no, ModelMap modelMap) {
		Object obj = no;
		TreeVideoVO tvVO = tvService.selectOneVideo(obj);
		modelMap.addAttribute("tvVO", tvVO);
		
		return "view/admin/video_modify";
	}
	
	@RequestMapping(value = "admin/video_modify", method = RequestMethod.POST)
	public String video_modify(TreeVideoVO tvVO, MultipartFile[] tv_video, MultipartFile[] tv_thumbnail) {
		if(tv_video[0].getOriginalFilename() == "" && tv_thumbnail[0].getOriginalFilename() == "") {
			// 비디오 썸네일 둘 다 수정하지 않을 때
			tvService.updateVideoNoFile(tvVO);
		} else if(tv_video[0].getOriginalFilename() == "" && tv_thumbnail[0].getOriginalFilename() != "") {
			// 썸네일만 수정할 때
//			String path = "C:\\The_Nature_space\\";
			String path = "/home/thewell/The_Nature_space/";
			File dir = new File(path + "tree_video");
			if (!dir.exists()) {
				dir.mkdirs();
			}
			String originalFileName = tv_thumbnail[0].getOriginalFilename();
			String afterDot = originalFileName.substring(originalFileName.indexOf("."));
			String sysFileName = UUID.randomUUID().toString() + afterDot;
			String saveFile = dir + File.separator + sysFileName;
			try {
				tv_thumbnail[0].transferTo(new File(saveFile));
				tvVO.setThumbnail(sysFileName);
				tvService.updateVideoWithThumbnail(tvVO);
			} catch(Exception e) {
				System.out.println("ERROR : " + e);
				e.printStackTrace();
			}
		} else if(tv_video[0].getOriginalFilename() != "" && tv_thumbnail[0].getOriginalFilename() == "") {
			// 비디오만 수정할 때
//			String path = "C:\\The_Nature_space\\";
			String path = "/home/thewell/The_Nature_space/";
			File dir = new File(path + "tree_video");
			if(!dir.exists()) {
				dir.mkdirs();
			}
			String originalFileName = tv_video[0].getOriginalFilename();
			String afterDot = originalFileName.substring(originalFileName.indexOf("."));
			String sysFileName = UUID.randomUUID().toString() + afterDot;
			String saveFile = dir + File.separator + sysFileName;
			try {
				tv_video[0].transferTo(new File(saveFile));
				tvVO.setVideo_path(sysFileName);
				tvService.updateVideoWithVideo(tvVO);
			} catch (Exception e) {
				System.out.println("ERROR : " + e);
				e.printStackTrace();
			}
		} else {
			// 비디오 썸네일 둘 다 수정할 때
//			String path = "C:\\The_Nature_space\\";
			String path = "/home/thewell/The_Nature_space/";
			File dir = new File(path + "tree_video");
			if(!dir.exists()) {
				dir.mkdirs();
			}
			String originalFileName = tv_video[0].getOriginalFilename();
			String afterDot = originalFileName.substring(originalFileName.indexOf("."));
			String sysFileName = UUID.randomUUID().toString() + afterDot;
			String saveFile = dir + File.separator + sysFileName;
			String originalFileName2 = tv_thumbnail[0].getOriginalFilename();
			String afterDot2 = originalFileName2.substring(originalFileName2.indexOf("."));
			String sysFileName2 = UUID.randomUUID().toString() + afterDot2;
			String saveFile2 = dir + File.separator + sysFileName2;
			try {
				tv_video[0].transferTo(new File(saveFile));
				tv_thumbnail[0].transferTo(new File(saveFile2));
				
				tvVO.setVideo_path(sysFileName);
				tvVO.setThumbnail(sysFileName2);
				
				tvService.updateVideoWithFiles(tvVO);
			} catch (Exception e) {
				System.out.println("ERROR : " + e);
				e.printStackTrace();
			} 
		}
		return "redirect:/admin/video_list";
	}
	
	@ResponseBody
	@RequestMapping(value = "admin/video_delete", method = RequestMethod.POST)
	public String video_delete(@RequestParam(value = "check[]", defaultValue = "") List<String> check) {
		int cnt = 0;
		for(String c : check) {
			tvService.deleteVideo(c);
		}
		for(String c : check) {
			cnt = tvService.deleteVideoCnt(c);
			cnt = cnt + cnt;
		}
		return String.valueOf(cnt);
	}
	
	
	@RequestMapping(value = "admin/ar_list")
	public String ar_list(ModelMap modelMap, Paging pag,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		int total = taService.countContentsTa();
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
		
		List<TreeArVO> taVO = taService.treeArList(pag);
		modelMap.addAttribute("taVO", taVO);
		
		return "view/admin/ar_list";
	}

	@RequestMapping(value = "admin/ar_write", method = RequestMethod.GET)
	public String ar_write() {
		return "view/admin/ar_write";
	}
	
	@RequestMapping(value = "admin/ar_write", method = RequestMethod.POST)
	public String ar_write(TreeArVO taVO, @RequestParam("ta_ar") MultipartFile[] afile) {
//		String path = "C:\\The_Nature_space\\";
		String path = "/home/thewell/The_Nature_space/";
		File dir = new File(path + "tree_ar");
		if (!dir.exists()) {
			dir.mkdirs();
		}
		if(afile[0].getOriginalFilename() != "") {
			String originalFileName = afile[0].getOriginalFilename();
			String afterDot = originalFileName.substring(originalFileName.indexOf("."));
			String sysFileName = UUID.randomUUID().toString() + afterDot;
			String saveFile = dir + File.separator + sysFileName;
			
			try {
				System.out.println("try ����");
				afile[0].transferTo(new File(saveFile));
				
				taVO.setAr_path(sysFileName);
				
				taService.taWrite(taVO);
				
			} catch (Exception e) {
				System.out.println("ERROR MSG : " + e);
				e.printStackTrace();
			}
		}
		return "redirect:/admin/ar_list";
	}
	
	@RequestMapping(value = "admin/ar_modify", method = RequestMethod.GET)
	public String ar_modify(int no, ModelMap modelMap) {
		Object obj = no;
		TreeArVO taVO = taService.selectOneAr(obj);
		modelMap.addAttribute("taVO", taVO);
		
		return "view/admin/ar_modify";
	}
	
	@RequestMapping(value = "admin/ar_modify", method = RequestMethod.POST)
	public String ar_modify(TreeArVO taVO, MultipartFile[] ta_ar) {
		
		if(ta_ar[0].getOriginalFilename() == "") {
			taService.updateArByModi(taVO);
		} else {
//			String path = "C:\\The_Nature_space\\";
			String path = "/home/thewell/The_Nature_space/";
			File dir = new File(path + "tree_ar");
			if (!dir.exists()) {
				dir.mkdirs();
			}
			String originalFileName = ta_ar[0].getOriginalFilename();
			String afterDot = originalFileName.substring(originalFileName.indexOf("."));
			String sysFileName = UUID.randomUUID().toString() + afterDot;
			String saveFile = dir + File.separator + sysFileName;
			try {
				ta_ar[0].transferTo(new File(saveFile));
				
				taVO.setAr_path(sysFileName);
				
				taService.updateArWithPath(taVO);
			} catch(Exception e) {
				System.out.println("ERROR MSG : " + e);
				e.printStackTrace();			
			}
		}	
		return "redirect:/admin/ar_list";
	}
	
	@ResponseBody
	@RequestMapping(value = "admin/ar_delete", method = RequestMethod.POST)
	public String ar_delete(@RequestParam(value = "check[]", defaultValue = "") List<String> check) {
		int cnt = 0;
		for(String c : check) {
			taService.deleteAr(c);
		}
		for(String c : check) {
			cnt = taService.deleteArCnt(c);
			cnt = cnt + cnt;
		}
		return String.valueOf(cnt);
	}
	
	@RequestMapping(value = "admin/member_list")
	public String member_list(ModelMap modelMap, Paging pag,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		int total = memberService.countContentsMember();
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
		
		
		List<MemberVO> mVOList = memberService.selectAllForAdmin(pag);
		modelMap.addAttribute("mVOList", mVOList);
		
		return "view/admin/member_list";
	}
	
	@RequestMapping(value = "admin/grade_up", method = RequestMethod.POST)
	public String grade_up(HttpServletRequest request) {
		
		String[] chkValues = request.getParameterValues("member_idx");
		for(String chkVal : chkValues) {
			MemberVO mVO = memberService.checkAdmin(chkVal);
			if(mVO.getGrade() == 3) {
				break;
			}else {
				memberService.gradeUp(chkVal);
			}
		}
		
		return "redirect:/admin/member_list";
	}
	@RequestMapping(value = "admin/grade_down", method = RequestMethod.POST)
	public String grade_down(HttpServletRequest request) {
		
		String[] chkValues = request.getParameterValues("member_idx");
		for(String chkVal : chkValues) {
			MemberVO mVO = memberService.checkAdmin(chkVal);
			if(mVO.getGrade() == 1 || mVO.getGrade() == 3) {
				break;
			}else {
				memberService.gradeDown(chkVal);
			}
		}
		
		return "redirect:/admin/member_list";
	}
}
