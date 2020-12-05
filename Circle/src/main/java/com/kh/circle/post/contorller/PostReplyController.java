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
	
	@PostMapping("/insert")
	public void replyInsert(PostReply postReply,HttpSession session) {

		
		String emp_info_emp_no =(String)session.getAttribute("emp_info_emp_no");
		
		postReply.setEmp_info_emp_no(emp_info_emp_no);
		
		repService.replyInsert(postReply);
	}
	
	
	@GetMapping("/list")
	private String replyList(String post_code,
			Model model,
			PostReply reply){
		
		List<PostReply> replyList = repService.replyList(post_code);
		
		return "reply/list";
	}
	
	@GetMapping("list_json")
	public List<PostReply> list_json(String post_code){
		return repService.replyList(post_code);
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
