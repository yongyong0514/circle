package com.kh.circle.schedule.service;

import javax.servlet.http.HttpSession;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.servlet.ModelAndView;

public class ScheduleServiceImpl implements ScheduleService {

	@DateTimeFormat
	@Override
	public ModelAndView persnalCalendar(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}

}
