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

	// 자세히보기
	List<Post> postMain(Model model);

	List<Post> postParts(String post_type);

	int countPost();

	List<Post> selecePost(PostPaging postPaging);

	// 입력하기
	List<Post> insertType();

	String postEmpInfo(String emp_no);

	void postInsert(Post post);
	
	//상세보기

	List<Post> viewDetail(String post_code);

	void postUpdate(Post post);

	Post postCheck(String post_code);

	
	//삭제하기
	void postDelete(String post_code);
}
