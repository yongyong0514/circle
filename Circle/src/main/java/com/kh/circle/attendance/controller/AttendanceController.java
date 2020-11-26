package com.kh.circle.attendance.controller;

import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.circle.attendance.service.AttendanceService;
import com.kh.circle.login.entity.EmpInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/attendance")
public class AttendanceController {

	@Autowired
	private AttendanceService attendanceService;
	
	@GetMapping("/main")
	public String main(HttpSession session,
						@RequestParam(defaultValue="") String date,
						Model model) {
		
		//date 형식 통일
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");

		if("".equals(date)) {
			date = sdFormat.format(System.currentTimeMillis());
		} else {
			date = sdFormat.format(date);
		}

		EmpInfo empInfo = (EmpInfo) session.getAttribute("empInfo");
		
		if(empInfo != null) {
			
			// Map<String, Object> map = attendanceService.mainList(empInfo.getEmp_info_emp_no(), date);
			
			//model.addAttribute("map", map);
			
			return "attendance/main";
		} else {
			model.addAttribute("msg", "로그인 후 사용 가능합니다.");
			
			return "common/error.jsp";
		}
	}
	
	@GetMapping("/myInfo")
	public String myInfo() {
		
		return "attendance/myInfo";
	}
	
	@GetMapping("/myVacation")
	public String myVacation() {
		return "attendance/attendanceMyVacation";
	}

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
