package com.kh.circle.schedule.repository;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.kh.circle.schedule.entity.SchAjax;
import com.kh.circle.schedule.entity.SchAjax_min;
import com.kh.circle.schedule.entity.Sch_unit;


public interface ScheduleDao {
	
	List<SchAjax> list(Map<String, Object> map);

	void insert(Map<String, String> insertEvent);

	void delete(String id);
	
}
