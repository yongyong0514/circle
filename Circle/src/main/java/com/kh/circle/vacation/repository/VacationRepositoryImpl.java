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

		return vList;
	}

	@Override
	public String annualTerm(String emp_no) {
		
		String annualTerm = sqlSession.selectOne("vacation.annualTerm", emp_no);
		
		return annualTerm;
	}

	@Override
	public int annualLeave(String annualTerm) {
		
		int annualLeave = sqlSession.selectOne("vacation.annualLeave", annualTerm);
		
		return annualLeave;
	}

	@Override
	public double usedVacationDays(String emp_no) {

		double usedVacationDays = sqlSession.selectOne("vacation.usedVacationDays", emp_no);
		
		return usedVacationDays;
	}

}
