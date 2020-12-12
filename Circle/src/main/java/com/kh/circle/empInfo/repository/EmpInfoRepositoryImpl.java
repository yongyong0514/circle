package com.kh.circle.empInfo.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.addressBook.entity.PagingInfo;
import com.kh.circle.empInfo.entity.EmpInfoAll;

import lombok.extern.slf4j.Slf4j;

@Repository
public class EmpInfoRepositoryImpl implements EmpInfoRepository{
	@Autowired
	private SqlSession sqlSession;
	
	//사원 1명의 정보 조회
	@Override
	public EmpInfoAll empInfoOne(String emp_no) {
		
		EmpInfoAll empInfoOne = sqlSession.selectOne("empInfo.searchWithEmpNo", emp_no);
		
		return empInfoOne;
	}

	
	@Override
	public int total(PagingInfo pInfo) {
		
		int total = sqlSession.selectOne("empInfo.total", pInfo);
		
		return total;
	}

	@Override
	public List<EmpInfoAll> empInfoList(PagingInfo pInfo) {
		
		List<EmpInfoAll> empList = sqlSession.selectList("empInfo.empList", pInfo);
		
		return empList;
	}
}
