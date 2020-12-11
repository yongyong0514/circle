package com.kh.circle.poll.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.poll.entity.Pagination;
import com.kh.circle.poll.entity.PreInputData;

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
	
	@Override
	public void insertPoll(PreInputData temp, HashMap<String, Object> questions) {
		//입력할 시퀀스 추출
		String sequence = sqlSession.selectOne("poll.sequence");
		//시퀀스 정보 입력
		temp.setSequence(sequence);
		//사전정보 입력
		sqlSession.insert("poll.preInsert", temp);
		//참가자 확인
		if(temp.getJoinMember().toString().equals("userDept")) {
			//로그인 유저의 부서 확인
			String userDept = sqlSession.selectOne("poll.findDept", temp);
			List<String> deptMember = new ArrayList<>();
			//부서 구성원 추출
			if(temp.getSubDept().toString().equals("Y")) {
				deptMember = sqlSession.selectList("poll.findWholeDeptMember", userDept);
			} else {
				deptMember = sqlSession.selectList("poll.findDeptMember", userDept);
			}
			temp.setDeptMember(deptMember);
			//부서 인원 입력
			sqlSession.insert("poll.insertDeptMember", temp);
		} 
		//직접 추가한 참가자 있는경우
		if(temp.getAttend() != null) {
			sqlSession.insert("poll.insertAttend", temp);
		}
		//참조자가 있는경우
		if(temp.getRefer() != null) {
			sqlSession.insert("poll.insertRefer", temp);
		}
		
		//log.info(questions.get("seq1").);
		
		//문항정보 입력
		sqlSession.insert("poll.insertQuestion", questions);
		
	}







}
