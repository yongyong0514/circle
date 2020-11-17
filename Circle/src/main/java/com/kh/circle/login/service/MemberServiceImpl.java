
 package com.kh.circle.login.service;
 
 import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.circle.login.entity.Member; 
 import com.kh.circle.login.repository.MemberDao;
 
 @Service
 public class MemberServiceImpl implements MemberService {
 
  @Autowired 
  MemberDao dao;
  
  @Override 
  public Member login(Member member, HttpSession session) throws Exception { 
	  
	Member status = dao.login(member); 
	if(status==null) {
	  return null;
	}else {
		session.setAttribute("status", status);
		session.setAttribute("userid", member.getEMP_INFO_EMP_NO());
		
		return status;
	}
  }
  }
 