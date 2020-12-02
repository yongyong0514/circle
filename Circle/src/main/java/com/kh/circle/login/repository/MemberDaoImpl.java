package com.kh.circle.login.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.circle.login.entity.EmpInfo;

import lombok.extern.log4j.Log4j;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private BCryptPasswordEncoder encoder;

	@Override
	public EmpInfo login(EmpInfo empInfo) {
		
		//잘 받아왔는지 확인
		/* System.out.println("repository empInfo: " + empInfo); */
		
		EmpInfo tempEmpInfo =  sqlSession.selectOne("empInfo.login", empInfo);
		
		/* System.out.println("after sqlSession empInfo: " + tempEmpInfo); */
		
		return tempEmpInfo;
		
	/*	if(encoder.matches(member.getEMP_INFO_EMP_NO(), find.getEMP_INFO_PWD())) {//성공
			return find;
		}
		else {//실패
			return null;
		}
	*/
		}

		/*
		 * @Override public Member logIn(Member member) {
		 * 
		 * return sqlSession.selectOne("member.login",member); }
		 */
}




/*package com.kh.circle.login.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.circle.login.entity.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private BCryptPasswordEncoder encoder;

	@Override
	public Member login(Member member) throws Exception {
		
		return sqlSession.selectOne("member-mapper.login",member); */
		
		
		
/*
 * if(encoder.matches(member.getISS_CODE(),find.getEMP_PER_INFO_EMP_NO()))
 * {//성공시 System.out.println("왔어"); return find; }else {//실패시
 * 
 * return null; } } }
 */
		 
