package com.kh.circle.login.repository;

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
	public Member login(Member member) {
		Member find = sqlSession.selectOne("member.login",member);
		
		if(encoder.matches(member.getISS_CODE(),find.getEMP_PER_INFO_EMP_NO())) {//성공시 
			System.out.println("왔어");
			return find;
		}else {//실패시
			
			return null;
		}
	}
	
}
