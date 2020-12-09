package com.kh.circle.organChart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.circle.organChart.entity.OrganDept;
import com.kh.circle.organChart.service.OrganChartService;

@Controller
@RequestMapping("/organChart")
public class OrganChartController {
	@Autowired
	private OrganChartService organChartService;
	

//	@GetMapping("/getInfo")
	@RequestMapping(value="/getInfo", method= {RequestMethod.GET, RequestMethod.POST})

	@GetMapping("/getInsertInfo")
	public String getInsertInfo(Model model) {
		List<OrganDept> oDList = organChartService.oDList();
		
		model.addAttribute("oDList", oDList);
		
		System.out.println(model);
		
		return "poll/contentArea/insertMemberOrganChart";
	}

	@GetMapping("/getInfo")
	public String getInfo(Model model) {
		List<OrganDept> oDList = organChartService.oDList();
		
		model.addAttribute("oDList", oDList);
		
		return "common/menuOrganChart";
	}
	
}
