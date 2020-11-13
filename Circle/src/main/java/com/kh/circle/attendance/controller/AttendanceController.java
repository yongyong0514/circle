package com.kh.circle.attendance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {

	@GetMapping("/main")
	public String main() {
		return "attendance/attendanceMain";
	}
	
	@GetMapping("/myInfo")
	public String myInfo() {
		return "attendance/attendanceMyInfo";
	}
}
