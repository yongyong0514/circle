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
	public String pollMain(@RequestParam("url")String url, Model model) {
		System.out.println(url);
		model.addAttribute("url", url);
		return "/poll/pollMain";
	}
	
	@GetMapping("/pollPost")
	public String pollPost() {
		return "/poll/pollPost";
	}
}
