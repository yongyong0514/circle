package com.kh.circle.attendance.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.circle.attendance.service.AttendanceInfoService;
import com.kh.circle.login.entity.EmpInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/attendance")
public class AttendanceController {
	@Autowired
	private AttendanceInfoService attendanceService;
	
	@GetMapping("/main")
	public String main(HttpSession session,
						@RequestParam(defaultValue="") String dateStr,
						Model model) throws ParseException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = "";
		
		//입력된 날짜값이 없는 경우 오늘 날짜로 설정
		if("".equals(dateStr)) {
			date = sdf.format(sdf.parse("2020-11-13"));
//			date = sdf.format(new Date(System.currentTimeMillis()));
		} else {
//예시값으로 2020-11-13 입력			
			date = sdf.format(sdf.parse("2020-11-13"));
		}

		String emp_no = ( (EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();

		Map<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("emp_no", emp_no);
		inputMap.put("date", date);
		inputMap.put("today", date);
		
		if(emp_no != null) {
			Map<String, Object> map = attendanceService.attendanceList(inputMap);
			model.addAttribute("map", map);
			model.addAttribute("today", date);
			
			return "attendance/main";
		} else {
			model.addAttribute("msg", "로그인 후 사용 가능합니다.");
			
			return "common/error";
		}
	}
	
	@GetMapping("/myVacation")
	public String myVacation() {
		return "attendance/myVacation";
	}

	@GetMapping("/attendanceAllList")
	public String attendanceAllList() {
		return "attendance/attendanceAllList";
	}
	
	@GetMapping("/attendanceAllStatistic")
	public String attendanceAllStatistic() {
		return "attendance/attendanceAllStatistic";
	}
	
	@GetMapping("/attendanceAllVacationList")
	public String attendanceAllVacationList() {
		return "attendance/attendanceAllVacationList";
	}
}
