package com.kh.circle.empInfo.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.empInfo.entity.RewardDiscipline;

@Repository
public class RewardDisciplineRepositoryImpl implements RewardDisciplineRepository{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<RewardDiscipline> rdInfoList(String emp_no) {
		
		List<RewardDiscipline> rdInfoList = sqlSession.selectList("rewardDisciplineInfo.searchWithEmpNo", emp_no);
		
		return rdInfoList;
	}

}
