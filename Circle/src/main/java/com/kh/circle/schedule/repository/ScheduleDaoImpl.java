package com.kh.circle.schedule.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.schedule.entity.SchAjax;
import com.kh.circle.schedule.entity.SchAjax_min;

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
	public void insert(Map<String, String> insertEvent) {

		String seq = sqlSession.selectOne("sch.seq");
		insertEvent.put("seq", seq);
		
		log.info("seq confirm : {}" , insertEvent.get("seq"));
		log.info("final insert data : {}" , insertEvent);
		
		sqlSession.insert("sch.insert", insertEvent);
		sqlSession.insert("sch.insert2", insertEvent);
		
	}

}
