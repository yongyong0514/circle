package com.kh.circle.project.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostPaging;
import com.kh.circle.project.entity.Project;
import com.kh.circle.project.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {

	@Autowired
	private ProjectService projService;
	
	
	
	@GetMapping("/projMain")
	public String projMain(Model model, Project project) {
		
		List<Project> projMain = projService.projMain(project);
		
		
		model.addAttribute("projMain", projMain);
	
		
		return "project/projMain";
	}
	

	@GetMapping("/projIssMain")
	public String projIssMain(Model model, Project iss, @RequestParam("pro_code") String pro_code) {
		
		System.out.println("DDDD" + pro_code);
		

		
		model.addAttribute("projIssMain", projService.projIssMain(pro_code));
	
		System.out.println("proj lsig :  " + model );
		
		
		return "project/projIssMain";
	}

	
	
	@GetMapping("/projKanban")
	public String projKanban(Model model) {
		
		
		
		return "project/projKanban";
	}
	

	@GetMapping("/projTodo")
	public String projTodo(Model model) {
		
		return "project/projTodo";
	}
	
	
	@GetMapping("/projInsert")
	public String projInsert() {
		return "project/projInsert";
	}

	
	

	@GetMapping("/projView")
	public String projView() {
		return "project/projView";
	}
	
	///////////////////////////////////////////
	

	
	
	
}
