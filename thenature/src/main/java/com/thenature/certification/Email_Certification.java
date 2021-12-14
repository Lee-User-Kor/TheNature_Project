package com.thenature.certification;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thenature.member.FindIdVO;
import com.thenature.member.FindPwVO;
import com.thenature.member.MemberSvc;
import com.thenature.member.MemberVO;

@Controller
public class Email_Certification {

	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MemberSvc memberService;
	
	EmailVO email = new EmailVO();
	
	public int Send_Email(String email) throws Exception {

		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

		int certification = (int) (Math.random() * 899999) + 100000;

		messageHelper.setFrom("ljh@thewell79.com"); // 보내는사람 생략하거나 하면 정상작동을 안함
		messageHelper.setTo(email); // 받는사람 이메일
		messageHelper.setSubject("The_Nature 인증번호"); // 메일제목은 생략이 가능하다
		messageHelper.setText("안녕하세요. The_Nature 인증번호는 : " + certification + " 입니다."); // 메일 내용

		mailSender.send(message);

		return certification;
	}
	
	@RequestMapping(value = "sendEmail", method = RequestMethod.GET)
	public String sendEmail_get(String emailAddr, HttpSession session) throws Exception {
		
		int certification = Send_Email(emailAddr);
		
		session.setAttribute("certification", certification);
		
		return "view/emailCheck";
	}
	
	@RequestMapping(value = "sendEmail", method = RequestMethod.POST)
	@ResponseBody
	public int sendEmail_post(@RequestParam("popCertification") String popCertification, HttpSession session) {
		System.out.println("ajax 진입");
		int check = 0;
		
		System.out.println("popCertification : "+ popCertification);
		System.out.println("certification : "+ session.getAttribute("certification"));
		
		int num = Integer.parseInt(popCertification);
		int certification = (Integer) session.getAttribute("certification");
		
		if(num == certification) {
			check = 1;
		}else {
			check = 0;
		}
		
		return check;
	}
	
	// 인증을 누를 때 회원정보와 일치해야 인증 진행(id 찾기)
	@RequestMapping(value = "name_email_check", method = RequestMethod.POST)
	public @ResponseBody String name_email_check(FindIdVO vo) {
		MemberVO mvo = new MemberVO();
		mvo = memberService.findId(vo);

		int check = 1;
		if (mvo != null) {
			check = 0;
		}
		return String.valueOf(check);
	}

	// 인증을 누를 때 회원정보와 일치해야 인증 진행(pw 찾기)
	@RequestMapping(value = "id_email_check", method = RequestMethod.POST)
	public @ResponseBody String id_email_check(FindPwVO vo) {
		MemberVO mvo = new MemberVO();
		mvo = memberService.findPw(vo);

		int check = 1;
		if (mvo != null) {
			check = 0;
		}
		return String.valueOf(check);
	}
	
}
