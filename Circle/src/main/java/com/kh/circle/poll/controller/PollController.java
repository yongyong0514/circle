package com.kh.circle.poll.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/poll")
public class PollController {
	
	@GetMapping("/pollMain")
	public String pollMain() {
		return "/poll/pollMain";
	}
	
	@GetMapping("/pollMain/{url}")
	public String pollMain(@PathVariable String url, Model model) {
		
		model.addAttribute("url", url);
		
		return "/poll/pollMain";
	}
	
	
	/***************
	 *  ajax용
	 ***************/	
//	@GetMapping("/pollMain")
//	public String pollMain() {
//		return "/poll/pollMain";
//	}
//	
//	@GetMapping("/pollPost")
//	public String pollPost() {
//		return "/poll/contentArea/pollPost";
//	}
//	@GetMapping("/pollResult")
//	public String pollResult() {
//		return "/poll/contentArea/pollResult";
//	}
//	@GetMapping("/pollProgress")
//	public String pollProgress() {
//		return "/poll/contentArea/pollProgress";
//	}
//	@GetMapping("/pollProFinished")
//	public String pollProFinished() {
//		return "/poll/contentArea/pollFinished";
//	}
//	@GetMapping("/pollProMy")
//	public String pollProMy() {
//		return "/poll/contentArea/pollMy";
//	}
}
