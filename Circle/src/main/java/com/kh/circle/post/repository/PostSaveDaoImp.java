package com.kh.circle.post.repository;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

public class PostSaveDaoImp implements PostSaveDao{

	private final String path = "c:/upload/post";
	
	
	@Override
	public void save(MultipartFile insert, String file_no) throws IllegalStateException, IOException {

		File target = new File(path, file_no);
		insert.transferTo(target);
		
		
	}


	@Override
	public byte[] load(String file_code) throws IOException  {

		File target = new File(path, String.valueOf(file_code));
		byte[] data = FileUtils.readFileToByteArray(target);
		
		return data;
	}

}
