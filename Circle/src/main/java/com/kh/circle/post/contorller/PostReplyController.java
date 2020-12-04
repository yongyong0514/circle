package com.kh.circle.post.contorller;

import java.util.List;

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
import com.kh.circle.post.entity.PostReply;
import com.kh.circle.post.service.PostRepService;
import com.kh.circle.post.service.PostService;

@Controller
@RequestMapping("/reply")
public class PostReplyController {
	
	
	@Autowired
	PostRepService repService;
	
	@Autowired
	PostService postService;
	
	
	@GetMapping("/replyInsert")
	public String insert(Model model) {

		return "reply/replyInsert";

	}
	
	@PostMapping("/replyInsert")
	public String insert(@RequestParam String post_repl_post, @RequestParam String post_repl_cont, HttpSession session) {
		
		PostReply postReply = new PostReply();
		String emp_no = ((EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();
		
		String emp_name = postService.postEmpInfo(emp_no);
		
		postReply.setPost_repl_post(post_repl_post);
		postReply.setPost_repl_emp(emp_no);
		postReply.setPost_repl_cont(post_repl_cont);
		
		
		
		return repService.replyInsert(postReply);
		
		
	}
	
	
	@GetMapping("/list")
	private List<PostReply> replyList(Model model){
		
		return repService.replyList(model);
	}
	
	@GetMapping("/update")
	private String replyUpdate(@RequestParam String post_repl_code, @RequestParam String post_repl_cont) {
	
		PostReply postReply = new PostReply();
		
		postReply.setPost_repl_code(post_repl_code);
		postReply.setPost_repl_cont(post_repl_cont);
		
		
		return repService.replyUpdate(postReply);
		
	}
	
	
	@PostMapping("/delete/{post_repl_code}")
	private String replyDelete(@PathVariable String post_repl_code) {
		
		return repService.replyDelete(post_repl_code);
	}
	
}
