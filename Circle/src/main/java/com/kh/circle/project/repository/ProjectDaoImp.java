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
	public List<Project> projMain(String emp_no) {

		List<Project> projMain = sqlSession.selectList("project.projMain", emp_no); 
		
		return projMain;
	}


	@Override
	public List<Project> projIssMain(String post_code) {

		
		List<Project> projIssMain = sqlSession.selectList("project.projIssMain", post_code);
		
		return projIssMain;
	}


	@Override
	public int countProj() {

		int num = sqlSession.selectOne("project.projCount");
		
		return 0;
	}


	@Override
	public String projEmpNo(String emp_no) {

		String myEmp = sqlSession.selectOne("project.empNo", emp_no);
		return myEmp;
	}



	@Override
	public List<Project> projMember() {

		List<Project> projMember = sqlSession.selectList("project.projMember");
		
		return projMember;
	}


	@Override
	public void projInsert(Project project) {

		
		sqlSession.insert("project.projInsert", project);
	}



}
