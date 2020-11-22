package com.kh.circle.schedule.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.schedule.entity.SchAjax;
import com.kh.circle.schedule.entity.SchAjaxEntry;

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
//			default		: list = sqlSession.selectList("sch.selectVacationEntryList", id);break;
		}
		
		log.info("entry list : {}", list);
		
		return list;
	}

	@Override
	public void insert(Map<String, String> insertEvent) {

		String seq = sqlSession.selectOne("sch.seq");
		insertEvent.put("seq", seq);
		
		log.info("seq confirm : {}" , insertEvent.get("seq"));
		log.info("final insert data : {}" , insertEvent);
		
		sqlSession.insert("sch.insert", insertEvent);
		sqlSession.insert("sch.insertJoinTable", insertEvent);
		
	}

	@Override
	public void delete(String id) {
		
		sqlSession.update("sch.delete", id);
	}

	@Override
	public void update(Map<String, String> updateEvent) {
		sqlSession.update("sch.update", updateEvent);
	}


}
