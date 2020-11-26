package com.kh.circle.poll.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/pollAjax")
public class PollAjaxController {

	@PostMapping("/page")
	public String post(@RequestBody String url) {
		System.out.println(url);
		return url.toString();
	}
}
