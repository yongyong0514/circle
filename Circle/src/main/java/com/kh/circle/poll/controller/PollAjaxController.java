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
	public void post(HttpSession session, @RequestBody HashMap<String,Object> questions) {

		String empNo = ( (EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();
		PreInputData temp = (PreInputData) session.getAttribute("prePollData");

		log.info(temp.toString());
		log.info(temp.getTitle());

		log.info(questions.toString());
		log.info(questions.get("seq1").toString());
		
		temp.setWriter(empNo);
		
		pollService.insertPoll(temp, questions);
		
		
	}
}
