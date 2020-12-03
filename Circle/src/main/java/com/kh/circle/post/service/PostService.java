package com.kh.circle.post.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostPaging;
import com.kh.circle.post.repository.PostDao;

public interface PostService {


	List<Post> postMain(Model model);


	List<Post> postParts(String post_type);


	int countPost();


	List<Post> selecePost(PostPaging postPaging);


	void postInsert(Post post);

	
	List<Post> insertType();


	String InsertEmpInfo(String emp_info_emp_no);





}
