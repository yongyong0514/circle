package com.kh.circle.alert.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/alert")
public class alertController {
	
	@GetMapping("alertList")
	public String alertList() {
		return "alert/alertList";
	}

}
