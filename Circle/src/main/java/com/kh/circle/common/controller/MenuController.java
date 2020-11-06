package com.kh.circle.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/common")
public class MenuController {

	@GetMapping("/menuScrollList")
	public String menuScrollList() {
		return "common/menuScrollList";
	}
}
