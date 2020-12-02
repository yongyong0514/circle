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
	public void file(MultipartFile file, String fileCode) {
		// TODO Auto-generated method stub
		
	}




}
