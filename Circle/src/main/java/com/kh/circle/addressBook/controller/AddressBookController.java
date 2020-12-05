package com.kh.circle.addressBook.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.circle.addressBook.entity.AddressInfo;
import com.kh.circle.addressBook.entity.PagingInfo;
import com.kh.circle.addressBook.service.AddressBookService;

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
						@RequestParam(value="perPage", defaultValue="20") int perPage,
						Model model) {
		
		PagingInfo pInfo = PagingInfo.builder()
									.nowPage(nowPage)
									.perPage(perPage)
									.build();
		// 전체 리스트 반환
		
		// 1. 페이징 처리
		List<AddressInfo> aList = addressBookService.pagingEmp(pInfo);
		
		model.addAttribute("aList", aList);
		
		return "addressBook/allEmp";
	}
	
	@GetMapping("/detail")
	public String detail() {
		return "addressBook/addressBookDetail";
	}
}
