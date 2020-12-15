package com.kh.circle.vacation.controller;


import java.io.IOException;
import java.text.ParseException;
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
import com.kh.circle.sign.service.SignService;
import com.kh.circle.sign.vo.SignWriteInsert;
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
	
	//전자결재 서비스 연결
	@Autowired
	private SignService signService;	
	
	@PostMapping("/addVacation")
	public String addVacation(@ModelAttribute VacationInfo vacationInfo,
								HttpSession session,
								RedirectAttributes attr) throws IllegalStateException, IOException {

		// 처리과정
		// 1. 받아온 정보를 휴가계 양식에 맞도록 SignWrite 형으로 변형
		String emp_no = ( (EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();
		String emp_name = ( (EmpInfo) session.getAttribute("empInfo")).getEmp_info_name();

		vacationInfo.setEmpNo(emp_no);
		vacationInfo.setEmpName(emp_name);

		String vType = "";			// 휴가구분
		String halfType = "";		// 전일/반일 구분
		
		switch(vacationInfo.getVacationType()) {
			case "annual": vType = "연차"; break;
			case "half": vType = "반차"; break;
			case "event": vType = "경조사"; break;
			case "maternity": vType = "출산/육아"; break;
			case "menstrual": vType = "보건"; break;
			case "military": vType = "예비군/민방위"; break;
			case "sick": vType = "병가"; break;
			case "etc": vType = "기타"; break;
		}

		switch(vacationInfo.getIsHalf()) {
			case "full": halfType = "전일"; break;
			case "amHalf": halfType = "오전반차"; break;
			case "pmHalf": halfType = "오후반차"; break;
		}
		
		vacationInfo.setVacationType(vType);
		vacationInfo.setIsHalf(halfType);
		
		
		SignWriteInsert insertVacation = vacationService.formVacation(vacationInfo);

		
		// 2. sign서비스에 값 전달하여 insert
		signService.insert(insertVacation);
		
		// 3. 휴가정보 저장
		
		vacationInfo.setConfirm("Y");
		vacationInfo.setSign_code(vacationService.findSignCode(vacationInfo.getEmpNo()));
		
		vacationService.addVacation(vacationInfo);
		
		return "redirect:/vacation/myVacation";
	}
}
