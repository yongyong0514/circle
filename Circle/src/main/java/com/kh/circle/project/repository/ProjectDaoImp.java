package com.kh.circle.project.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.project.entity.Project;

@Repository
public class ProjectDaoImp implements ProjectDao {

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

	@Override
	public List<Project> issMember() {

		List<Project> issMember = sqlSession.selectList("project.issMember");
		return issMember;
	}

	@Override
	public String projInsertIss(Project project) {
	
		String iss_code = sqlSession.selectOne("project.seq"); 
		project.setIss_code(iss_code);		
				sqlSession.insert("project.projInsertIss", project);
				
		return iss_code; 
		
		

	}

	@Override
	public List<Project> issSitu() {

		List<Project> issSitu = sqlSession.selectList("project.issSitu");
		return issSitu;
	}

	@Override
	public List<Project> issProg() {
		List<Project> issProg = sqlSession.selectList("project.issProg");
		return issProg;
	}

}
