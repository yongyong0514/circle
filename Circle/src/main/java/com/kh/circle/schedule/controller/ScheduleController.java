package com.kh.circle.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/schdule")
public class ScheduleController  {
	
	@GetMapping("schMain")
	public String schMonth() {
		return "/schedule/schMain";
	}
	
}
