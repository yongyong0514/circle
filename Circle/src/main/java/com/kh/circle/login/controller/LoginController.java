package com.kh.circle.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.circle.login.entity.Member;
import com.kh.circle.login.repository.MemberDao;
import com.kh.circle.login.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
public class LoginController {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MemberService service;
	
	@GetMapping("/login")
	public String login(){
		return "home";
	}
	
	
	@PostMapping("/login")
	public String login(Member member,HttpServletRequest req,RedirectAttributes rttr){
		log.info("선수입장");
		
		
		HttpSession session = req.getSession();
		Member login = service.logIn(member);
		System.out.println("세션 값 : "+session);
		System.out.println("login : "+login);
		
		if(login==null){
			System.out.println("null값 입력");
			System.out.println("member : "+member);
			session.setAttribute("member", null);
			
			rttr.addFlashAttribute("message",false);
			System.out.println("rttr : "+rttr );
		}else {
			System.out.println("login 값알려주세요 : "+login);
			session.setAttribute("member", login);
			System.out.println("session "+session);
		}
		
		
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session){
		
		session.invalidate();
		
		return "home";
	}
}
