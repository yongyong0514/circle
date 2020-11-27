package com.kh.circle.post.repository;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;


@Repository
public class PostSaveDaoImp implements PostSaveDao{

	private final String path = "c:/upload/post";

	@Override
	public void save(MultipartFile file, String file_no) throws IllegalStateException, IOException {

		
		File target = new File(path, String.valueOf(file_no));
		file.transferTo(target);
		
	}




}
