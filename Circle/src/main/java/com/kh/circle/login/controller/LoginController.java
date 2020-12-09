package com.kh.circle.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.circle.login.entity.EmpInfo;
import com.kh.circle.login.repository.MemberDao;
import com.kh.circle.login.service.JoinMemberService;
import com.kh.circle.login.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/empInfo")
public class LoginController {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private JoinMemberService joinservice;
	

	
	@GetMapping("/login")
	public String login(){
		return "home";//home
	}
	
	
	@PostMapping("/login")
	public String login(EmpInfo empInfo,
			/*JoinMember joinmember*/HttpServletRequest req,RedirectAttributes rttr) throws Exception{
		/* log.info("선수입장"); */
		
		
		/* System.out.println("controller empInfo:" + empInfo); */
		
		HttpSession session = req.getSession();
		EmpInfo login = service.login(empInfo, session);
		
		
		
		//출근 확인용
		session.setAttribute("sTime", null);			//출근시간
		session.setAttribute("working", "false");		//출근여부
		
		
		/* JoinMember joinlogin = joinservice.login(joinmember, session); */
		
		/*
		 * System.out.println("세션 값 : "+session); System.out.println("login : "+login);
		 */
		
		if(login==null){
			/*
			 * System.out.println("null값 입력"); System.out.println("empInfo : "+empInfo);
			 */
			
			session.setAttribute("empInfo", null);
			/* session.setAttribute("joinmember", null); */
			
			rttr.addFlashAttribute("message",false);
			/* System.out.println("rttr : "+rttr ); */
			
		}else {
			/* System.out.println("login 값알려주세요 : "+login); */
			session.setAttribute("empInfo", login);

			/* session.setAttribute("joinmember", joinlogin); */
			/* System.out.println("session "+session); */
			return "redirect:/common/mainPage";
		}
		return "redirect:/";
		/* common/mainPage */
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session){
		
		session.invalidate();
		
		return "home";
	}
	
	
	/*
	 * @GetMapping("/joinmember") public String joinmember(HttpSession session){
	 * 
	 * session.invalidate();
	 * 
	 * return "home"; }
	 */
}
