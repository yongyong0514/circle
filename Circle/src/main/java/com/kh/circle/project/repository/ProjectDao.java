package com.kh.circle.project.repository;

import java.util.List;

import com.kh.circle.project.entity.Project;

public interface ProjectDao {

	List<Project> projMain(String emp_no);

	List<Project> projIssMain(String pro_code);

	int countProj();

	String projEmpNo(String emp_no);


}
