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
	public List<Project> projMain(Project project) {
		return projDao.projMain(project);
	}


	@Override
	public List<Project> projIssMain(String pro_code) {
		return projDao.projIssMain(pro_code);
	}



}
