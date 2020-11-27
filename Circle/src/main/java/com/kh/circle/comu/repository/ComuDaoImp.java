package com.kh.circle.comu.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	 public List<Comu> comuList(int start,int end) throws Exception{
		 
		 Map<String,Object> map = new HashMap<String,Object>();
		 
		 //페이징 처리 스타트와 엔드
		 map.put("start", start);
		 map.put("end", end);
		 
		 return sqlSession.selectList("comu.comuList",map); 
		 }

	@Override
	public int comuListarticle() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("comu.comuListarticle");
	}
}
