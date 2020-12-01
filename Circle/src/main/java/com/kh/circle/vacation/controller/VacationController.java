package com.kh.circle.vacation.controller;


import java.text.ParseException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.circle.login.entity.EmpInfo;
import com.kh.circle.vacation.service.VacationService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/vacation")
public class VacationController {
	@Autowired
	private VacationService vacationService;
	
	@GetMapping("/myVacation")
	public String main(HttpSession session,
						Model model) throws ParseException {
	
		String emp_no = ( (EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();
		
		if(emp_no != null) {
			Map<String, Object> map = vacationService.vacationList(emp_no);

			model.addAttribute("map", map);
			
			return "attendance/myVacation";
		} else {
			model.addAttribute("msg", "로그인 후 사용 가능합니다.");
			
			return "common/error";
		}
	}
}
