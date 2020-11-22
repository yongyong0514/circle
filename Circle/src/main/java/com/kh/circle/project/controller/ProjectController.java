package com.kh.circle.project.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.circle.project.entity.Project;

@Controller
@RequestMapping("/project")
public class ProjectController {

	@Autowired
	SqlSession sqlSession;
	
	@GetMapping("/projList")
	public String projList(Model model) {
		
		List<Project> projList = sqlSession.selectList("project.projList");
		
		model.addAttribute("projList", projList);
	
		return "project/projList";
	}

	
	@GetMapping("/projKanban")
	public String projKanban(Model model) {
		
List<Project> projKanban = sqlSession.selectList("project.projKanban");
		
		model.addAttribute("projKanban", projKanban);
		
		return "project/projKanban";
	}
	

	@GetMapping("/projTodo")
	public String projTodo(Model model) {
List<Project> projTodo = sqlSession.selectList("project.projTodo");
		
		model.addAttribute("projTodo", projTodo);
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
	
}
