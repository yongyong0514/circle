package com.kh.circle.project.repository;

import java.util.List;

import com.kh.circle.post.entity.PostPaging;
import com.kh.circle.project.entity.ProjFile;
import com.kh.circle.project.entity.ProjPaging;
import com.kh.circle.project.entity.Project;

public interface ProjectDao {

	List<Project> projMain(String emp_no);

	List<Project> projIssMain(String pro_code);

	int countProj();

	String projEmpNo(String emp_no);


	List<Project> projMember();

	void projInsert(Project project, String emp_no);

	List<Project> issMember();

	String projInsertIss(Project project);

	List<Project> issSitu();
 
	List<Project> issProg();

	String projGetPro(Project project);


	List<Project> projIssAll(String emp_no);

	List<Project> projDetail(String pro_code);

	List<Project> projDetail2(String pro_code);

	List<Project> projMemberlist(String pro_code);

	List<ProjFile> projDetail3(String pro_code);

	List<Project> projGetIss(String pro_code);

	List<ProjFile> projIssDetail(String iss_code);



}
