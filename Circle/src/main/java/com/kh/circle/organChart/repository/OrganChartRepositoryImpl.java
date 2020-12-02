package com.kh.circle.organChart.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.organChart.entity.OrganDept;
import com.kh.circle.organChart.entity.OrganEmp;

@Repository
public class OrganChartRepositoryImpl implements OrganChartRepository {
	@Autowired
	private SqlSession sqlSession;
	
//	@Override
//	public int maxLevel() {
//		return sqlSession.selectOne("organChart.maxLevel");
//	}
	

	@Override
	public List<OrganDept> oDList() {
		
		List<OrganDept> oDList = sqlSession.selectList("organChart.deptList");
		
		return oDList;
	}

	
	@Override
	public List<OrganEmp> oEList(String dept_code) {

		List<OrganEmp> oEList = sqlSession.selectList("organChart.empList", dept_code);
		
		return oEList;
	}

}
