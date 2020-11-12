package com.kh.circle.schedule.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.schedule.entity.Sch_unit;

@Repository
public class ScheduleDaoImpl implements ScheduleDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public Sch_unit list() {

//		Sch_unit list = sqlSession.selectSch();
		
		return null;
	}

}
