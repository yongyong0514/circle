package com.kh.circle.empInfo.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.empInfo.entity.EmpInfoAll;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	public List<EmpInfoAll> empInfoList(Map<String, Object> inputMap) {
		
		log.info(">>> inputMap" + inputMap);

		List<EmpInfoAll> empList = sqlSession.selectList("empInfo.empList", inputMap);
		
		log.info(">>> empList" + empList);
		
		return empList;
	}

}
