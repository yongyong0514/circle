package com.kh.circle.addressBook.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.circle.addressBook.entity.PagingInfo;
import com.kh.circle.addressBook.service.AddressBookService;
import com.kh.circle.empInfo.entity.EmpInfoAll;

@Controller
@RequestMapping("/addressBook")
public class AddressBookController {
	@Autowired
	private AddressBookService addressBookService;

	@GetMapping("/main")
	public String main(@RequestParam(value = "url", defaultValue = "main") String url, Model model) {

		model.addAttribute("url", url);

		return "addressBook/main";
	}

	@GetMapping("/allEmp")
	public String allEmp(@RequestParam(value = "nowPage", defaultValue = "1") int nowPage,
			@RequestParam(value = "perPage", defaultValue = "5") int perPage,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "tel", required = false) String tel,
			@RequestParam(value = "index", defaultValue = "0") int index, Model model) {

		PagingInfo pInfo = PagingInfo.builder().nowPage(nowPage).perPage(perPage).name(name).email(email).tel(tel)
				.index(index).build();

		// 전체 리스트 반환
		// 페이징 처리
		Map<String, Object> map = addressBookService.pagingEmp(pInfo);

		model.addAttribute("map", map);
		model.addAttribute("url", "allEmp");
		model.addAttribute("name", pInfo.getName());
		model.addAttribute("email", pInfo.getEmail());
		model.addAttribute("tel", pInfo.getTel());
		model.addAttribute("index", pInfo.getIndex());

		return "addressBook/allEmp";
	}

//	@RequestMapping(value = "/detail", method = { RequestMethod.GET, RequestMethod.POST })
	@PostMapping("/detailPage")
	public String detail(@ModelAttribute("emp_no") String emp_no
			, Model model) {

		EmpInfoAll detailEmpInfo = addressBookService.detail(emp_no);

		model.addAttribute("detailEmpInfo", detailEmpInfo);

		System.out.println("detailEmpInfo: " + detailEmpInfo);
		
		return "addressBook/detail";
	}


//	 @GetMapping("/detail") public String detail(@ModelAttribute EmpInfoAll empInfo, Model model) {
//	 
//	 model.addAttribute("empInfo", empInfo);
//	 
//	 return "addressBook/detail"; }
}
