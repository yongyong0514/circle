package com.kh.circle.poll.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/poll")
public class PollController {
	
	@GetMapping("/pollMain")
	public String pollMain() {
		return "/poll/pollMain";
	}
	
	@GetMapping("/pollPost")
	public String pollPost() {
		return "/poll/pollPost";
	}
}
