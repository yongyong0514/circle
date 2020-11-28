package com.kh.circle.empInfo.repository;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.empInfo.entity.CareerInfo;

@Repository
public class CareerInfoRepositoryImpl implements CareerInfoRepository{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<CareerInfo> careerInfoList(String emp_no) {
		List<CareerInfo> careerInfoList = sqlSession.selectList("careerInfo.searchWithEmpNo", emp_no);
		
		
		return careerInfoList;
	}

}
