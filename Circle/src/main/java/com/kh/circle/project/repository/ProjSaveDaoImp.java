package com.kh.circle.project.repository;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;



@Repository
public class ProjSaveDaoImp implements ProjSaveDao{

	private final String path = "D:/resources/iss";
	
	@Override
	public void save(MultipartFile iss_file, String file_code) throws IllegalStateException, IOException {

		File target = new File(path, file_code);
		
		iss_file.transferTo(target);
		
	}

}

