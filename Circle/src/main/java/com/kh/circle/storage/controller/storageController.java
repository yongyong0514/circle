package com.kh.circle.storage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/storage")
public class storageController {
	
	@GetMapping("storageList")
	public String storageList() {
		return "storage/storageList";
	}

}
