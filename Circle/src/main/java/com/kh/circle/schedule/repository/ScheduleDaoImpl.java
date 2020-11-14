package com.kh.circle.schedule.repository;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.sound.midi.MidiDevice.Info;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Repository;

import com.kh.circle.schedule.entity.SchAjax;
import com.kh.circle.schedule.entity.SchAjax_min;
import com.kh.circle.schedule.entity.Sch_unit;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ScheduleDaoImpl implements ScheduleDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<SchAjax_min> list(Map<String, Object> map) {
		List<SchAjax_min> list =  sqlSession.selectList("sch.selectMap_min",map);
		
		return list;
	}

}
