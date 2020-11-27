package com.kh.circle.empInfo.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.circle.empInfo.service.EmpInfoService;
import com.kh.circle.login.entity.EmpInfo;

@Controller
@RequestMapping("/empInfo")
public class EmpInfoController {
	@Autowired
	private EmpInfoService empInfoService;
	
	@GetMapping("/myInfo")
	public String myInfo(HttpSession session,
						Model model) {

		String emp_no = ( (EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();

		if(emp_no != null) {
			Map<String, Object> map = empInfoService.empInfoOne(emp_no);
			
			model.addAttribute("map", map);

			return "attendance/myInfo";
		} else {
			model.addAttribute("msg", "로그인 후 사용 가능합니다.");
			
			return "common/error.jsp";
		}
	}
	
	@GetMapping("/allInfo")
	public String attendanceAllInfoList() {
		return "attendance/attendanceAllInfoList";
	}
}
