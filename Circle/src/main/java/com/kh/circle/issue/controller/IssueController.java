package com.kh.circle.issue.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/iss")
public class IssueController {

	@GetMapping("/issAdd")
	public String issAdd() {
		return "iss/issAdd";
	}
}
