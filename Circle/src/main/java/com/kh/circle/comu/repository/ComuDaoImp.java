package com.kh.circle.comu.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.comu.entity.Comu;

@Repository
public class ComuDaoImp implements ComuDao {
	@Autowired
	private SqlSession sqlSession;
	
	//기능구현 주석
	 @Override 
	 public List<Comu> List() throws Exception{
		 
		 return sqlSession.selectList("comu.comuList"); 
		 }
}
