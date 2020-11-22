package com.kh.circle.issue.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.circle.issue.entity.Iss;
import com.kh.circle.post.entity.Post;

@Controller
@RequestMapping("/iss")
public class IssueController {

	@Autowired
	private SqlSession sqlSession;
	
	
	@GetMapping("/issList")
	public String issList(Model model) {
		
List<Post> issList = sqlSession.selectList("iss.issList");
		model.addAttribute("issList", issList);
		return "iss/issList";
	}
	
	
	
	@RequestMapping("/issInsert")
	public String issInsert(@ModelAttribute Iss iss, BindingResult bindingResult, Model model, HttpServletRequest request) {
		
	String iss_title = iss.getIss_title();
	String iss_pro_code = iss.getIss_pro_code();
	String iss_prog_code = iss.getIss_prog_code();
		
		model.addAttribute("iss_title", iss_title);
		model.addAttribute("iss_pro_code", iss_pro_code);
		model.addAttribute("iss_prog_code", iss_prog_code);
		return "iss/issInsert";
	}
}
