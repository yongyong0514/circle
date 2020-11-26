package com.kh.circle.poll.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@GetMapping("/pollPost")
	public String pollPost() {
		return "/poll/contentArea/pollPost";
	}
}
