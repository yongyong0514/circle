package com.kh.circle.issue.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/iss")
public class IssueController {


	
	@GetMapping("/issList")
	public String issList() {
		return "iss/issList";
	}
	
	@GetMapping("/issInsert")
	public String issInsert() {
		return "iss/issInsert";
	}
}
