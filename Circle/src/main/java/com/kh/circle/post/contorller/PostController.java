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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.circle.login.entity.EmpInfo;
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

		// 게시판별 이름 찾기
		String postName = "";
		String post_type = "";

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

		postPaging = new PostPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		model.addAttribute("post_type", post_type);
		model.addAttribute("postParts", list);
		model.addAttribute("postCount", postPaging);
		model.addAttribute("postSelect", postService.selecePost(postPaging));

		return "post/postList";
	}

	// 게시글 insert

	@GetMapping("/postInsert")
	public String insert(Model model) {

		List<Post> postType = postService.insertType();

		model.addAttribute("postType", postType);

		return "post/postInsert";

	}

	// insert postMapping

	@PostMapping("/postInsertAdd")
	public String insert(@ModelAttribute Post post, HttpSession session) {

		String emp_no = ((EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();

		String emp_name = postService.postEmpInfo(emp_no);

		post.setPost_emp(emp_no);

		postService.postInsert(post);

		return "redirect:postMain";
	}

	// post View page
	@GetMapping("/postView")
	public String postView(Model model, @RequestParam("post_code") String post_code) {

		model.addAttribute("postView", postService.viewDetail(post_code));

		return "post/postView";
	}

	// post update

	@GetMapping("/postUpdate")
	public String postUpdate(Model model, @RequestParam("post_code") String post_code) {

		Post postCheck = postService.postCheck(post_code);
		model.addAttribute("postCheck", postCheck);

		return "post/postUpdate";
	}

	@PostMapping("/postUpdate")
	public String postUpdate(@ModelAttribute Post post, HttpSession session,
			@RequestParam("post_code") String post_code) {

		postService.postUpdate(post);

		return "redirect: postView?post_code=" + post.getPost_code();
	}

	// 게시글 삭제

	@GetMapping("/postDelete")
	public String postDelete(@RequestParam("post_code") String post_code) {
		postService.postDelete(post_code);

		return "redirect: postMain";
	}

}
