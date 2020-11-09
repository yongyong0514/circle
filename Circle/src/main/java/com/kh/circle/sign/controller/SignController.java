package com.kh.circle.sign.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sign")
public class SignController {
	
	@GetMapping("/signList")
	public String signList() {
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
