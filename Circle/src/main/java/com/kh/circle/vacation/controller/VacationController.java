package com.kh.circle.vacation.controller;


import java.text.ParseException;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.circle.login.entity.EmpInfo;
import com.kh.circle.sign.vo.SignSelectOne;
import com.kh.circle.vacation.entity.VacationInfo;
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
	
	
	@PostMapping("/addVacation")
	public String addVacation(@ModelAttribute VacationInfo vacationInfo,
								HttpSession session,
								RedirectAttributes attr) {

		String emp_no = ( (EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();
		String emp_name = ( (EmpInfo) session.getAttribute("empInfo")).getEmp_info_name();

		vacationInfo.setEmpNo(emp_no);
		vacationInfo.setEmpName(emp_name);

		// 처리과정
		// 1. 받아온 정보를 휴가계 양식에 맞도록 SignWrite 형으로 변형
		SignSelectOne insertVacation = vacationService.formVacation(vacationInfo);
		
		// 2. 전달할 값을 map에 저장
		// 3. sign controller에 값 전달
		// 4. 처리여부 ("/insertVacation"에서)회신 후 insert
		
		// 논의 필요한 부분
		// Sign Controller의 어디로 보내야 하나?
		return "/sign/signWrite";
	}
	
	@PostMapping("/insertVacation")
	public String insertVacation(@ModelAttribute("map") Map<?, ?> map) {
		
		VacationInfo vacationInfo = (VacationInfo) map.get("vacationInfo");
		
		// 4. 처리여부 ("/insertVacation"에서)회신 후 insert
		vacationService.addVacation(vacationInfo);

	return "redirect:/vacation/myVacation";
	}
}
