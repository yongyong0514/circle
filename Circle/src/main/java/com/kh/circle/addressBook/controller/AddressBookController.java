package com.kh.circle.addressBook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/addressBook")
public class AddressBookController {

	@GetMapping("/main")
	public String main() {
		return "addressBook/addressBookMain";
	}
	
	@GetMapping("/detail")
	public String detail() {
		return "addressBook/addressBookDetail";
	}
}
