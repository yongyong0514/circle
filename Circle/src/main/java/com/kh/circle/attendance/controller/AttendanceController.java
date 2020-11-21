package com.kh.circle.attendance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {

	@GetMapping("/main")
	public String main() {
		return "attendance/main";
	}
	
	@GetMapping("/myInfo")
	public String myInfo() {
		return "attendance/myInfo";
	}
	
	@GetMapping("/myVacation")
	public String myVacation() {
		return "attendance/myVacation";
	}
	
	@GetMapping("/allAttendanceList")
	public String allAttendanceList() {
		return "attendance/allAttendanceList";
	}
	
	@GetMapping("/allAttendanceStatistic")
	public String allAttendanceStatistic() {
		return "attendance/allAttendanceStatistic";
	}
	
	@GetMapping("/allInfoList")
	public String allInfoList() {
		return "attendance/allInfoList";
	}
	
	@GetMapping("/allVacationList")
	public String allVacationList() {
		return "attendance/allVacationList";
	}
	
	@GetMapping("/allVacationHistory")
	public String allVacationHistory() {
		return "attendance/allVacationHistory";
	}
}
