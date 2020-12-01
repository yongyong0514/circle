package com.kh.circle.vacation.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.vacation.entity.Vacation;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class VacationRepositoryImpl implements VacationRepository{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Vacation> vacationList(String emp_no) {
		
		List<Vacation> vList = sqlSession.selectList("vacation.searchWithEmpNo", emp_no);
		Vacation v =  (Vacation) vList.get(0);

		log.info("v: " + v);
		
		return vList;
	}

}
