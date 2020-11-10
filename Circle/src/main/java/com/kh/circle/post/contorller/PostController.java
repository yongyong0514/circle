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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostFile;
import com.kh.circle.post.service.PostService;
/*
@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostService postService;

	@GetMapping("/postAdd")
	public String postAdd() {
		return "post/postAdd";
	}
	
	
	@PostMapping("/postAdd")
	public String postAdd(
			@ModelAttribute Post post,
			@RequestParam MultipartFile insert
			) throws IllegalStateException, IOException {
			
			postService.add(post, insert);
		
				return "post/postMain";
	}
	
	
	
	@Autowired
	private SqlSession sqlSession;
	
	@GetMapping("/postMain")
	public String postMain(Model model) {
		
		
		List<Post> list = sqlSession.selectList("post.list");
		model.addAttribute("list", list);
		
		return "post/postMain";
	}
	
	
	@GetMapping("/download")
	public void download(HttpServletResponse response,
							@RequestParam int no) throws IOException {
		
		PostFile file = sqlSession.selectOne("post_file.find", no);
		
		File target = new File("c:/upload/post", String.valueOf(file.getFile_code()));
		byte[] data = FileUtils.readFileToByteArray(target);
		
		response.setHeader("Content-Length",  String.valueOf(file.getFile_size()));
		response.setHeader("Content-Type", "application/octet-stream; charset=UTF-8");
		response.setHeader("Content-Disposition", "attachment; filename=\""+URLEncoder.encode(file.getFile_cname(), "UTF-8")+"\"");
		
		response.getOutputStream().write(data);
	}
	
	
	@GetMapping("/download2")
	public ResponseEntity<ByteArrayResource> downdload2(@RequestParam String no) throws UnsupportedEncodingException, IOException{
		
		ResponseEntity<ByteArrayResource> entity = postService.download(no);
		return null;
		
	}
	
}
*/