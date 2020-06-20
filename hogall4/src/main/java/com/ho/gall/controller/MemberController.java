package com.ho.gall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ho.gall.model.service.MemberService;
import com.ho.gall.model.vo.Member;
import com.ho.gall.model.vo.Message;
import com.ho.gall.model.vo.Participating;
import com.ho.gall.model.vo.ProductVo;
import com.ho.gall.model.vo.WinningBid;

@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder bcEncoder;
	
	@Autowired
	private PasswordEncoder pwEncoder;
	 
	
	@RequestMapping("/member/login.do")
	public String login(Member m,Model model,HttpSession session,HttpServletRequest request,String pathurl) {
						//Member는 회원정보에 대한 vo객체
	//1.아이디만 넘겨서 정보를 가져와야 함
	//2.boolean isSame = Bcrypt.checkpwd(사용자가 보내온 비암호화된 패스워드, DB에서 꺼낸 암호화된 패스워드);
	//위 코드에 사용자가 보냉노 비암호된 패스워드에 m.getPassword()를, DB에서 꺼낸 암호화된 패스워드에 result.getPassword()를 함.
		String msg = "";
		String loc = "";
		
		Member result=service.login(m);
		System.out.println(result);
		boolean isSame = false;
		if(result!=null) {
			 isSame = BCrypt.checkpw(m.getPassword(), result.getPassword());//첫번째 매개변수는 사용자가 입력한 패스워드, 두번쨰매개변수는 DB에서 가져온 암호화된 패스워드
		}
		
		logger.info("pathurl : " + pathurl);  
		logger.info("아이디 : "+m.getMemberId());
		logger.info("비밀번호 : "+m.getPassword());
		
		logger.info("result가 비었나? :"+result);
		logger.info("비밀번호가 일치하나?"+isSame);
		ModelAndView mv = new ModelAndView();
		
		
		String uri =request.getRequestURI();
		
			 if(result!=null) {
				if(isSame) {					
					session.setAttribute("loggedMember",result);					
				} else {
					msg = "아이디 또는 비밀번호가 일치하지 않습니다.";
					 model.addAttribute("msg",msg);
					 model.addAttribute("loc",loc);
					 return "common/msg";
				}
			 
			 } else if(result==null) {
				 msg = "아이디 또는 비밀번호가 일치하지 않습니다.";
				 model.addAttribute("msg",msg);
				 model.addAttribute("loc",loc);
				 return "common/msg";
	 
			 }
			 
			 return "redirect:/"+pathurl; 
			
	   
			 
		
	    
	}
	@RequestMapping("/member/logout.do")
	public String logout(HttpSession session,String pathurl) {
		
		session.invalidate();
		logger.info("path" + pathurl);
		logger.info("로그아웃 "+session);
		return "redirect:/"+pathurl;
	}
	
	@RequestMapping("/member/enrollMember.do")
	public String enrollMember() {
		
		return "/member/enrollMember";
	}
	
	@RequestMapping("/member/signUp.do")
	public String signUp(String id,String password,String name,String nickName,String email,String zipCode,String address,String detailAddress) {
		ModelAndView mv=new ModelAndView();
		String bcPassword=bcEncoder.encode(password);
		Member m = new Member(); // 회원정보 vo객체
		m.setMemberId(id);
		m.setPassword(bcPassword);
		m.setName(name);
		m.setNickName(nickName);
		m.setEmail(email);
		m.setZipCode(zipCode);
		m.setAddress(address);
		m.setDetailAddress(detailAddress);
		
		int result=service.signup(m);
		
		return "redirect:/";
	}
	
	@RequestMapping("/member/idOverlap")
	@ResponseBody
	public boolean idCheck(String id) {
		/*Member m=new Member();
		m.setMemberId(id);*/
		
		boolean flag=true;
		logger.info("id : "+id);
		Member result=service.idCheck(id);//위에 주석풀고 service.login(m) 해두 댐
		if(result!=null) {
			flag=false;
		}else {
			flag=true;
		}
		
		return flag;
	}
	@RequestMapping("/member/nickNameoverlap")
	@ResponseBody
	public boolean nickNameCheck(String nickName) {
		
		boolean flag=true;
		logger.info("nickName : "+nickName);
		Member result=service.nickNameCheck(nickName);
		if(result!=null) {
			flag=false;
		}else {
			flag=true;
		}
		return flag;
	}
	
	@RequestMapping("/member/searchIdPw.do")
	public String searchIdPw() {
			
		return "/member/searchIdPw";
	
	}
	
	@RequestMapping("/member/idFinder")
	public ModelAndView idFinder(String userName,String email) {
		ModelAndView mv=new ModelAndView();
		Map<String,Object> map=new HashMap();
		
		map.put("userName", userName);
		map.put("email", email);
		
		String id=service.idFinder(map);
		mv.addObject("id",id);
		mv.setViewName("/member/idFinder");
		return mv;
	}
	
	@RequestMapping(value="/member/myPage")
	public ModelAndView myPage(String id) {
		ModelAndView mv=new ModelAndView();
		
		logger.info("id : "+id);
		
		List<Participating> list=service.bid(id);
		int bidCount = service.bidCount(id);
		
		List<WinningBid> list2=service.winning(id);		
		int winCount = service.winCount(id);
		
		mv.addObject("bidCount",bidCount);
		mv.addObject("winCount",winCount);
		mv.addObject("bid",list);
		mv.addObject("win",list2);
		mv.setViewName("/member/myPage");
		
		return mv;	
	}
	
	@RequestMapping(value="/member/pwCk")
	public ModelAndView pwCk(String id) {
		ModelAndView mv=new ModelAndView();
		
		mv.addObject("id",id);
		mv.setViewName("member/pwCk");
		
		return mv;
	}
	
	@RequestMapping(value="/member/change")
	public ModelAndView change(String id,String pwCk) {
		ModelAndView mv=new ModelAndView();
		
		Member m = service.selectPw(id);
		
		boolean isSame = BCrypt.checkpw(pwCk, m.getPassword()); //첫번째 매개변수는 사용자가 입력한 패스워드, 두번쨰매개변수는 DB에서 가져온 암호화된 패스워드
		
		String msg="";
		String loc="";
		
		if(isSame) {
			mv.setViewName("member/pwChange");
			
		}else if(!isSame) {
			loc="/member/pwCk";
			msg="비밀번호가 일치하지 않습니다.";
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.setViewName("common/msg");
		}
		
		
		return mv;
		
	}
	@RequestMapping("/member/inforChange")
	public ModelAndView inforChange(Member m , HttpSession session) {
		ModelAndView mv=new ModelAndView();
		
		int result = service.inforChange(m);
		
		
		mv.setViewName("member/pwChange");
		
		return mv;
		
		
	}
	
	@RequestMapping("/member/setting")
	public ModelAndView setting(Member m) {
		
		ModelAndView mv = new ModelAndView();
		
		List<Member> result = service.setting();
		
		
		mv.addObject("member",result);
		
		mv.setViewName("admin/setting");
		
		
		
		return mv;
	}
	
	@RequestMapping("/member/off")
	@ResponseBody
	public int memberOff(String id,String content) {
		logger.info("content : "+content);
		logger.info("id : " + id);
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("id", id);
		map.put("content", content);
		int result = service.memberOff(map);
		
		return result;
	}
	
	@RequestMapping("/member/on")
	@ResponseBody
	public int memberOn(String id) {
		logger.info("id : "+id);
		int result = service.memberOn(id);
		
		return result;
	}

	
	@RequestMapping(value = "/member/reason", produces = "application/text; charset=utf8")
	@ResponseBody
	public String reason(String id) {
		
		
		String reasonContent = service.reason(id);
		System.out.println(reasonContent);
		return reasonContent;
	}
	
	@RequestMapping(value = "/member/messagePage")
	public ModelAndView messagePage(String id,String forder) {
		ModelAndView mv = new ModelAndView();
		
		List<Message> receiver = service.receiver(id);
		List<Message> caller = service.caller(id);

		mv.addObject("receiver",receiver);
		mv.addObject("caller",caller);
		mv.addObject("forder",forder);
		mv.addObject("memberId",id);
		mv.setViewName("member/message");
		
		return mv;
	}
	
	@RequestMapping(value = "/member/message")
	public String MessageGo(Message ms,String pathurl) {
		
		int re = service.messageGo(ms);
		logger.info("url"+pathurl);
		return "redirect:/"+pathurl;
	}
}
