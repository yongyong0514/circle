package com.kh.circle.poll.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.circle.login.entity.EmpInfo;
import com.kh.circle.poll.entity.AttendedServey;
import com.kh.circle.poll.entity.AttendedServeyMember;
import com.kh.circle.poll.entity.PostCode;
import com.kh.circle.poll.entity.PreInputData;
import com.kh.circle.poll.entity.Question;
import com.kh.circle.poll.service.PollService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/pollAjax")
public class PollAjaxController {
	
	@Autowired
	private PollService pollService;
	
	@RequestMapping(value="/writeComplete", method = RequestMethod.POST)
	public void post(HttpSession session, @RequestBody List<Question> questions) {

		String empNo = ( (EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();
		PreInputData temp = (PreInputData) session.getAttribute("prePollData");

		log.info(temp.toString());
		log.info(temp.getTitle());

		log.info(questions.toString());
		
		temp.setWriter(empNo);
		
		pollService.insertPoll(temp, questions);
	}
	
	@PostMapping("/attendComplete")
	public String attendComplete(HttpSession session, @RequestBody List<HashMap<String, String>> list) {
		
		//로그인 사번 데이터 List에 넣기
		String empNo = ( (EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();
		HashMap<String,String> addEmpNo = new HashMap<>();
		addEmpNo.put("empNo",empNo); 
		list.add(0,addEmpNo);
		
		
		
		log.info(list.toString());
		
		String url = pollService.insertAttendedServey(list);
		
		log.info("ajax로 리턴할 url : {}", url);
		
		return url;
	}
	
	@PostMapping("/deleteAll")
	public void deleteAll(@RequestBody List<String> code) {
		
		log.info("code : {}",code);
		
		for (String postCode : code) {
			pollService.deleteOne(postCode);
		}
		
	}
}
