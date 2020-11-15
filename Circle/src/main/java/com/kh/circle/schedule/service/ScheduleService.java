package com.kh.circle.schedule.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.kh.circle.schedule.entity.SchAjax;
import com.kh.circle.schedule.entity.SchAjax_min;
import com.kh.circle.schedule.entity.Sch_unit;

public interface ScheduleService {

	List<SchAjax> list(Map<String, Object> map);
	
	//일정 전체 리스트 출력기능
}
