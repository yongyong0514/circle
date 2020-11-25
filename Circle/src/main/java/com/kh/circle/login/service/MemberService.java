
 package com.kh.circle.login.service;
 
 import javax.servlet.http.HttpSession;

import com.kh.circle.login.entity.EmpInfo;
 
 public interface MemberService {
 
	 public EmpInfo login(EmpInfo empInfo, HttpSession session) throws Exception;
	 
	 //임의로 설계
		/* public Member logIn(Member member); */
 
 }
 