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
	public int countTotalProgressPost(Pagination prePageInfo) {
		return sqlSession.selectOne("poll.countTotalProgressPost", prePageInfo);
	}
	@Override
	public List<HashMap<String, String>> progressList(Pagination pageInfo) {
		List<HashMap<String, String>> list = sqlSession.selectList("poll.progressList", pageInfo);
		return list;
	}

	
	@Override
	public int countTotalFinishedPost(Pagination prePageInfo) {
		return sqlSession.selectOne("poll.countTotalFinishedPost", prePageInfo);
	}
	@Override
	public List<HashMap<String, String>> finishedList(Pagination pageInfo) {
		List<HashMap<String, String>> list = sqlSession.selectList("poll.finishedList", pageInfo);
		return list;
	}

	
	@Override
	public int countTotalMyPost(Pagination prePageInfo) {
		return sqlSession.selectOne("poll.countTotalMyPost", prePageInfo);
	}
	@Override
	public List<HashMap<String, String>> myList(Pagination pageInfo) {
		List<HashMap<String, String>> list = sqlSession.selectList("poll.myList", pageInfo);
		return list;
	}


	@Override
	public List<HashMap<String, String>> getQuestion(HashMap<String, String> params) {
		List<HashMap<String, String>> post = sqlSession.selectList("poll.getQuestion", params);
		return post;
	}
	@Override
	public int getTotalAttend(HashMap<String, String> params) {
		int totalAttend = sqlSession.selectOne("poll.getTotalAttend", params);
		return totalAttend;
	}
	@Override
	public int getRealAttend(HashMap<String, String> params) {
		return sqlSession.selectOne("poll.getRealAttend", params);
	}
	@Override
	public List<HashMap<String, String>> getQuesRealAttend(HashMap<String, String> params) {
		return sqlSession.selectList("poll.getQustRealAttend", params);
	}


	@Override
	public List<HashMap<String, String>> userInfo(String empNo) {
		return sqlSession.selectList("poll.userInfo", empNo);
	}







}
