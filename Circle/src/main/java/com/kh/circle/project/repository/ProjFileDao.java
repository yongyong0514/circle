package com.kh.circle.project.repository;

import com.kh.circle.project.entity.ProjFile;

public interface ProjFileDao {

	String insert(ProjFile projFile, String iss_code, String pro_code);
	ProjFile find(String files_code);

} 
