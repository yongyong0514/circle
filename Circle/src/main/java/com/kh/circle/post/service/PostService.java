package com.kh.circle.post.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostPaging;

public interface PostService {


	ResponseEntity<ByteArrayResource> download(String no) throws UnsupportedEncodingException, IOException;

	Object getList(PostPaging paging);


}
