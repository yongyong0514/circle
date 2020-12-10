package com.kh.circle.schedule.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.kh.circle.schedule.entity.SchAjax;
import com.kh.circle.schedule.entity.Entry;
import com.kh.circle.schedule.entity.Sch_unit;

public interface ScheduleService {

	List<SchAjax> list(Map<String, Object> map);
	List<SchAjax> vacationList(Map<String, Object> map);
	List<SchAjax> projectList(Map<String, Object> map);
	List<HashMap<String, String>> entryList(String id);
	
	void insert(HashMap<String, Object> insertEvent);

	void delete(String id);

	void update(HashMap<String, Object> updateEvent);

	
	//일정 전체 리스트 출력기능
}
