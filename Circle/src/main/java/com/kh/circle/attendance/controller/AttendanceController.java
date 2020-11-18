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
	
	@GetMapping("/myVacation")
	public String myVacation() {
		return "attendance/attendanceMyVacation";
	}
	
	@GetMapping("/attendanceAllList")
	public String attendanceAllList() {
		return "attendance/attendanceAllList";
	}
	
	@GetMapping("/attendanceAllStatistic")
	public String attendanceAllStatistic() {
		return "attendance/attendanceAllStatistic";
	}
	
	@GetMapping("/attendanceAllInfoList")
	public String attendanceAllInfoList() {
		return "attendance/attendanceAllInfoList";
	}
	
	@GetMapping("/attendanceAllVacationList")
	public String attendanceAllVacationList() {
		return "attendance/attendanceAllVacationList";
	}
}
