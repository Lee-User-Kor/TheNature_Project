package com.thenature.tree;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.thenature.common.Paging;
import com.thenature.image.ImageSvc;
import com.thenature.image.ImageVO;

@Controller
public class TreeCtr {
	
	@Autowired TreeCommentarySvc tcService;
	@Autowired ImageSvc imageService;
	@Autowired TreeCardSvc cardService;
	
	@RequestMapping(value = "tree_commentary")
	public String tree_commentary(ModelMap modelMap, Paging pag,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		int total = tcService.countContentsTc();
		System.out.println("count : " + total);
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "9";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {
			cntPerPage = "9";
		}
		pag = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		modelMap.addAttribute("paging", pag);
		
		List<TreeCommentaryVO> tcVOList = tcService.tcList(pag);
		modelMap.addAttribute("treeCommentaryVO", tcVOList);
		
		return "view/tree_commentary";
	}

	@RequestMapping(value = "tree_commentary_detail", method = RequestMethod.GET)
	public String tree_commentary_detail(int no, ModelMap modelMap) {
		Object obj = no;
		TreeCommentaryVO tcVO = tcService.getDetailCommentary(obj);
		List<ImageVO> iVO = imageService.selectCommentaryDetailImage(obj);
		modelMap.addAttribute("tcVO", tcVO);
		modelMap.addAttribute("imageVO", iVO);
		
		return "view/tree_commentary_detail";
	}

	@RequestMapping(value = "tree_card")
	public String tree_card(ModelMap modelMap, Paging pag,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		List<String> totalcnt = cardService.getCount();
		int total = totalcnt.size();
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "4";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {
			cntPerPage = "4";
		}
		pag = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		modelMap.addAttribute("paging", pag);
		
		List<String> categoryArr = cardService.findCategory(pag);
		List<TreeCardVO> cardVO = cardService.treeCardList();
		
		modelMap.addAttribute("cardVO", cardVO);
		modelMap.addAttribute("categoryArr", categoryArr);
//		modelMap.addAttribute("cardVO", cardVO);
		
		return "view/tree_card";
	}
	
}
