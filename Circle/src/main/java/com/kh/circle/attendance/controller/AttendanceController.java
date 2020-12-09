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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.circle.attendance.service.AttendanceInfoService;
import com.kh.circle.login.entity.EmpInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/attendance")
public class AttendanceController {
	@Autowired
	private AttendanceInfoService attendanceInfoService;
	
	@GetMapping("/myAttendance")
	public String main(HttpSession session,
						@RequestParam(defaultValue="") String dateStr,
						Model model) throws ParseException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = "";
		
		//입력된 날짜값이 없는 경우 오늘 날짜로 설정
		if("".equals(dateStr)) {
//			date = sdf.format(sdf.parse("2020-11-13"));
			date = sdf.format(new Date(System.currentTimeMillis()));
		} else {
//예시값으로 2020-11-13 입력			
//			date = sdf.format(sdf.parse("2020-11-13"));
			date = sdf.format(sdf.parse(dateStr));
		}

		String emp_no = ( (EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();

		Map<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("emp_no", emp_no);
		inputMap.put("date", date);
		inputMap.put("today", date);
		
		if(emp_no != null) {
			Map<String, Object> map = attendanceInfoService.attendanceList(inputMap);
			model.addAttribute("map", map);
			model.addAttribute("today", date);
			
			return "attendance/myAttendance";
		} else {
			model.addAttribute("msg", "로그인 후 사용 가능합니다.");
			
			return "common/error";
		}
	}
	
	@GetMapping("/allAttendanceList")
	public String allAttendanceList() {
		return "attendance/allAttendanceList";
	}
	
	@GetMapping("/allAttendanceStatistic")
	public String allAttendanceStatistic() {
		return "attendance/allAttendanceStatistic";
	}
	
	@GetMapping("/allVacationList")
	public String allVacationList() {
		return "attendance/allVacationList";
	}
	
	@GetMapping("/allVacationHistory")
	public String allVacationHistory() {
		return "attendance/allVacationHistory";
	}
	
	@PostMapping("/sTimeCheck")
	@ResponseBody
	public String sTimeCheck(@ModelAttribute(value="today") String today,
							@ModelAttribute(value="sTime") String sTime,
							HttpSession session) {
		
		System.out.println("stime 입력: " + sTime);
		
		Map<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("today", today);
		inputMap.put("sTime", sTime);
		
		String emp_no = ( (EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();
		inputMap.put("emp_no", emp_no);
		
		attendanceInfoService.insertStime(inputMap);

		//출근시간 기록
		session.setAttribute("sTime", sTime);

		return sTime;
	}
	
	@PostMapping("/eTimeCheck")
	@ResponseBody
	public String eTimeCheck(@ModelAttribute(value="eTime") String eTime,
							HttpSession session) {
					
		String sTime = (String) session.getAttribute("sTime");
		System.out.println("sTime 확인: " + sTime);
	
		Map<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("sTime", sTime);
		
		String emp_no = ( (EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();
		inputMap.put("emp_no", emp_no);
		
		inputMap.put("eTime", eTime);
		
		attendanceInfoService.insertEtime(inputMap);
		
		//출근시간 삭제
		session.setAttribute("sTime", null);

		return eTime;
	}
}
