package com.kh.circle.issue.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/iss")
public class IssueController {

	@GetMapping("/issMain")
	public String signList() {
		return "iss/issMain";
	}
}
