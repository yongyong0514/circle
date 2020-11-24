package com.kh.circle.comu.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.circle.comu.entity.Comu;
import com.kh.circle.comu.service.ComuService;


@Controller
@RequestMapping("/community")
public class ComuController {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	//게시글 가져오기 
	@GetMapping("/comuList")
	public String comuList(Model model) {
		
		List<Comu> comuList = sqlSession.selectList("comu.comuList");
		model.addAttribute("comuList",comuList);
		
		return "community/comuList";
	}
	
	@GetMapping("/comuInfoList")
	public String comuInfoList() {
		return "community/comuInfoList";
	}
	@GetMapping("/comuJoin")
	public String comuJoin() {
		return "community/comuJoin";
	}
	// 동호회 게시글 등록
	@GetMapping("/comuAdd")
	public String comuAdd(Model model, @ModelAttribute("comu.comuList") Comu comu) {
		
		model.addAttribute("comu",comu);
		
		return "community/comuAdd";
	}
	@GetMapping("/comuApp")
	public String comuApp() {
		return "community/comuApp";
	}
}
