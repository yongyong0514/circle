package com.kh.circle.schedule.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.circle.schedule.entity.SchAjax;
import com.kh.circle.schedule.entity.SchAjax_min;
import com.kh.circle.schedule.entity.Sch_unit;
import com.kh.circle.schedule.repository.ScheduleDao;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private ScheduleDao scheduleDao;

	@Override
	public List<SchAjax_min> list(Map<String, Object> map) {
		List<SchAjax_min> list = scheduleDao.list(map);
		
		return list;
	}

}
