package com.kh.circle.poll.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.circle.login.entity.EmpInfo;
import com.kh.circle.poll.entity.Pagination;
import com.kh.circle.poll.entity.PostCode;
import com.kh.circle.poll.entity.PostList;
import com.kh.circle.poll.entity.PreInputData;
import com.kh.circle.poll.service.PollService;

import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;
import oracle.jdbc.proxy.annotation.Pre;

@Slf4j
@Controller
@RequestMapping("/poll")
public class PollController {

	@Autowired
	private PollService pollService;
	

	@GetMapping("/pollMain")
	public String pollMain(HttpSession session, ModelMap modelMap) {
		String empNo = ( (EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();
		List<HashMap<String, String>> list = pollService.homeList(empNo);
		
		modelMap.addAttribute("post", list);
		return "/poll/pollMain";
	}
	@GetMapping("/progress")
	public String progress(HttpSession session
							, @RequestParam(value="nowPage", required=false)String nowPage
							, @RequestParam(value="cntPerPage", required=false)String cntPerPage
							, @RequestParam(value="searchTitle", required=false)String searchTitle
							, @RequestParam(value="searchWriter", required=false)String searchWriter
							, ModelMap modelMap) {
		//로그인 사번 추출
		String empNo = ( (EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();
		
		//페이지정보 없을시 현재페이지 첫페이지로 고정, 한페이지 출력 게시물수 5개로 고정
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {
			cntPerPage = "10";
		}
		
		//사번/검색어 페이지정보 객체화
		Pagination prePageInfo = new Pagination(empNo, searchTitle, searchWriter);
		
		//총 페이지수 DB추출
		int total = pollService.countTotalProgressPost(prePageInfo);
		
		//페이지 정보 변수 추가 재생성
		Pagination pageInfo = new Pagination(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage)
											, prePageInfo.getEmpNo(), prePageInfo.getSearchTitle(), prePageInfo.getSearchWriter());
		
		//페이지 DB추출
		List<HashMap<String,String>> list = pollService.progressList(pageInfo);
		
		//post정보 담기
		modelMap.put("post", list);
		
		//page정보 담기
		modelMap.put("pageInfo", pageInfo);
		
		return "/poll/progress";
	}
	@GetMapping("/finished")
	public String my(HttpSession session
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, @RequestParam(value="searchTitle", required=false)String searchTitle
			, ModelMap modelMap) {
		String empNo = ( (EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();
		if(nowPage == null && cntPerPage == null) {
		nowPage = "1";
		cntPerPage = "10";
		} else if(nowPage == null) {
		nowPage = "1";
		} else if(cntPerPage == null) {
		cntPerPage = "10";
		}
		Pagination prePageInfo = new Pagination(empNo, searchTitle);
		//총 페이지수 DB추출
		int total = pollService.countTotalFinishedPost(prePageInfo);
		//페이지 정보 변수 추가 재생성
		Pagination pageInfo = new Pagination(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage)
									, prePageInfo.getEmpNo(), prePageInfo.getSearchTitle());
		
		//페이지 DB추출
		List<HashMap<String,String>> list = pollService.finishedList(pageInfo);
		//post정보 담기
		modelMap.put("post", list);
		//page정보 담기
		modelMap.put("pageInfo", pageInfo);
		
		return "/poll/finished";
	}
	@GetMapping("/my")
	public String finished(HttpSession session
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, @RequestParam(value="searchTitle", required=false)String searchTitle
			, @RequestParam(value="searchWriter", required=false)String searchWriter
			, ModelMap modelMap) {
		String empNo = ( (EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();
		if(nowPage == null && cntPerPage == null) {
		nowPage = "1";
		cntPerPage = "10";
		} else if(nowPage == null) {
		nowPage = "1";
		} else if(cntPerPage == null) {
		cntPerPage = "10";
		}
		Pagination prePageInfo = new Pagination(empNo, searchTitle, searchWriter);
		//총 페이지수 DB추출
		int total = pollService.countTotalMyPost(prePageInfo);
		//페이지 정보 변수 추가 재생성
		Pagination pageInfo = new Pagination(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage)
									, prePageInfo.getEmpNo(), prePageInfo.getSearchTitle());
		
		
		//페이지 DB추출
		List<HashMap<String,String>> list = pollService.myList(pageInfo);
		
		//post정보 담기
		modelMap.put("post", list);
		//page정보 담기
		modelMap.put("pageInfo", pageInfo);
		return "/poll/my";
	}
	@GetMapping("/post")
	public String post(HttpSession session, @RequestParam String postCode, ModelMap modelMap) {
		
		String empNo = ( (EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();
		
		HashMap<String, String> params = new HashMap<>();
		params.put("postCode", postCode);
		params.put("empNo", empNo);
		
		List<HashMap<String, String>> list = pollService.getQuestion(params);
		int totalAttend = pollService.getTotalAttend(params);
		int realAttend = pollService.getRealAttend(params);
		
		modelMap.put("postCode", postCode);
		modelMap.put("post", list);
		modelMap.put("totalAttend", totalAttend);
		modelMap.put("realAttend", realAttend);
		
		return "/poll/post";
	}
	@GetMapping("/result")
	public String result(HttpSession session, @RequestParam String postCode, ModelMap modelMap) {
		String empNo = ( (EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();
		
		HashMap<String, String> params = new HashMap<>();
		params.put("postCode", postCode);
		params.put("empNo", empNo);
		
		List<HashMap<String, String>> list = pollService.getQuestion(params);
		int totalAttend = pollService.getTotalAttend(params);
		int realAttend = pollService.getRealAttend(params);
		List<HashMap<String, String>> qustRealAttend = pollService.getQustRealAttend(params);
		
		modelMap.put("post", list);
		modelMap.put("totalAttend", totalAttend);
		modelMap.put("realAttend", realAttend);
		modelMap.put("qustRealAttend", qustRealAttend);
		modelMap.put("postCode", postCode);
		
		return "/poll/result";
	}
	@GetMapping("/insert")
	public String insert(HttpSession session, ModelMap madelMap) {
		String empNo = ( (EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();
		
		List<HashMap<String, String>> list = pollService.userInfo(empNo);
		
		return "/poll/insert";
	}
	@PostMapping("/questionInsert")
	public String questionInsert(HttpSession session, PreInputData data, ModelMap modelMap) {
		
		session.setAttribute("prePollData", data);
		modelMap.put("preData", data);
		
//		PreInputData temp = (PreInputData) session.getAttribute("prePollData");
		
//		log.info(temp.toString());
		
		return "/poll/questionInsert";
	}
	
	@PostMapping("/pollInsertComplete")
	public void insertComplete(HttpSession session, List<HashMap<String, Object>> questions) {
		
		PreInputData temp = (PreInputData) session.getAttribute("prePollData");
	}
	
	@PostMapping("/postAttendComplete")
	public void attendComplete(HttpSession session, List<HashMap<String, Object>> formData) {
	}
	
	@GetMapping("/deleteOne")
	public String deleteOne(@RequestParam String postCode) {
		pollService.deleteOne(postCode);
		
		return "/poll/pollMain";
	}
	
}
