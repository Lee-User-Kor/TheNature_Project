package com.thenature.inquiry;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.thenature.common.Paging;

@Controller
public class InquiryCtr {
	
	@Autowired NoticeSvc noticeService;
	@Autowired QnaSvc qnaService;
	
	@RequestMapping(value = "notice")
	public String notice(ModelMap modelMap, Paging pag,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			String search_keyword) {
		
		if(search_keyword == null || search_keyword == "") {
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
			
			List<NoticeVO> nVOList = noticeService.getAllNotice(pag);
			modelMap.addAttribute("noticeList", nVOList);
		} else {
			int total = noticeService.countContentsBySearch(search_keyword);
			
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
			
			List<NoticeVO> nVOList = noticeService.getSearchNotice(pag);
			modelMap.addAttribute("noticeList", nVOList);
		}
		
		return "view/notice";
	}
	
	@RequestMapping(value = "notice_detail", method = RequestMethod.GET)
	public String notice_detail(int no, ModelMap modelMap) {
		
		Object obj = no;
		NoticeVO nVO = noticeService.getDetailNotice(obj);
		
		int cnt = nVO.getView_count();
		cnt = cnt + 1;
		nVO.setView_count(cnt);
		
		int row = noticeService.plusDetailNoticeCount(nVO);
		
		modelMap.addAttribute("noticeVO", nVO);
		
		int lastIdx = noticeService.getLastIdx();
		modelMap.addAttribute("lastIdx", lastIdx);
		
		return "view/notice_detail";
	}
	
	@RequestMapping(value = "qna")
	public String qna(ModelMap modelMap, Paging pag,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			String search_keyword) {
		
		if(search_keyword == null || search_keyword == "") {
			int total = qnaService.countContentsQna();
			
			if(nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if(cntPerPage == null) {
				cntPerPage = "10";
			}
			
			pag = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			modelMap.addAttribute("paging", pag);
			
			List<QnaVO> qVOList = qnaService.getAllQna(pag);
			modelMap.addAttribute("qnaList", qVOList);
		} else {
			int total = qnaService.countContentsBySearchQna(search_keyword);
			
			if(nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if(cntPerPage == null) {
				cntPerPage = "10";
			}
			
			pag = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			pag.setSearch_keyword(search_keyword);
			modelMap.addAttribute("paging", pag);
			
			List<QnaVO> qVOList = qnaService.getSearchQna(pag);
			modelMap.addAttribute("qnaList", qVOList);
		}
		
		return "view/qna";
	}
	
//	@RequestMapping(value = "qna_detail")
//	public String qna_detail() {
//		return "view/qna_detail";
//	}
	
	@RequestMapping(value = "qna_detail")
	public String qna_detail2(int no, ModelMap modelMap) {
		Object obj = no;
		QnaVO qVO = qnaService.getDetailQna(obj);
		modelMap.addAttribute("QnaVO", qVO);
		
		return "view/qna_detail2";
	}
	
	@RequestMapping(value = "qna_write", method = RequestMethod.GET)
	public String qna_wirte_get() {
		return "view/qna_write";
	}
	
	@RequestMapping(value = "qna_write", method = RequestMethod.POST)
	public String qna_write_post(QnaVO qVO, HttpServletRequest request) {
		int row = qnaService.addQna(qVO);
		return "redirect:/qna";
	}
	
	@RequestMapping(value = "qna_modify", method = RequestMethod.GET)
	public String qna_modify(int no, ModelMap modelMap) {
		Object obj = no;
		QnaVO qVO = qnaService.getDetailQna(obj);
		modelMap.addAttribute("QnaVO", qVO);
		
		return "view/qna_modify";
	}
	
	@RequestMapping(value = "qna_modify", method = RequestMethod.POST)
	public String qna_modify(QnaVO qVO, HttpServletRequest request) {
		int row = qnaService.modifyQna(qVO);
		
		return "redirect:/qna_detail?no=" + qVO.getIdx();
	}
	
	@RequestMapping(value = "qna_delete", method = RequestMethod.GET)
	public String qna_delete(int no, ModelMap modelMap) {
		Object obj = no;
		int row = qnaService.deleteQna(obj);
		return "redirect:/qna";
	}
}
