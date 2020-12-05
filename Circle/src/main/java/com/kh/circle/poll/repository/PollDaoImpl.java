package com.kh.circle.poll.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.poll.entity.Pagination;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class PollDaoImpl implements PollDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<HashMap<String, String>> homeList(String empNo) {
		List<HashMap<String, String>> list = sqlSession.selectList("poll.homeList", empNo);
		return list;
	}

	@Override
	public List<HashMap<String, String>> getResult(HashMap<String, String> params) {
		List<HashMap<String, String>> list = sqlSession.selectList("poll.getResult", params);
		return list;
	}

	@Override
	public List<HashMap<String, String>> progressList(Pagination pageInfo) {
		List<HashMap<String, String>> list = sqlSession.selectList("poll.progressList", pageInfo);
		return list;
	}

	@Override
	public int countTotalProgressPost(Pagination totalPageInfo) {
		return sqlSession.selectOne("poll.countTotalProgressPost", totalPageInfo);
	}

}
