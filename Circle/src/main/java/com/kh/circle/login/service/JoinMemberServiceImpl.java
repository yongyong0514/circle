package com.kh.circle.login.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.circle.login.entity.JoinMember;
import com.kh.circle.login.repository.JoinMemberDao;

@Service
public class JoinMemberServiceImpl implements JoinMemberService {
	
	@Autowired
	JoinMemberDao dao;
	
	@Override
	public JoinMember login(JoinMember joinmember, HttpSession session) throws Exception {
		
		JoinMember join = dao.joinlogin(joinmember);
		if(join == null) {
			return null;
		}else {
			session.setAttribute("join", join);
			session.setAttribute("joinName", joinmember.getJOB_INFO_NAME());
			
			return join;
		}
	}

	/*
	 * @Override public JoinMember logIn(JoinMember joinmember) {
	 * 
	 * 
	 * return dao.joinlogIn(joinmember); }
	 */
}
