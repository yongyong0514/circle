package com.kh.circle.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.circle.project.entity.Project;
import com.kh.circle.project.repository.ProjectDao;



@Service
public class ProjectServiceImp implements ProjectService{

	@Autowired
	private ProjectDao projDao;
	
	


	@Override
	public List<Project> projIssMain(String pro_code) {
		return projDao.projIssMain(pro_code);
	}


	@Override
	public int countPost() {
		return projDao.countProj();
	}


	@Override
	public String projEmpNo(String emp_no) {
		return projDao.projEmpNo(emp_no);
	}


	@Override
	public List<Project> projMain(String emp_no) {
		return projDao.projMain(emp_no);
	}




	@Override
	public List<Project> projMember() {
		return projDao.projMember();
	}


	@Override
	public void projInsert(Project project) {

		projDao.projInsert(project);
	}





}
