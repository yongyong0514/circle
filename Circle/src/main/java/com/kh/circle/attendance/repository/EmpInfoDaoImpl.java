package com.kh.circle.attendance.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.circle.attendance.entity.EmpInfo;

public class EmpInfoDaoImpl implements EmpInfoDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public EmpInfo getEmpInfo(String emp_no) {
		return sqlSession.selectOne("empInfo.getEmpInfo", emp_no);
	}
	
	
}
