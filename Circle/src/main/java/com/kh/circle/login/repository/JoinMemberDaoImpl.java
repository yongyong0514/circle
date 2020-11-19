package com.kh.circle.login.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.login.entity.JoinMember;

@Repository
public class JoinMemberDaoImpl implements JoinMemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public JoinMember joinlogin(JoinMember joinmember) throws Exception {
		

		return sqlSession.selectOne("joinmember.login",joinmember);
	}

	/*
	 * @Override public JoinMember joinlogIn(JoinMember joinmember) {
	 * 
	 * 
	 * return sqlSession.selectOne("joinmember.login",joinmember); }
	 */

}
