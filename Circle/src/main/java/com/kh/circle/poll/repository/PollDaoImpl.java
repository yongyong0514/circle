package com.kh.circle.poll.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.poll.entity.Pagination;
import com.kh.circle.poll.entity.PreInputData;
import com.kh.circle.poll.entity.Question;

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
	public void insertPoll(PreInputData temp, List<Question> questions) {
		//입력할 시퀀스 추출
		String sequence = sqlSession.selectOne("poll.sequence");
		
		
		//시퀀스 정보 입력
		temp.setSequence(sequence);
		
		log.info(temp.getSequence());
		
		
		//사전정보 입력
		sqlSession.insert("poll.preInsert", temp);
		//참가자 확인
		if(temp.getJoinMember().toString().equals("userDept")) {
			//로그인 유저의 부서 확인
			String userDept = sqlSession.selectOne("poll.findDept", temp);
			List<String> deptMember = new ArrayList<>();
			//부서 구성원 추출
			if(temp.getSubDept() != null && temp.getSubDept().toString().equals("Y")) {
				deptMember = sqlSession.selectList("poll.findWholeDeptMember", userDept);
			} else {
				deptMember = sqlSession.selectList("poll.findDeptMember", userDept);
			}
			temp.setDeptMember(deptMember);
			
			log.info(temp.getDeptMember().toString());
			
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
		
		
		
		
		//문항정보 입력
		for (Question question : questions) {
			//셀렉트형일때
			if(question.getType().equals("select")) {
				//설문 시퀀스 정보 입력
				question.setPopn(sequence);
				//문항 시퀀스 추출
				String questionSeq = sqlSession.selectOne("poll.questionSeq");
				//문항 시퀀스 정보 입력
				question.setPopq(questionSeq);
				
				//문항 질문 입력
				sqlSession.insert("poll.insertSelectQuestion", question);
				//문항 선택지 입력
				sqlSession.insert("poll.insertSelectSelection", question);
				
			//점수형일때
			} else if(question.getType().equals("score")) {
				//설문 시퀀스 정보 입력
				question.setPopn(sequence);
				//문항 시퀀스 추출
				String questionSeq = sqlSession.selectOne("poll.questionSeq");
				//문항 시퀀스 정보 입력
				question.setPopq(questionSeq);
				
				//문항 질문 입력
				sqlSession.insert("poll.insertScoreQuestion", question);
				//문항 선택지 입력
				sqlSession.insert("poll.insertScoreSelection",question);
			//텍스트형일때
			} else {
				//설문 시퀀스 정보 입력
				question.setPopn(sequence);
				//문항 시퀀스 추출
				String questionSeq = sqlSession.selectOne("poll.questionSeq");
				//문항 시퀀스 정보 입력
				question.setPopq(questionSeq);
				
				//문항 질문 입력
				sqlSession.insert("poll.insertTextQuestion", question);
				//문항 질문 입력
				sqlSession.insert("poll.insertTextSelection", question);
			}
		}
	}


	@Override
	public String insertAttendedServey(List<HashMap<String, String>> list) {

		//DB에 설문 참가 완료 정보 입력
		sqlSession.insert("poll.insertAttendedServey", list);
		
		//POST 식별코드 추출
		String url = sqlSession.selectOne("poll.selectPostCode", list);
		
		return url;
	}







}
