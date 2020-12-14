package com.kh.circle.vacation.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.vacation.entity.Vacation;
import com.kh.circle.vacation.entity.VacationInfo;

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

		Object obj = sqlSession.selectOne("vacation.usedVacationDays", emp_no);
		if(obj != null) {
			return (double) obj;
		} else {
			return 0.0;
		}
	}

	@Override
	public void addVacation(VacationInfo vacationInfo) {
		sqlSession.insert("vacation.addVacation", vacationInfo);
	}
	
	@Override
	public String myDeptCode(String emp_no) {
		return sqlSession.selectOne("vacation.myDeptCode", emp_no);
	}
	
	@Override
	public String ceoEmpNo() {
		return sqlSession.selectOne("vacation.ceoEmpNo");
	}
	
	@Override
	public String upperEmp(String dept_code) {

		return sqlSession.selectOne("vacation.isUpperEmp", dept_code);
	}
	
	@Override
	public String highDept(String dept_code) {
		return sqlSession.selectOne("vacation.highDept", dept_code);
	}
}
