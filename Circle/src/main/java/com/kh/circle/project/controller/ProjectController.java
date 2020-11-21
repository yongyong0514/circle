package com.kh.circle.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/project")
public class ProjectController {

	@GetMapping("/projList")
	public String projList() {
		return "project/projList";
	}
	
	
	@GetMapping("/projInsert")
	public String projInsert() {
		return "project/projInsert";
	}

	
	
	@GetMapping("/projKanban")
	public String projKanban() {
		return "project/projKanban";
	}
	
	@GetMapping("/projTodo")
	public String projTodo() {
		return "project/projTodo";
	}
	

	@GetMapping("/projView")
	public String projView() {
		return "project/projView";
	}
	
}
