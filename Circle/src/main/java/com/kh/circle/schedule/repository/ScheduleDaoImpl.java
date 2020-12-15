package com.kh.circle.schedule.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.schedule.entity.SchAjax;
import com.kh.circle.schedule.entity.Entry;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ScheduleDaoImpl implements ScheduleDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<SchAjax> list(Map<String, Object> map) {
		List<SchAjax> list =  sqlSession.selectList("sch.selectMap",map);
		
		return list;
	}
	@Override
	public List<SchAjax> vacationList(Map<String, Object> map) {
		List<SchAjax> list = sqlSession.selectList("sch.selectVacationMap", map);
		return list;
	}
	@Override
	public List<SchAjax> projectList(Map<String, Object> map) {
		List<SchAjax> list = sqlSession.selectList("sch.selecProjecttMap", map);
		return list;
	}
	
	@Override
	public List<HashMap<String, String>> entryList(String id) {
		
		List<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
		
		String checkId = id.substring(0, 4);
		switch(checkId) {
			case "SCHN" : list = sqlSession.selectList("sch.selectEntryList", id);break;
			default		: list = sqlSession.selectList("sch.selectEntryList", id);break;
		}
		
		return list;
	}
	
	@Override
	public void insert(HashMap<String, Object> insertEvent) {
		String seq = sqlSession.selectOne("sch.seq");
		insertEvent.put("seq", seq);
		//일정 데이터 입력
		sqlSession.insert("sch.insert", insertEvent);
		
		String check = insertEvent.get("attender").toString();
		
		//일정 참가자 입력
		if(check.length() < 13) {
			sqlSession.insert("sch.insertOneMember",insertEvent);
		} else {
			sqlSession.insert("sch.insertMember", insertEvent);
		}
		
	}

	@Override
	public void delete(String id) {
		
		sqlSession.update("sch.delete", id);
	}

	@Override
	public void update(HashMap<String, Object> updateEvent) {
		//일정 데이터 수정
		sqlSession.update("sch.update", updateEvent);
		//일정 참가자 전체 삭제
		sqlSession.delete("sch.allDeleteMember", updateEvent);
		
		String check = updateEvent.get("attender").toString();
		
		//일정 참가자 입력
		if(check.length() < 13) {
			sqlSession.insert("sch.updateOneMember",updateEvent);
		} else {
			sqlSession.insert("sch.updateMember", updateEvent);
		}
		
	}
	


}
