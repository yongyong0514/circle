package com.kh.circle.sign.controller;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.circle.sign.service.SignService;
import com.kh.circle.sign.vo.SignEmpList;
import com.kh.circle.sign.vo.SignList;
import com.kh.circle.sign.vo.SignSelectOne;
import com.kh.circle.sign.vo.SignType;
import com.kh.circle.sign.vo.SignWriteInsert;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/sign")
public class SignController {

	@Autowired
	private SqlSession sqlSession;
	
	@Inject
	SignService signService;
	
//	@Autowired
//	private SignService signService;
	
//	@GetMapping("/signList")
//	public String signList(Model model) {
//		List<Sign> list = sqlSession.selectList("sign.list");
//		model.addAttribute("list", list);
//
//		return "sign/signList";
//	}
	
	
//	결재 작성 화면
	@GetMapping("/signWrite")
	public String signWrite(Model model) {
		List<SignType> list = sqlSession.selectList("sign.signTypeList");
		model.addAttribute("list", list);
		
		List<SignEmpList> list2 = sqlSession.selectList("sign.signEmpList");
		model.addAttribute("list2", list2);
		
		return "sign/signWrite";
	}
	
// 결재 작성
	@PostMapping("/signWrite")
	public String signWrite(@ModelAttribute SignWriteInsert signWriteInsert) {
		System.out.println(signWriteInsert);
		return "redirect:signList";
	}
	
////	결재 작성
//	@RequestMapping(value = "/signWrite", method = RequestMethod.POST)
//	public String write(SignWrite signWrite) throws Exception {
//		signService.write(signWrite);
//		
//		return "redirect:/";
//	}
	
//	결재 첫화면
	@GetMapping("/signList")
	public String signList(Model model) {
		List<SignList> list = sqlSession.selectList("sign.list");
		model.addAttribute("list", list);
		
		List<SignList> list2 = sqlSession.selectList("sign.listComplete");
		model.addAttribute("list2", list2);

		return "sign/signList";
	}


//	@RequestMapping(value ="/signListAll", method = RequestMethod.GET)
//	public String list(Model model) throws Exception {
//		model.addAttribute("list", signService.list());
//		
//		return "sign/signListAll";
//	}
	
//	@RequestMapping(value="/signSelectOne", method = RequestMethod.GET)
//	public String read(SignSelectOne signSelectOne, Model model) throws Exception {
//		model.addAttribute("read", signService.read(signSelectOne.getSign_code()));
//		
//		return "sign/signSelectOne";
//	}
	
//	@GetMapping("/signWrite")
//	public String signWrite() {
//		return "sign/signWrite";
//	}
//	
//	@GetMapping("/signWriteForm")
//	public String signWriteForm() {
//		return "sign/signWriteForm";
//	}
//	
	@GetMapping("/signSelectOne")
	public String signSelectOne(@RequestParam String signCode, Model model) {
		SignSelectOne signSelectOne = sqlSession.selectOne("sign.signSelectOne", signCode);
		
		model.addAttribute("signSelectOne", signSelectOne);
		
		return "sign/signSelectOne";
	}
	
	@GetMapping("/docuList")
	public String docuList() {
		return "document/docuList";
	}
}
