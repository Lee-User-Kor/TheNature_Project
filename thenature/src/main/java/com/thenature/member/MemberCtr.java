package com.thenature.member;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.thenature.common.Paging;
import com.thenature.common.SHA256Util;
import com.thenature.community.CommunitySvc;
import com.thenature.community.CommunityVO;
import com.thenature.image.ImageSvc;
import com.thenature.image.ImageVO;

@Controller
public class MemberCtr {
	
	@Autowired
	MemberSvc memberService;
	@Autowired
	CommunitySvc communityService;
	@Autowired
	PointSvc pointService;
	@Autowired
	PresentSvc presentService;
	@Autowired
	ImageSvc imageService;
	@Autowired
	CommentSvc commentService;
	
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join_get() {
		return "view/join";
	}
	@RequestMapping(value = "join_producer", method = RequestMethod.GET)
	public String join_get_producer() {
		return "view/join";
	}
	@RequestMapping(value = "ajax_checkId", method = RequestMethod.POST)
	@ResponseBody
	public int ajax_checkId_post(@RequestParam("userId") String id) {
		int result = 0;
		
		MemberVO mVO = memberService.checkId(id);
		if(mVO == null) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}
	@RequestMapping(value = "join_fail")
	public String join_fail() {
		return "view/join_fail";
	}
	@RequestMapping(value = "join_success")
	public String join_success() {
		return "view/join_success";
	}
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join_post(MemberVO mvo) {
		if(mvo.getName() == "" || mvo.getEmail_first() == "" || mvo.getEmail_second() == "" || mvo.getTel() == "") {
			return "redirect:/join_fail";
		}
		// �н����� ��ȣȭ
		mvo.setPw(SHA256Util.SHA256(mvo.getPw()));
		// �̸��� ���
		mvo.setEmail(mvo.getEmail_first() + "@" + mvo.getEmail_second());
		// sns, email ���ŵ��� �з�
		if(mvo.getAgree_sns() == null && mvo.getAgree_email() == null) {
			memberService.joinMemberAgreeNecessary(mvo);
		}else if(mvo.getAgree_sns() != null && mvo.getAgree_email() == null) {
			memberService.joinMemberAgreeSns(mvo);
		}else if(mvo.getAgree_sns() == null && mvo.getAgree_email() != null) {
			memberService.joinMemberAgreeEmail(mvo);
		}else {
			memberService.joinMemberAgreeAll(mvo);
		}
		return "redirect:/join_success";
	}
	@RequestMapping(value = "join_producer", method = RequestMethod.POST)
	public String join_post_producer(MemberVO mvo) {
		if(mvo.getName() == "" || mvo.getEmail_first() == "" || mvo.getEmail_second() == "" || mvo.getTel() == "") {
			return "redirect:/join_fail";
		}
		// �н����� ��ȣȭ
		mvo.setPw(SHA256Util.SHA256(mvo.getPw()));
		// �̸��� ���
		mvo.setEmail(mvo.getEmail_first() + "@" + mvo.getEmail_second());
		// sns, email ���ŵ��� �з�
		if(mvo.getAgree_sns() == null && mvo.getAgree_email() == null) {
			memberService.joinMemberAgreeNecessaryProducer(mvo);
		}else if(mvo.getAgree_sns() != null && mvo.getAgree_email() == null) {
			memberService.joinMemberAgreeSnsProducer(mvo);
		}else if(mvo.getAgree_sns() == null && mvo.getAgree_email() != null) {
			memberService.joinMemberAgreeEmailProducer(mvo);
		}else {
			memberService.joinMemberAgreeAllProducer(mvo);
		}
		return "redirect:/join_success";
	}

	@RequestMapping(value = "login")
	public String login() {
		return "view/login";
	}
	@RequestMapping(value = "login_fail")
	public String login_fail() {
		return "view/login_fail";
	}
	@RequestMapping(value = "login_normal", method = RequestMethod.POST)
	public String login_normal(MemberVO mvo, HttpSession session) {
		mvo.setPw(SHA256Util.SHA256(mvo.getPw()));
		MemberVO mVO = memberService.loginNormal(mvo);
		
		if(mVO != null) {
			session.setAttribute("member", mVO);
			return "redirect:/";
		}else {
			return "redirect:/login_fail";
		}
		
	}
	@RequestMapping(value = "login_producer")
	public String login_producer(MemberVO mvo, HttpSession session) {
		mvo.setPw(SHA256Util.SHA256(mvo.getPw()));
		MemberVO mVO = memberService.loginProducer(mvo);
		
		
		if(mVO != null) {
			if(mVO.getGrade() == 1 && mVO.getIs_producer().equals("y")) {
				session.setAttribute("AlertMsg", "승인 대기중인 공급자회원입니다.");
			}
			Date now = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String formatedNow = formatter.format(now);
			mVO.setLogin_time(formatedNow);
			session.setAttribute("member", mVO);
			return "redirect:/";
		}else {
			return "redirect:/login_fail";
		}
	}
	@RequestMapping(value = "logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("member");
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "find_id", method = RequestMethod.GET)
	public String find_id() {
		return "view/find_id";
	}
	
	@RequestMapping(value = "find_id", method = RequestMethod.POST)
	public String find_id(ModelMap modelMap, FindIdVO vo) {
		MemberVO mVO = new MemberVO();
		
		String email = vo.getE_id() + "@" + vo.getE_domain();
		vo.setE_id(email);
		mVO = memberService.findId(vo);
		
		if(mVO != null) {
			modelMap.addAttribute("findId", mVO.getId());
			return "view/login";
		} else {
			return "view/find_fail";
		}
	}

	@RequestMapping(value = "find_pw", method = RequestMethod.GET)
	public String find_pw() {
		return "view/find_pw";
	}
	
	@RequestMapping(value = "find_pw", method = RequestMethod.POST)
	public String find_pw(ModelMap modelMap, FindPwVO vo, HttpSession session) {
		MemberVO mVO = new MemberVO();
		
		String email = vo.getE_id() + "@" + vo.getE_domain();
		vo.setE_id(email);
		mVO = memberService.findPw(vo);
		session.setAttribute("mvo", mVO);
		
		if(mVO != null) {
			return "redirect:/find_pw_result";
		} else {
			return "view/find_fail";
		}
	}
	
	@RequestMapping(value = "find_pw_result", method = RequestMethod.GET)
	public String find_pw_result_get() {
		return "view/find_pw_result";
	}
	
	@RequestMapping(value = "find_pw_result", method = RequestMethod.POST)
	public String finw_pw_result(HttpServletRequest request, MemberVO mvo, HttpSession session) {
		String prePw = request.getParameter("prepassword");
		String newPw = request.getParameter("newpassword");
		String chkPw = request.getParameter("password");
		
		if(newPw.equals(chkPw)) {}
		else return "redirect:/change_fail";
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		mvo.setIdx(idx);
		mvo.setPw(prePw);
		MemberVO mVO = memberService.selectUser(mvo);
		System.out.println("mVO : " + mVO);
		if(mVO != null) {
			mVO.setPw(SHA256Util.SHA256(newPw));
			memberService.changePw(mVO);
			session.removeAttribute("member");
			return "redirect:/change_success";
		}else {
			return "redirect:/change_fail";
		}
	}
	
	
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage_get(String mode) {
		return "view/mypage";
	}
	@RequestMapping(value = "mypage", method = RequestMethod.POST)
	public String mypage_post(String modeWhat, HttpSession session, MemberVO mvo) {
		mvo.setPw(SHA256Util.SHA256(mvo.getPw()));
		MemberVO mVO =  (MemberVO) session.getAttribute("member");
		
		if(mvo.getPw().equals(mVO.getPw())) {
			if(modeWhat.equals("info")) {
				return "redirect:/change_memberinfo";
			}else if(modeWhat.equals("pw")) {
				return "redirect:/change_pw";
			}
		}else {
			return "redirect:/mypage?mode=" + modeWhat;
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "change_memberinfo", method = RequestMethod.GET)
	public String change_memberinfo_get(HttpSession session) {
		
		MemberVO mVO = (MemberVO) session.getAttribute("member");
		
		String[] email = mVO.getEmail().split("@");
		mVO.setEmail_first(email[0]);
		mVO.setEmail_second(email[1]);
		
		session.setAttribute("member", mVO);
		
		return "view/change_memberinfo";
	}
	@RequestMapping(value = "change_memberinfo", method = RequestMethod.POST)
	public String change_memberinfo_post(MemberVO mvo, HttpSession session) {
		
		if(mvo == null || mvo.getId() == "" || mvo.getName() == ""
				|| mvo.getEmail_first() == "" || mvo.getEmail_second() == "" 
				|| mvo.getTel() == "") {
			return "redirect:/change_fail";
		}
		
		session.removeAttribute("member");
		
		mvo.setEmail(mvo.getEmail_first() + "@" + mvo.getEmail_second());
		
		memberService.changeInfo(mvo);
		
		return "redirect:/change_success";
	}
	@RequestMapping(value = "change_fail")
	public String change_fail() {
		return "view/change_fail";
	}
	@RequestMapping(value = "change_success")
	public String change_success() {
		return "view/change_success";
	}
	
	@RequestMapping(value = "drop_member", method = RequestMethod.POST)
	public String drop_member(HttpServletRequest request, HttpSession session) {
		int memberIdx = Integer.parseInt(request.getParameter("member_idx"));
		memberService.dropMember(memberIdx);
		session.removeAttribute("member");
		return "redirect:/home";
	}
	
	@RequestMapping(value = "change_pw", method = RequestMethod.GET)
	public String change_pw_get() {
		return "view/change_pw";
	}
	@RequestMapping(value = "change_pw", method = RequestMethod.POST)
	public String change_pw_post(HttpServletRequest request, MemberVO mvo, HttpSession session) {
		String prePw = request.getParameter("prepassword");
		String newPw = request.getParameter("newpassword");
		String chkPw = request.getParameter("password");
		
		if(newPw.equals(chkPw)) {}
		else return "redirect:/change_fail";
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		mvo.setIdx(idx);
		mvo.setPw(SHA256Util.SHA256(prePw));
		MemberVO mVO = memberService.selectUser(mvo);
		
		if(mVO != null) {
			mVO.setPw(SHA256Util.SHA256(newPw));
			memberService.changePw(mVO);
			session.removeAttribute("member");
			return "redirect:/change_success";
		}else {
			return "redirect:/change_fail";
		}
		
	}
	
	@RequestMapping(value = "my_posting")
	public String my_posting(HttpSession session, ModelMap modelMap, Paging pag,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		MemberVO mVO = (MemberVO) session.getAttribute("member");
		
		List<CommunityVO> cVOList = communityService.selectMyPosting(mVO);
		
		int total = cVOList.size();
		
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
		pag.setMember_idx(mVO.getIdx());
		
		cVOList = communityService.selectMyPostingWithPag(pag);
		modelMap.addAttribute("mypostingList", cVOList);
		
		return "view/my_posting";
	}
	
	@RequestMapping(value = "my_posting_modify", method = RequestMethod.GET)
	public String my_posting_modify_get(String community_idx, ModelMap modelMap) {
		
		CommunityVO cVO = communityService.findCommunityByIdx(community_idx);
		ImageVO imgVO = imageService.findCommunityImageForModi(community_idx);
		
		modelMap.addAttribute("cVO", cVO);
		modelMap.addAttribute("imgVO", imgVO);
		
		return "view/community_write";
	}
	
	@RequestMapping(value = "my_posting_modify", method = RequestMethod.POST)
	public String my_postin_modify_post(CommunityVO cvo, MultipartFile[] img_path) {
		
		if(img_path[0].getOriginalFilename() == "") {
			communityService.updateCommunityByModi(cvo);
		}else {
//			String path = "C:\\The_Nature_space\\";
			String path = "/home/thewell/The_Nature_space/";
			File dir = new File(path + "community_file");
			if (!dir.exists()) {
				dir.mkdirs();
			}
			String originalFileName = img_path[0].getOriginalFilename();
			String afterDot = originalFileName.substring(originalFileName.indexOf("."));
			String sysFileName = UUID.randomUUID().toString() + afterDot;
			String saveFile = dir + File.separator + sysFileName;
			
			List<ImageVO> iVOList = imageService.findCommuImageList(cvo.getIdx());
			
			try {
				img_path[0].transferTo(new File(saveFile));
				
				communityService.updateCommunityByModi(cvo);
				
				ImageVO iVO = new ImageVO();
				iVO.setTable_name("board_community");
				iVO.setTable_idx(cvo.getIdx());
				iVO.setImg_path(sysFileName);
				if(iVOList.size() != 0) {
					imageService.updateCommunityImage(iVO);					
				} else if(iVOList.size() == 0) {
					imageService.writeCommunityImage(iVO);
				}
			} catch (Exception e) {
				System.out.println("ERROR MSG : " + e);
				e.printStackTrace();
			}
		}
		
		return "redirect:/my_posting";
	}
	
	@RequestMapping(value = "my_posting_del", method = RequestMethod.POST)
	public String my_postiong_del_get(HttpServletRequest request) {
		
		String[] chkValues = request.getParameterValues("community_idx");
		for(String chkVal : chkValues) {
//			System.out.println("chkVal : " + chkVal);
			communityService.deleteCommunity(chkVal);
			commentService.cmtDeleteAboutCommunity(chkVal);
		}
		return "redirect:/my_posting";
	}
	
	@RequestMapping(value = "manage_point")
	public String manage_point(HttpSession session, ModelMap modelMap) {
		MemberVO mVO = (MemberVO) session.getAttribute("member");
		List<PointVO> pVOList = pointService.selectMyPoint(mVO);
		modelMap.addAttribute("pointVO", pVOList);
		
		return "view/manage_point";
	}

	@RequestMapping(value = "present_check")
	public String present_check(HttpSession session, ModelMap modelMap) {
		MemberVO mVO = (MemberVO) session.getAttribute("member");
		List<PresentVO> presentVOList = presentService.selectMyPresent(mVO);
		modelMap.addAttribute("presentVO", presentVOList);
		modelMap.addAttribute("presentListLength", presentVOList.size());
		
		return "view/present_check";
	}
	
	@RequestMapping(value = "ajax_present", method = RequestMethod.POST)
	@ResponseBody
	public int present_post(@RequestParam("member_idx") int idx, HttpSession session) {
		int result = 0;
		int row = presentService.addPresent(idx);
		
		MemberVO mVO = (MemberVO) session.getAttribute("member");
		
		PointVO pVO = new PointVO();
		pVO.setMember_idx(mVO.getIdx());
		pVO.setPoint(100);
		pVO.setContent("출석체크보상");
		pVO.setPoint_what("p");
		int row2 = pointService.addPoint(pVO);
		
		if(row == 1) {
			result = 1;
		} else {
			result = 0;
		}
		return result;
	}
	
}
