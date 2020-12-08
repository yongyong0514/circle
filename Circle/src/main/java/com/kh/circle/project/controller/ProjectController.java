package com.kh.circle.project.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.circle.login.entity.EmpInfo;
import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostPaging;
import com.kh.circle.project.entity.ProjPaging;
import com.kh.circle.project.entity.Project;
import com.kh.circle.project.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {

	@Autowired
	private ProjectService projService;
	
	
	
	@GetMapping("/projMain")
	public String projMain(Model model, Project project, ProjPaging projPaging, HttpSession session,
			@RequestParam(value = "nowPage", required = false) String nowPage, // 뷰페이징
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, // 뷰페이징
			@RequestParam(required = false) String type, // 검색
			@RequestParam(required = false) String keyword // 검색
			) {
		
		//내정보 얻기
		
				String emp_no = ((EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();

				System.out.println("emp_no : " + emp_no);
						
				String myEmp = projService.projEmpNo(emp_no);
				
				
				model.addAttribute("empNo", myEmp);
		
		// 리스트 업

		project.setEmp_info_emp_no(myEmp);
				
		System.out.println("check myEmp: " +myEmp);

		List<Project> projMain = projService.projMain(emp_no);
		
		
		System.out.println("tet" + projMain);
		
		model.addAttribute("projMain", projMain);
		
		//중복 프로젝트값 받
		
		List<Project> projCheck = projService.projCheck(emp_no);


		model.addAttribute("projCheck", projCheck);
		
		/* 뷰페이징 시작 */
		int total = projService.countPost();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";

		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		String post_type = "";
		projPaging = new ProjPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		/* 뷰페이징 종료 */

		model.addAttribute("projMain", projMain);
		model.addAttribute("paging", projPaging);
		
		return "project/projMain";
	}
	

	@GetMapping("/projIssMain")
	public String projIssMain(Model model, Project iss, @RequestParam("pro_code") String pro_code) {
		
		System.out.println("DDDD" + pro_code);
		

		
		model.addAttribute("projIssMain", projService.projIssMain(pro_code));
	
		System.out.println("proj lsig :  " + model );
		
		
		return "project/projIssMain";
	}

	
	
	@GetMapping("/projKanban")
	public String projKanban(Model model) {
		
		
		
		return "project/projKanban";
	}
	

	@GetMapping("/projTodo")
	public String projTodo(Model model) {
		
		return "project/projTodo";
	}
	
	
	@GetMapping("/projInsert")
	public String projInsert() {
		return "project/projInsert";
	}

	
	

	@GetMapping("/projView")
	public String projView() {
		return "project/projView";
	}
	
	///////////////////////////////////////////
	

	
	
	
}
