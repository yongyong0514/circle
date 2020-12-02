package com.kh.circle.post.contorller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostFile;
import com.kh.circle.post.entity.PostPaging;
import com.kh.circle.post.service.PostService;
import com.kh.circle.post.service.PostServiceImp;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private PostService postService;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private HttpServletResponse response;

	// post Mainpage
	@GetMapping("/postMain")
	public String postMain(Model model, Post post, PostPaging postPaging,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {


		List<Post> list = postService.postMain(model);


		int total = postService.countPost();

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";

		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		System.out.println("total~ : " + total);

		postPaging = new PostPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		model.addAttribute("postParts", list);
		model.addAttribute("paging", postPaging);
		model.addAttribute("viewAll", postService.selecePost(postPaging));

		System.out.println(postPaging);
		return "post/postMain";
	}

	// post List page
	@GetMapping("postList")
	public String postList() {
		return "/post/postList";
	}

	// post List / url
	@GetMapping("/postList/{url}")
	public String postReturn(@PathVariable String url, Model model, Post post, PostPaging postPaging,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		System.out.println("test :  " + url);

		// 게시판별 이름 찾기
		String postName = "";
		String post_type = "";

		List<Post> postTypeList = null;

		switch (url) {

		case "test":
			postName = "테스트";
			post_type = "POTY000001";
			break;
		case "employee":
			postName = "전사 게시판";
			post_type = "POTY000002";
			break;

		case "notice":
			postName = "공지사항";
			post_type = "POTY000003";
			break;

		case "":
			postName = "전체게시글";
			break;
		}

		List<Post> list = postService.postParts(post_type);

		int total = postService.countPost();

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";

		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		System.out.println("total~ : " + total);

		postPaging = new PostPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		model.addAttribute("post_type", post_type);
		model.addAttribute("postParts", list);
		model.addAttribute("postCount", postPaging);
		model.addAttribute("postSelect", postService.selecePost(postPaging));

		System.out.println("last test num : " + model);

		return "post/postList";
	}
	
	
	
	

	// 게시글 insert
	
	
	@GetMapping("/postInsert/{url}")
	public String postSelectInsert() {
System.out.println("1차 겟 ");
		return "post/postInsert";

	}
	

	

	
	@PostMapping("/postInsert/{url}")
	@ResponseBody
	public String insert(@ModelAttribute Post post,
						@RequestParam MultipartFile file,
						HttpSession session,
						@PathVariable String url) {
		
		
		System.out.println("vjvjvjv포스트 월em");
		request.getSession();
		String postName = "";
		String post_type = "";


		switch (url) {

		case "test":
			post_type = "POTY000001";
			break;
		case "employee":
			post_type = "POTY000002";
			break;

		case "notice":
			post_type = "POTY000003";
			break;

		case "":
			postName = "전체게시글";
			break;
		}
		post  = (Post)session.getAttribute("emp_info_emp_no");
		post  = (Post)session.getAttribute("emp_info_emp_name");
		post  = (Post)session.getAttribute("emp_info_emp_detp_code");
		post  = (Post)session.getAttribute("emp_info_emp_job_code");
	    post.setPost_type(post_type);
		System.out.println("post  con : " + post);
		
		postService.postInsert(post);
		
		return "redirect:post/postMain";
	}
	
	


}
