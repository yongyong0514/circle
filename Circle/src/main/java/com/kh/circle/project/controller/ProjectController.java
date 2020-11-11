package com.kh.circle.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/proj")
public class ProjectController {

	
	@GetMapping("/projMain")
	public String signList() {
		return "proj/projMain";
	}
	
	
}
