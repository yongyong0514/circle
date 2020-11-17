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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.circle.login.entity.Member;
import com.kh.circle.login.repository.MemberDao;
import com.kh.circle.login.service.MemberService;

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
	
	
	
	//로그인 처리 컨트롤러
	// - 세션에 user라는 이름으로 admin이라는 값을 저장(샘플 아이디)
	// - 루트 페이지(/)로 리다이렉트
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MemberService service;
	
	/*
	 * @GetMapping("/login") public String login(HttpSession session) { return
	 * "mainPage"; }
	 */
	
	@GetMapping("/login")
	public ModelAndView login(@ModelAttribute HttpSession session, Member member) throws Exception {
		Member status = service.login(member, session);
		ModelAndView mav = new ModelAndView();
		//로그인 실패
		if(status==null) {
			System.out.println("로그인 실패잉");
			mav.setViewName("login");
			mav.addObject("mag","error");
			
			//사용자
		}else if(status.equals("1")){
			mav.setViewName("/common/mainPage");
		}else {
			mav.setViewName("/common/mainPage");
		}
		return mav;
	}

		//session.setAttribute("user", "admin");
		/*
		 * Member find = memberDao.login(Member.builder() .EMP_INFO_EMP_NO("")
		 * .EMP_INFO_PWD("") .build()); if(find != null) { session.setAttribute("user",
		 * find); } return "redirect:/";
		 */
	
	
	//로그아웃 처리 컨트롤러
	// - 세션에 있는 user 정보를 삭제
	// - 루트 페이지(/)로 리다이렉트	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		//session.invalidate();
		session.removeAttribute("user");
		return "redirect:/";
	}
	
	//회원 전용 페이지
	@GetMapping("/member")
	public String member(Model model) {
		model.addAttribute("test", "hello");
		return "member";///WEB-INF/views/member.jsp
	}
	
	//일반 페이지
	@GetMapping("/normal")
	public String normal() {
		return "normal";///WEB-INF/views/normal.jsp
	}
	
}
/*
 * package com.kh.circle;
 * 
 * import java.text.DateFormat; import java.util.Date; import java.util.Locale;
 * 
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpSession;
 * 
 * import org.slf4j.Logger; import org.slf4j.LoggerFactory; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestMethod; import
 * org.springframework.web.servlet.mvc.support.RedirectAttributes;
 * 
 * import com.kh.circle.login.entity.Member; import
 * com.kh.circle.login.repository.MemberDao; import
 * com.kh.circle.login.service.MemberService;
 * 
 *//**
	 * Handles requests for the application home page.
	 */
/*
 * @Controller public class HomeController {
 * 
 * private static final Logger logger =
 * LoggerFactory.getLogger(HomeController.class);
 * 
 *//**
	 * Simply selects the home view to render by returning its name.
	 *//*
		 * @Autowired MemberService service;
		 * 
		 * @RequestMapping(value = "/login", method = RequestMethod.POST) public String
		 * login(Member member, HttpServletRequest req, RedirectAttributes rttr) throws
		 * Exception{ logger.info("post login");
		 * 
		 * HttpSession session = req.getSession(); Member login = service.login(member);
		 * 
		 * String path=""; if(login == null) { session.setAttribute("member", null);
		 * rttr.addFlashAttribute("msg", false);
		 * 
		 * }else { session.setAttribute("member", login); path="mainPage.jsp";
		 * 
		 * }
		 * 
		 * return "redirect:/"; }
		 * 
		 * 
		 * 
		 * @Autowired private MemberDao memberDao;
		 * 
		 * 
		 * 
		 * @GetMapping("/login") public String login(HttpSession session) {
		 * //session.setAttribute("user", "admin"); Member find =
		 * memberDao.login(Member.builder() .ISS_CODE("") .EMP_PER_INFO_EMP_NO("")
		 * .build());
		 * 
		 * 
		 * if(find != null) { session.setAttribute("user", find); } return "redirect:/";
		 * }
		 * 
		 * 
		 * //로그아웃 처리 컨트롤러 // - 세션에 있는 user 정보를 삭제 // - 루트 페이지(/)로 리다이렉트
		 * 
		 * @GetMapping("/logout") public String logout(HttpSession session) {
		 * //session.invalidate(); session.removeAttribute("user"); return "redirect:/";
		 * } }
		 */