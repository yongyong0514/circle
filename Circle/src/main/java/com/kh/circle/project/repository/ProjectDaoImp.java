package com.kh.circle.project.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.project.entity.Project;


@Repository
public class ProjectDaoImp implements ProjectDao{

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List<Project> projMain(Project project) {

		List<Project> projMain = sqlSession.selectList("project.projMain", project); 
		
		return projMain;
	}


	@Override
	public List<Project> projIssMain(String post_code) {

		
		List<Project> projIssMain = sqlSession.selectList("project.projIssMain", post_code);
		
		return projIssMain;
	}

}
