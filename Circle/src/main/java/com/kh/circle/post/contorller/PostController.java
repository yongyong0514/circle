package com.kh.circle.post.contorller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.circle.login.entity.EmpInfo;
import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostPaging;
import com.kh.circle.post.service.PostRepService;
import com.kh.circle.post.service.PostService;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostService postService;

	@Autowired
	private PostRepService repService;

	// post Mainpage

	@GetMapping("/postMain")
	public String postMain(Model model, Post post, PostPaging postPaging, // 뷰페이징
			@RequestParam(value = "nowPage", required = false) String nowPage, // 뷰페이징
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, // 뷰페이징
			@RequestParam(required = false) String type, // 검색
			@RequestParam(required = false) String keyword // 검색
	) {

		List<Post> list = postService.postMain(model, postPaging); // 리스트

		/* 뷰페이징 시작 */
		int total = postService.countPost();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";

		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		String post_type = "";
		postPaging = new PostPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), post_type);

		/* 뷰페이징 종료 */

		model.addAttribute("postParts", list);
		model.addAttribute("paging", postPaging);
		model.addAttribute("postPaging", postService.selecePost(postPaging));
		model.addAttribute("postSelect", postService.selecePost(postPaging));

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
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(required = false) String type, // 검색
			@RequestParam(required = false) String keyword // 검색
			) {

		// 게시판별 이름 찾기
		String postName = "";
		String post_type = "";

		switch (url) {

		case "notice":
			postName = "공지사항";
			post_type = "POTY000001";
			break;
		case "employee":
			postName = "전사 게시판";
			post_type = "POTY000002";
			break;

		case "team":
			postName = "개발본부";
			post_type = "POTY000003";
			break;
		case "etc":
			postName = "다른부서";
			post_type = "POTY000004";
			break;

		case "":
			postName = "전체게시글";
			break;
		}

		List<Post> list = postService.postParts(post_type);

		// 이름 및 코드 찾기 종료

		// 뷰페이징
		int total = postService.countPost();

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";

		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		postPaging = new PostPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), post_type);

		// 뷰페이징 끝

		model.addAttribute("url", url);
		model.addAttribute("post_type", post_type);
		model.addAttribute("postParts", list);
		model.addAttribute("paging", postPaging);
		model.addAttribute("postPaging", postService.selecePost2(postPaging));
		model.addAttribute("postSelect2", postService.selecePost2(postPaging));

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
	public String insert(@ModelAttribute Post post, HttpSession session,PostPaging postPaging,Model model ,// 뷰페이징
			@RequestParam(value = "nowPage", required = false) String nowPage, // 뷰페이징
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		String emp_no = ((EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();

		String emp_name = postService.postEmpInfo(emp_no);

		post.setPost_emp(emp_no);

		postService.postInsert(post);
		

		/* 뷰페이징 시작 */
		int total = postService.countPost();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";

		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		String post_type = "";
		postPaging = new PostPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), post_type);

		/* 뷰페이징 종료 */

		model.addAttribute("paging", postPaging);
		model.addAttribute("postPaging", postService.selecePost(postPaging));

		return "redirect:postMain";
	}

	// post View page
	@GetMapping("/postView")
	public String postView(Post post, Model model, @RequestParam("post_code") String post_code, 
			HttpSession session, @ModelAttribute Post test, //제약 조건용
			 PostPaging postPaging, // 뷰페이징
				@RequestParam(value = "nowPage", required = false) String nowPage, // 뷰페이징
				@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		
		// 내정보 제약 조건용

		String emp_no = ((EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();

		
		String emp_name = postService.postEmpNo(emp_no);
		
		model.addAttribute("empNo", emp_name);

		
		
		//게시글 정보
		List<Post> detail =  postService.viewDetail(post_code);
		String post_emp = postService.viewEmpNo(post_code);
		model.addAttribute("viewEmpNo", post_emp);
		
		
		
		
		// view
		model.addAttribute("postView", detail);
		// end

		/* 뷰페이징 시작 */
		int total = postService.countPost();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";

		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		String post_type = "";
		postPaging = new PostPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), post_type);

		model.addAttribute("paging", postPaging);
		model.addAttribute("postPaging", postService.selecePost(postPaging));
		/* 뷰페이징 종료 */

		
		
		// 댓글

		List<Post> replyList = repService.replyList(post.getPost_code());

		List<Post> reply = repService.replyEmp(post.getPost_code());
		
		
		
		model.addAttribute("replyEmp", reply);
		model.addAttribute("listReply", replyList);
		// 댓글 끝

		return "post/postView";
	}

	// post update

	@GetMapping("/postUpdate")
	public String postUpdate(Model model, @RequestParam("post_code") String post_code, PostPaging postPaging, // 뷰페이징
			@RequestParam(value = "nowPage", required = false) String nowPage, // 뷰페이징
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		Post postCheck = postService.postCheck(post_code);

		model.addAttribute("postCheck", postCheck);
		
		/* 뷰페이징 시작 */
		int total = postService.countPost();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";

		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		String post_type = "";
		postPaging = new PostPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), post_type);

		model.addAttribute("paging", postPaging);
		model.addAttribute("postPaging", postService.selecePost(postPaging));
		/* 뷰페이징 종료 */

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

	// 게시글 검색

	@GetMapping("/postSearch")
	public String postSearch(Model model, PostPaging postPaging,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(required = false) String type, // 검색
			@RequestParam(required = false) String keyword // 검색
	) {

		// 검색
		List<Post> list = postService.postSearch(postPaging);

		int count = postService.countPostSearch(postPaging);

		// 뷰페이징
		int total = postService.countPost();
		String post_type = "";

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";

		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		postPaging = new PostPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), post_type);

		model.addAttribute("getSearch", list);
		model.addAttribute("paging",
				new PostPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), post_type));

		return "post/postSearch";
	}

	// 덧글 삽입

	@GetMapping("replyInsert")
	public String replyInsert() {

		return "reply/replyInsert";
	}

	@PostMapping("/replyInsertAdd")
	public String replyInsertAdd(Post post, PostPaging paging, Model mode, HttpSession session) {

		String emp_no = ((EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();

		String emp_name = postService.postEmpInfo(emp_no);

		post.setPost_repl_emp(emp_no);
		repService.replyInsert(post);

		return "redirect: postView?post_code=" + post.getPost_repl_post();
	}

	
	
	// 덧글 수정 실패!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
	// 덧글 수정 get

	
	
	//덧글 삭제
	@GetMapping("/postReplyDelete")
	public String postReplyDelete(@RequestParam("post_repl_code")String post_repl_code, @RequestParam("post_code")String post_code, Post post){

		
		repService.replyDelete(post_repl_code);

	return "redirect: postView?post_code=" + post.getPost_code();
}

}