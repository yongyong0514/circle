package com.kh.circle.empInfo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.circle.empInfo.entity.EmpInfoAll;
import com.kh.circle.empInfo.service.EmpInfoService;
import com.kh.circle.login.entity.EmpInfo;

@Controller
@RequestMapping("/empInfo")
public class EmpInfoController {
	@Autowired
	private EmpInfoService empInfoService;
	
	@GetMapping("/myInfo")
	public String myInfo(HttpSession session,
						Model model) {

		String emp_no = ( (EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();

		if(emp_no != null) {
			Map<String, Object> map = empInfoService.empInfoOne(emp_no);
			
			model.addAttribute("map", map);

			return "attendance/myInfo";
		} else {
			model.addAttribute("msg", "로그인 후 사용 가능합니다.");
			
			return "common/error";
		}
	}
	
	@GetMapping("/allInfoList")
	public String allInfoList(@RequestParam(value="nowPage", defaultValue="1") int nowPage,
								@RequestParam(value="perPage", defaultValue="10") int perPage,
								@RequestParam(value="empNo", required=false) String empNo,
								@RequestParam(value="name", required=false) String name,
								@RequestParam(value="deptName", required=false) String deptName,
								Model model) {
		
		//입력값 전달용 맵
		Map<String, Object> inputMap = new HashMap<String, Object>();
		
		inputMap.put("nowPage", nowPage);
		inputMap.put("perPage", perPage);
		inputMap.put("empNo", empNo);
		inputMap.put("name", name);
		inputMap.put("deptName", deptName);
		
		List<EmpInfoAll> empList = empInfoService.empInfoList(inputMap);
		
		model.addAttribute("empList", empList);
		
		return "attendance/allInfoList";
	}
}
