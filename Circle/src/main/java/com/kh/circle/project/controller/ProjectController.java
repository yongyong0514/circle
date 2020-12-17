package com.kh.circle.project.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.circle.login.entity.EmpInfo;
import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostPaging;
import com.kh.circle.post.service.PostService;
import com.kh.circle.project.entity.ProjFile;
import com.kh.circle.project.entity.ProjPaging;
import com.kh.circle.project.entity.Project;
import com.kh.circle.project.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {

	@Autowired
	private ProjectService projService;


	@GetMapping("/projMain")
	public String projMain(Model model, Project project, HttpSession session,
			 ProjPaging projPaging, //뷰페이징
			@RequestParam(value = "nowPage", required = false) String nowPage, // 뷰페이징
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, // 뷰페이징
			@RequestParam(required = false) String type, // 검색
			@RequestParam(required = false) String keyword // 검색
	) {

		// 내정보 얻기

		String emp_no = ((EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();

		String myEmp = projService.projEmpNo(emp_no);

		model.addAttribute("empNo", myEmp);

		// 리스트 업

		project.setEmp_info_emp_no(myEmp);

		List<Project> projMain = projService.projMain(emp_no);

		model.addAttribute("projMain", projMain);

		
		
		/* 뷰페이징 시작 */
		int total = projService.countProject();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";

		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		projPaging = new ProjPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", projPaging);

		/* 뷰페이징 종료 */

		model.addAttribute("projMain", projMain);
		model.addAttribute("paging", projPaging);

		return "project/projMain";
	}

	@GetMapping("/projIssMain")
	public String projIssMain(Model model, Project iss, @RequestParam("pro_code") String pro_code,
			 ProjPaging projPaging, //뷰페이징
				@RequestParam(value = "nowPage", required = false) String nowPage, // 뷰페이징
				@RequestParam(value = "cntPerPage", required = false) String cntPerPage, // 뷰페이징
				@RequestParam(required = false) String type, // 검색
				@RequestParam(required = false) String keyword // 검색
				) {

		model.addAttribute("projIssMain", projService.projIssMain(pro_code));
		
		
		/* 뷰페이징 시작 */
		int total = projService.countProject();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";

		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		projPaging = new ProjPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", projPaging);

		/* 뷰페이징 종료 */

		return "project/projIssMain";
	}

	// project insert
	@GetMapping("/projInsertProject")
	public String InsertProject(HttpSession session,  Model model,	 ProjPaging projPaging, //뷰페이징
			@RequestParam(value = "nowPage", required = false) String nowPage, // 뷰페이징
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, // 뷰페이징
			@RequestParam(required = false) String type, // 검색
			@RequestParam(required = false) String keyword // 검색
			) {

		String emp_no = ((EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();

		String myEmp = projService.projEmpNo(emp_no);

		model.addAttribute("empNo", myEmp);

		// 회원 리스트

		List<Project> projMember = projService.projMember();
		model.addAttribute("projMember", projMember);

		return "project/projInsertProject";
	}

	@PostMapping("/projInsertProjectAdd")
	public String insertProject(@ModelAttribute Project project, HttpSession session,	 ProjPaging projPaging, //뷰페이징
			@RequestParam(value = "nowPage", required = false) String nowPage, // 뷰페이징
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, // 뷰페이징
			@RequestParam(required = false) String type, // 검색
			@RequestParam(required = false) String keyword // 검색
			,Model model) {

		String emp_no = ((EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();

		projService.projInsert(project, emp_no);

		
		/* 뷰페이징 시작 */
		int total = projService.countProject();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";

		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		projPaging = new ProjPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", projPaging);

		/* 뷰페이징 종료 */

		return "redirect:projMain";
	}

	// end

	// iss insert

	@GetMapping("/projInsertIss")
	public String InsertIss(HttpSession session,  Model model, 	 ProjPaging projPaging, //뷰페이징
			@RequestParam(value = "nowPage", required = false) String nowPage, // 뷰페이징
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, // 뷰페이징
			@RequestParam(required = false) String type, // 검색
			@RequestParam(required = false) String keyword // 검색
			) {

		String emp_no = ((EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();

		// 내정보
		String myEmp = projService.projEmpNo(emp_no);
		// 인원
		List<Project> issMember = projService.issMember();
		// 내 프로젝트 리스트
		List<Project> projMain = projService.projMain(emp_no);
		// situ 불러오기
		List<Project> issSitu = projService.issSitu();
		// prog 불러오기
		List<Project> issProg = projService.issProg();

		model.addAttribute("empNo", myEmp);
		model.addAttribute("projMain", projMain);
		model.addAttribute("issProg", issProg);
		model.addAttribute("issSitu", issSitu);
		model.addAttribute("projMember", issMember);

		return "project/projInsertIss";
	}

	@PostMapping("/projInsertIssAdd")
	public String insertIss(@ModelAttribute Project project, HttpSession session, 	 ProjPaging projPaging, //뷰페이징
			@RequestParam(value = "nowPage", required = false) String nowPage, // 뷰페이징
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, // 뷰페이징
			@RequestParam(required = false) String type, // 검색
			@RequestParam(required = false) String keyword // 검색
			, Model model,
			@RequestParam MultipartFile iss_file

	) throws IllegalStateException, IOException {

		String emp_no = ((EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();
		project.setIss_emp_no(emp_no);

		String pro_code = project.getIss_pro_code();



		projService.projInsertIss(project, iss_file, emp_no);

		model.addAttribute("projIssMain", projService.projIssMain(pro_code));
		
		
		
		/* 뷰페이징 시작 */
		int total = projService.countProject();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";

		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		projPaging = new ProjPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", projPaging);

		/* 뷰페이징 종료 */


		return "redirect:projIssMain?pro_code=" + pro_code;
	}

	@GetMapping("/projIssAll")
	public String projIssMain(Model model, HttpSession session, Project iss,	 ProjPaging projPaging, //뷰페이징
			@RequestParam(value = "nowPage", required = false) String nowPage, // 뷰페이징
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, // 뷰페이징
			@RequestParam(required = false) String type, // 검색
			@RequestParam(required = false) String keyword // 검색
			) {

		String emp_no = ((EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();

		String myEmp = projService.projEmpNo(emp_no);

		model.addAttribute("empNo", myEmp);

		// 리스트 업

		iss.setEmp_info_emp_no(myEmp);

		List<Project> IssMain = projService.projIssAll(emp_no);

		model.addAttribute("projissAll", IssMain);

		
		/* 뷰페이징 시작 */
		int total = projService.countProject();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";

		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		projPaging = new ProjPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", projPaging);

		/* 뷰페이징 종료 */

		return "project/projIssAll";
	}

	// post View page
	@GetMapping("/projDetail")
	public String postView(Post post, Model model, @RequestParam("pro_code") String pro_code, HttpSession session,
			@ModelAttribute Post test, // 제약 조건용
			 ProjPaging projPaging, //뷰페이징
				@RequestParam(value = "nowPage", required = false) String nowPage, // 뷰페이징
				@RequestParam(value = "cntPerPage", required = false) String cntPerPage, // 뷰페이징
				@RequestParam(required = false) String type, // 검색
				@RequestParam(required = false) String keyword // 검색
				) {

		// 내정보 제약 조건용


		String emp_no = ((EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();
		String myEmp = projService.projEmpNo(emp_no);

		model.addAttribute("empNo", myEmp);


		List<Project> iss_code = projService.projGetIss(pro_code);

		// 게시글 정보
		List<Project> projDetail = projService.projDetail(pro_code);
		List<Project> projDetail2 = projService.projDetail2(pro_code);
		List<ProjFile> projDetail3 = projService.projDetail3(pro_code);
		List<Project> projMemberlist = projService.projMemberlist(pro_code);


		model.addAttribute("projDetail", projDetail);
		model.addAttribute("projDetail2", projDetail2);
		model.addAttribute("projDetail3", projDetail3);
		model.addAttribute("projMemberlist", projMemberlist);
		
		// end

		
		/* 뷰페이징 시작 */
		int total = projService.countProject();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";

		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		projPaging = new ProjPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", projPaging);

		/* 뷰페이징 종료 */

		return "project/projDetail";
	}

	@GetMapping("/projDownload")
	public ResponseEntity<ByteArrayResource> download2(@RequestParam("pro_files_code") String pro_files_code) throws IOException {
		
		
		ResponseEntity<ByteArrayResource> entity = projService.download(pro_files_code);
		
		
		return entity;
	}
	
	
	
	@GetMapping("/projIssDetail")
	public String projIssDetail(Post post, Model model, @RequestParam("iss_code") String iss_code,HttpSession session,
			 ProjPaging projPaging, //뷰페이징
				@RequestParam(value = "nowPage", required = false) String nowPage, // 뷰페이징
				@RequestParam(value = "cntPerPage", required = false) String cntPerPage, // 뷰페이징
				@RequestParam(required = false) String type, // 검색
				@RequestParam(required = false) String keyword // 검색
				) {

		
		// 내정보 제약 조건용


				String emp_no = ((EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();
				String myEmp = projService.projEmpNo(emp_no);

				model.addAttribute("empNo", myEmp);
				
				System.out.println(iss_code);

				List<ProjFile> projDetail4 = projService.projDetail4(iss_code);
				System.out.println(projDetail4);
				
				List<ProjFile> projIssDetail = projService.projIssDetail(iss_code);

				// 게시글 정보
				model.addAttribute("projDetail4", projDetail4);
				model.addAttribute("projIssDetail", projIssDetail);

				// end
				
				/* 뷰페이징 시작 */
				int total = projService.countProject();
				if (nowPage == null && cntPerPage == null) {
					nowPage = "1";
					cntPerPage = "5";

				} else if (nowPage == null) {
					nowPage = "1";
				} else if (cntPerPage == null) {
					cntPerPage = "5";
				}

				projPaging = new ProjPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				model.addAttribute("paging", projPaging);

				/* 뷰페이징 종료 */

				return "project/projIssDetail";	}
	
	
	@GetMapping("/projKanban")
	public String projKanban(HttpSession session,Model model,Project project,  @RequestParam("pro_code") String pro_code)  {
		
		String emp_no = ((EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();
		String myEmp = projService.projEmpNo(emp_no);

		model.addAttribute("empNo", myEmp);
		
		List<Project> projKanban = projService.projKanban(pro_code);
		String projKanbanHead = projService.projKanbanHead(pro_code);
		
		
		model.addAttribute("projKanban", projKanban);
		model.addAttribute("projKanbanHead", projKanbanHead);
		
		return "project/projKanban";
	}

}
