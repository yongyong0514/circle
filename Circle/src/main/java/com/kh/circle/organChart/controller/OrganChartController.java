package com.kh.circle.organChart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.circle.organChart.entity.OrganDept;
import com.kh.circle.organChart.service.OrganChartService;

@Controller
@RequestMapping("/organChart")
public class OrganChartController {
	@Autowired
	private OrganChartService organChartService;
	
	@GetMapping("/getInfo")
	public String getInfo(Model model) {
		List<List<OrganDept>> levelList = organChartService.oDList();
		
		model.addAttribute("levelList", levelList);
		
		return "/common/menuOrganChart";
	}
	
}
