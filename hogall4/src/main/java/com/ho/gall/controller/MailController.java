package com.ho.gall.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ho.gall.common.RandomNum;

@Controller
public class MailController {

	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping("/mail/mailSending")
	@ResponseBody
	public String mailSending(String tomail,HttpServletRequest request) {
		RandomNum rdn = new RandomNum();
		ModelAndView mv = new ModelAndView();
		String number=rdn.numberGen(6,2); //무작위 난수발생 메소드
		String setFrom = "hogall";
		String title="hogall 인증번호입니다.";
		String content=number+"인증번호칸에 입력해 주세요.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
			
			messageHelper.setFrom(setFrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			mailSender.send(message);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		//model.addAttribute("number",number);
		//mv.addObject("number",number);
		/*
		 * request.setAttribute("number",number);
		 * mv.setViewName("/member/enrollMember");
		 */
		return number;
		
	}
}
