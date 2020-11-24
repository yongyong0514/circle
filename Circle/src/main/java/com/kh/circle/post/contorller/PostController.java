package com.kh.circle.post.contorller;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostPaging;
import com.kh.circle.post.service.PostService;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PostService postService;
	
	
	@GetMapping("/post")
	public String postSidebar(Model model) {
		
		
		List<Post> postDeptInfo = sqlSession.selectList("post.postDeptInfo");
		model.addAttribute("postDeptInfo", postDeptInfo);
		
		return "/postSidebar";
	}
	
	
	@GetMapping("/postList")
	public String postList( Model model) {
		
		
		List<Post> postList = sqlSession.selectList("post.postList");
		model.addAttribute("postList", postList);
		
		return "post/postList";
	}
	


	
	@GetMapping("/postInsert")
	public String postInsert(Model model, @ModelAttribute("post.postList") Post post) {
		
		
		model.addAttribute("post", post);
		
		return "post/postInsert";
	}
	
	
}
