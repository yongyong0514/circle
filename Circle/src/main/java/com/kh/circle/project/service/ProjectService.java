package com.kh.circle.project.service;

import java.util.List;

import com.kh.circle.project.entity.Project;

public interface ProjectService {


	List<Project> projIssMain(String pro_code);

	List<Project> projMain(String emp_no);

	int countPost();

	String projEmpNo(String emp_no);

	List<Project> projCheck(String emp_no);

}
