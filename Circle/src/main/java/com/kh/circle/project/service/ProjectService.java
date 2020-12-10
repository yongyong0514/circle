package com.kh.circle.project.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostPaging;
import com.kh.circle.project.entity.ProjPaging;
import com.kh.circle.project.entity.Project;

public interface ProjectService {


	List<Project> projIssMain(String pro_code);

	List<Project> projMain(String emp_no);

	int countPost();

	String projEmpNo(String emp_no);


	List<Project> projMember();

	void projInsert(Project project, String emp_no);

	List<Project> issMember();

	void projInsertIss(Project project, MultipartFile iss_file) throws IllegalStateException, IOException;

	List<Project> issProg();
 
	List<Project> issSitu();

	List<Project> selecetProject(ProjPaging projPaging);

	List<Post> selecePost(PostPaging postPaging);


}
