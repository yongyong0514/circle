package com.kh.circle.sign.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.circle.sign.vo.signList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/sign")
public class SignController {
	
//	@Autowired 
//	private SignService signService;

	@Autowired
	private SqlSession sqlSession;
	
//	@GetMapping("/signList")
//	public String signList(Model model) {
//		List<Sign> list = sqlSession.selectList("sign.list");
//		model.addAttribute("list", list);
//
//		return "sign/signList";
//	}
	
	@GetMapping("/signList")
	public String signList(Model model) {
		List<signList> list = sqlSession.selectList("sign.list");
		model.addAttribute("list", list);
		
		List<signList> list2 = sqlSession.selectList("sign.listComplete");
		model.addAttribute("list2", list2);

		return "sign/signList";
	}
	
	@GetMapping("/signWrite")
	public String signWrite() {
		return "sign/signWrite";
	}
	
	@GetMapping("/signWriteForm")
	public String signWriteForm() {
		return "sign/signWriteForm";
	}
	
	@GetMapping("/signSelectOne")
	public String signSelectOne() {
		return "sign/signSelectOne";
	}
}
