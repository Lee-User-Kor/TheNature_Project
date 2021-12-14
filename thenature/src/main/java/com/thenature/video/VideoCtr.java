package com.thenature.video;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.thenature.common.Paging;

@Controller
public class VideoCtr {

	@Autowired TreeVideoSvc tvService;
	@Autowired TreeArSvc taService;
	
	@RequestMapping(value = "tree_video")
	public String tree_video(ModelMap modelMap, Paging pag,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		int total = tvService.countContentsTv();
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
		
		List<TreeVideoVO> tvVO = tvService.treeVideoList(pag);
		modelMap.addAttribute("tvVO", tvVO);
		return "view/tree_video";
	}

	@RequestMapping(value = "tree_ar")
	public String tree_ar(ModelMap modelMap, Paging pag,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		int total = taService.countContentsTa();
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
		
		List<TreeArVO> taVO = taService.treeArList(pag);
		modelMap.addAttribute("taVO", taVO);
		return "view/tree_ar";
	}
	
}
