package com.kh.circle.project.repository;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface ProjSaveDao {

	void save(MultipartFile iss_file, String file_code) throws IllegalStateException, IOException;

	byte[] load(String files_code) throws IOException;

}
 