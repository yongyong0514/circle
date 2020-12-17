package com.kh.circle.common.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.circle.login.entity.EmpInfo;
import com.kh.circle.sign.vo.SignList;

@Controller
@RequestMapping("/common")
public class MenuController {
	
	@Autowired
	private SqlSession sqlSession;

	
	@GetMapping("/menuScrollList")
	public String menuScrollList() {
		return "common/menuScrollList";
	}
	
	
	@GetMapping("/mainPage")
	public String mainPage(HttpSession session, Model model) {
		String emp_info_emp_no = ((EmpInfo)session.getAttribute("empInfo")).getEmp_info_emp_no();
		
		List<SignList> list1 = sqlSession.selectList("sign.list", emp_info_emp_no);
		model.addAttribute("list1", list1);
		
		return "common/mainPage";
	}
}

//메뉴 합병 완료 삭제 예정