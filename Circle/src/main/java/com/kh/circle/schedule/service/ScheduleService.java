package com.kh.circle.schedule.service;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public interface ScheduleService {

	ModelAndView persnalCalendar(HttpSession session);
	
	//일정 전체 리스트 출력기능
}
