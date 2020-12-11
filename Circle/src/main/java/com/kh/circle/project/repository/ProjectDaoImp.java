package com.kh.circle.project.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostPaging;
import com.kh.circle.project.entity.ProjPaging;
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
	public void projInsert(Project project, String emp_no) {

		String pro_code = sqlSession.selectOne("project.projSeq"); 

		project.setPro_code(pro_code);
		String iss_code = sqlSession.selectOne("project.issSeq"); 
		project.setIss_code(iss_code);
		
		String getPro_code = sqlSession.selectOne("project.sysproj");
		
		sqlSession.insert("project.projInsert", project);
		
		
		String myEmp = sqlSession.selectOne("project.empNo", emp_no);
		
		project.setIss_emp_no(emp_no);
		project.setIss_pro_code(getPro_code);
		
		String iss_title = "새로운 프로젝트 생성을 축하합니다";
		project.setIss_title(iss_title);
		
		String iss_cont = "새로운 프로젝트에 다양한 업무와 팀원을 초대해보세요";
		project.setIss_cont(iss_cont);
		String iss_prog_code = "PROG000001";
		project.setIss_prog_code(iss_prog_code);
		
		
		String iss_situ_code = "SITU000001";
		System.out.println(iss_situ_code);
		project.setIss_situ_code(iss_situ_code);
		
		System.out.println("DDDDDDDDDDDDWE" +  project + "sksksksksks");
		
		sqlSession.insert("project.proIssInsert", project);
		
	}

	@Override
	public List<Project> issMember() {

		List<Project> issMember = sqlSession.selectList("project.issMember");
		return issMember;
	}

	@Override
	public String projInsertIss(Project project) {
	
		String iss_code = sqlSession.selectOne("project.issSeq"); 
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

	@Override
	public String projGetPro(Project project) {
		// TODO Auto-generated method stub
		return null;
	}


}
