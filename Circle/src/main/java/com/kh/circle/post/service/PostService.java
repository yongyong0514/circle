package com.kh.circle.post.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.repository.PostDao;

public interface PostService {


	
	ResponseEntity<ByteArrayResource> download(String no) throws UnsupportedEncodingException, IOException;


	List<Post> postTest1(Post post, String type);


	List<Post> postTest2(Post post);








	
	
	/* 페이징 처리부분
	static PostService getInstance() {
		// TODO Auto-generated method stub
		return null;
	}

	List<Post> getPostList(int offset, int recordsPerPage);

	int getNoOfRecords();
	
*/



}
