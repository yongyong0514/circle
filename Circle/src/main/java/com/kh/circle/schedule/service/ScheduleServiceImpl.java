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

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private ScheduleDao schDao;

	@Override
	public List<SchAjax> list(Map<String, Object> map) {
		List<SchAjax> list = schDao.list(map);
		return list;
	}
	@Override
	public List<SchAjax> vacationList(Map<String, Object> map) {
		List<SchAjax> list = schDao.vacationList(map);
		return list;
	}
	@Override
	public List<SchAjax> projectList(Map<String, Object> map) {
		List<SchAjax> list = schDao.projectList(map);
		return list;
	}
	

	@Override
	public void insert(Map<String, String> insertEvent) {
		schDao.insert(insertEvent);
	}

	@Override
	public void delete(String id) {
		schDao.delete(id);
	}

	@Override
	public void update(Map<String, String> updateEvent) {
		schDao.update(updateEvent);
	}

}
