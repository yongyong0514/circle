package com.kh.circle.sign.repository;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.circle.sign.vo.SignWrite;

@Repository
public class SignDaoImpl implements SignDao {
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public void signWrite(SignWrite signWrite) throws Exception {
		sqlSession.insert("signWrite.insert", signWrite);
	}

}
