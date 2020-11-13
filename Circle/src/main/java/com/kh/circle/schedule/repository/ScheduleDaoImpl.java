package com.kh.circle.schedule.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.schedule.entity.Sch_unit;

@Repository
public class ScheduleDaoImpl implements ScheduleDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Map<String, String>> list() {

		List<Map<String, String>> list = (List<Map<String, String>>) sqlSession.selectMap(null, null);
		
		return list;
	}

}
