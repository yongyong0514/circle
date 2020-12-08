package com.kh.circle.project.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.circle.project.entity.Project;

public interface ProjectService {


	List<Project> projIssMain(String pro_code);

	List<Project> projMain(String emp_no);

	int countPost();

	String projEmpNo(String emp_no);


	List<Project> projMember();

	void projInsert(Project project);

	List<Project> issMember();

	void projInsertIss(Project project, MultipartFile iss_file) throws IllegalStateException, IOException;

	List<Project> issProg();

	List<Project> issSitu();


}
