package com.kh.circle.empInfo.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.empInfo.entity.HREvaluation;

@Repository
public class HREvaluationRepositoryImpl implements HREvaluationRepository{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<HREvaluation> hREvaluationList(String emp_no) {
		
		List<HREvaluation> hREvaluationList = sqlSession.selectList("hREvaluation.searchWithEmpNo", emp_no);
		
		return hREvaluationList;
	}

}
