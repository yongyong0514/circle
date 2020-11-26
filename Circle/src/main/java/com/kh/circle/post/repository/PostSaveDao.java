package com.kh.circle.post.repository;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface PostSaveDao {

	void save(MultipartFile file, String file_no) throws IllegalStateException, IOException;



}
