package com.kh.circle.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/project")
public class ProjectController {

	
	@GetMapping("/projMain")
	public String projMain() {
		return "project/projMain";
	}
	
	
	@GetMapping("/projAdd")
	public String projAdd() {
		return "project/projAdd";
	}
	
	
	@GetMapping("/projKanban")
	public String projKanban() {
		return "project/projKanban";
	}
	
	@GetMapping("/projTodo")
	public String projTodo() {
		return "project/projTodo";
	}
	
	
}
