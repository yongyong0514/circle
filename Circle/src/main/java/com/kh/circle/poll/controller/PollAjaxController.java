package com.kh.circle.poll.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.circle.poll.entity.PreInputData;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/pollAjax")
public class PollAjaxController {

	@PostMapping("/writeComplete")
	public void post(HttpSession session, @RequestBody List<HashMap<String, String>> questionData) {

		PreInputData temp = (PreInputData) session.getAttribute("prePollData");
		log.info(temp.toString());
		
		log.info(questionData.toString());
		
		
	}
}
