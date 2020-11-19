package com.kh.circle.login.service;

import javax.servlet.http.HttpSession;

import com.kh.circle.login.entity.JoinMember;

public interface JoinMemberService {
	public JoinMember login(JoinMember joinmember, HttpSession session) throws Exception;
	
	/* public JoinMember logIn(JoinMember joinmember); */
}
