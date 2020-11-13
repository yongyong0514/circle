package com.kh.circle.schedule.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.circle.schedule.entity.Sch_unit;
import com.kh.circle.schedule.repository.ScheduleDao;
import com.kh.circle.schedule.service.ScheduleService;

@Controller
@RequestMapping("/schedule")
public class ScheduleController  {
	
	private ScheduleDao scheduleDao;
	private ScheduleService scheduleService;
	
	@GetMapping("/schMain")
	public ModelAndView schMain(HttpSession session) {
		ModelAndView list = new ModelAndView();
//		list = scheduleService.persnalCalendar(session);
		
		
		return list;
	}
	
}
