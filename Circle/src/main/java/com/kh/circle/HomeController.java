package com.kh.circle;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.circle.login.entity.Member;
import com.kh.circle.login.repository.MemberDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@Autowired
	private MemberDao memberDao;
	
	@GetMapping("/login")
	public String login(HttpSession session) {
		//session.setAttribute("user", "admin");
		Member find = memberDao.login(Member.builder()
												.ISS_CODE("")
												.EMP_PER_INFO_EMP_NO("")
											.build());
		
		
		if(find != null) {
			session.setAttribute("user", find);
		}
		return "redirect:/";
	}
	
	//로그아웃 처리 컨트롤러
	// - 세션에 있는 user 정보를 삭제
	// - 루트 페이지(/)로 리다이렉트	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		//session.invalidate();
		session.removeAttribute("user");
		return "redirect:/";
	}
}
