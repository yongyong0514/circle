package com.kh.circle.poll.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class PollDaoImpl implements PollDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<HashMap<String, String>> homeList(String emp_no) {
		List<HashMap<String, String>> list = sqlSession.selectList("poll.homeList", emp_no);
		return list;
	}

}
