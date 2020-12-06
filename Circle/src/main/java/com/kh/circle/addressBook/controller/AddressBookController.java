package com.kh.circle.addressBook.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.circle.addressBook.entity.PagingInfo;
import com.kh.circle.addressBook.service.AddressBookService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/addressBook")
public class AddressBookController {
	@Autowired
	private AddressBookService addressBookService;
	
	@GetMapping("/main")
	public String main(@RequestParam(value="url", defaultValue="main") String url,
						Model model) {
		
		model.addAttribute("url", url);
		
		return "addressBook/main";
	}
	
	@GetMapping("/allEmp")
	public String allEmp(@RequestParam(value="nowPage", defaultValue="1") int nowPage,
						@RequestParam(value="perPage", defaultValue="10") int perPage,
						@RequestParam(value="name", defaultValue="") String name,
						@RequestParam(value="email", defaultValue="") String email,
						@RequestParam(value="tel", defaultValue="") String tel,
						Model model) {

		PagingInfo pInfo = PagingInfo.builder()
									.nowPage(nowPage)
									.perPage(perPage)
									.name(name)
									.email(email)
									.tel(tel)
									.build();
		// 전체 리스트 반환
		
		// 페이징 처리 
		Map<String, Object> map = addressBookService.pagingEmp(pInfo);
		
		model.addAttribute("map", map);
		model.addAttribute("url", "allEmp");
		model.addAttribute("name", pInfo.getName());
		model.addAttribute("email", pInfo.getEmail());
		model.addAttribute("tel", pInfo.getTel());
		
		return "addressBook/allEmp";
	}
	
	@GetMapping("/detail")
	public String detail() {
		return "addressBook/addressBookDetail";
	}
}
