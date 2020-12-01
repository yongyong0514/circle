
 package com.kh.circle.login.service;
 
 import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.circle.login.entity.EmpInfo; 
 import com.kh.circle.login.repository.MemberDao;
 
 @Service
 public class MemberServiceImpl implements MemberService {
 
  @Autowired 
  MemberDao dao;
  
  @Override 
  public EmpInfo login(EmpInfo empInfo, HttpSession session) throws Exception { 
	
	//잘 받아왔는지 확인
	//System.out.println("service empInfo: " + empInfo);
	
	EmpInfo status = dao.login(empInfo); 
	
	//repository에서 잘 받아왔는지 확인
	/* System.out.println("service after dao empInfo: "+status); */
	
	if(status==null) {
	  return null;
	}else {
		session.setAttribute("status", status);
		session.setAttribute("userid", empInfo.getEmp_info_emp_no());
		
		
		return status;
	}
  }

	/*
	 * @Override public Member logIn(Member member) {
	 * 
	 * 
	 * return dao.logIn(member); }
	 */
  }
 