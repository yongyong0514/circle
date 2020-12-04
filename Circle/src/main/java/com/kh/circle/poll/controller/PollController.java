package com.kh.circle.poll.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.circle.login.entity.EmpInfo;
import com.kh.circle.poll.service.PollService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/poll")
public class PollController {
	
	/*******************
	 ** 페이지 이동용 ** 
	 *******************/
//	@GetMapping("/pollMain/{url}")
//	public String pollMain(@PathVariable String url, Model model) {
//		model.addAttribute("url", url);
//		
//		return "/poll/pollMain";
//	}
	
	@Autowired
	private PollService pollService;
	

	@GetMapping("/pollMain")
	public String pollMain(HttpSession session, ModelMap modelMap) {
		
		String emp_no = ( (EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();
		log.info(emp_no);
		
		List<HashMap<String, String>> list = pollService.homeList(emp_no);
		
		modelMap.addAttribute("post", list);
		
		log.info(modelMap.toString());
		
		return "/poll/pollMain";
	}
	@GetMapping("/post")
	public String post(@RequestParam String postCode) {
		
		System.out.println(postCode);
		return "/poll/post";
	}
	@GetMapping("/result")
	public String result(@RequestParam String postCode) {
		
		System.out.println(postCode);
		return "/poll/result";
	}
	@GetMapping("/progress")
	public String progress() {
		return "/poll/progress";
	}
	@GetMapping("/finished")
	public String finished() {
		return "/poll/finished";
	}
	@GetMapping("/insert")
	public String insert() {
		return "/poll/insert";
	}
	@GetMapping("/questionInsert")
	public String questionInsert() {
		return "/poll/questionInsert";
	}
	@GetMapping("/my")
	public String my() {
		return "/poll/my";
	}
}
