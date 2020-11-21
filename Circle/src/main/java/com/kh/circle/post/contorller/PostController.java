package com.kh.circle.post.contorller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostFile;
import com.kh.circle.post.service.PostService;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@GetMapping("/postList")
	public String postList() {
		return "post/postList";
	}
	

	
	@GetMapping("/postInsert")
	public String postInsert() {
		return "post/postInsert";
	}
	
	
}
