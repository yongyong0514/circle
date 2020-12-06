package com.kh.circle.comu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.servlet.ModelAndView;

import com.kh.circle.comu.entity.Comu;
import com.kh.circle.comu.entity.ComuList;
import com.kh.circle.comu.entity.ComuPager;
import com.kh.circle.comu.service.ComuService;
import com.kh.circle.login.entity.EmpInfo;
import com.kh.circle.post.entity.Post;

@Controller
@RequestMapping("/community")
public class ComuController {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private ComuService service;

	// 게시글 가져오기
	@GetMapping("/comuList")
	public ModelAndView comuList(@RequestParam(defaultValue = "1") int curPage) throws Exception {
		// 페이징 처리
		int count = service.comuListarticle();
		ComuPager pager = new ComuPager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		// 게시글 리스트
		ModelAndView mav = new ModelAndView();
		List<Comu> comuList = service.comuList(start, end/* 페이징에 필요한거 넣어주기 */);
		mav.setViewName("community/comuList");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", comuList);
		// 맵에 pager 넣는다
		map.put("pager", pager);
		mav.addObject("map", map);
		// model.addAttribute("comuList",comuList);
		for (Comu a : comuList) {
			System.out.println("comuController 값 넘어오나?" + a.getComu_list_name() + a.getEmp_info_name());
		}

		return mav;
	}
	//게시글 작성
	@RequestMapping(value="/comuAdd")	
									//하나씩 가져올때는 add에 name이 job인 객체(@ModelAttribute("job") String str,
	public String comuAdd(@ModelAttribute Comu comu,	
				Model model) {
		comu.getComu_post_title();
		
		List<ComuList> list = sqlSession.selectList("comu.comuNameList");
		model.addAttribute("list",list);
		
		return "community/comuAdd";
	}
	
	
	@PostMapping("/comuAddAction")
	public String comuAddAction(HttpSession session ,
					@ModelAttribute Comu comu)throws Exception{
		//여기까지가 1번째 단계
		
		//System.out.println("대충 : " + comu);
		String emp_no = ((EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();
		//System.out.println("DDD : " + emp_no);		
		String emp_name = service.comuAdd2(emp_no);
		
		//System.out.println("DDFD : " + emp_name);
		//2번째 단계 끝
		
		comu.setComu_post_wrtr_emp_no(emp_no);
		comu.setEmp_info_name(emp_name);
		
		service.comuInsert(comu);
		
		System.out.println("last : " + comu);
		
		return"redirect:/community/comuList";
	}

	//게시글 상세조회
	@GetMapping ("comuDetail")
		public String comuDetail(Model model,@RequestParam("comu_post_ordr") String comu_post_ordr) {
		
		//번호가져와서 해당하는 번호를 볼수있게
		model.addAttribute("comuDetail",service.comuDetail(comu_post_ordr));
		
		return "community/comuDetail";
	}

	/* 수정하기로 들어가기 comu_post_wrtr_emp_no 가 맞아야 들어간다 */
	@GetMapping("/comuUpdate")
	public String comuUpdate(Model model,@RequestParam("comu_post_ordr")String comu_post_ordr) {
		
		Comu comuCheck = service.comuCheck(comu_post_ordr);
		model.addAttribute("comuCheck",comuCheck);
		
		return "community/comuUpdate";
	}
	@PostMapping("/comuUpdate")
	public String comuUpdate(@ModelAttribute Comu comu,HttpSession session,
			@RequestParam("comu_post_ordr")String comu_post_ordr) {
		
		service.comuUpdate(comu);
		
		//return "redirect:/community/comuList";
		return "redirect:/community/comuDetail?comu_post_ordr="+comu.getComu_post_ordr(); 
	}
	
	//게시글 삭제
	@GetMapping("/comuDelete")
	public String comuDelete(@RequestParam("comu_post_ordr")String comu_post_ordr) {
	service.comuDelete(comu_post_ordr);
	
	return "redirect:/community/comuList";
}	
	
	@GetMapping("/comuInfoList")
	public String comuInfoList() {
		return "community/comuInfoList";
	}

	@GetMapping("/comuJoin")
	public String comuJoin() {
		return "community/comuJoin";
	}
	
	//동호회 종류 리스트
	@GetMapping("/comuListName")
	public String comuListName(@ModelAttribute ComuList comuList,
								Model model) {
		comuList.getComu_list_code();
		List<ComuList> comuListName = sqlSession.selectList("comu.comuListName");
		model.addAttribute("comuListName",comuListName);
		
		System.out.println("controller ListName"+comuListName);
		
		return "community/comuListName";
	}
	//동호회 가입 신청서로 넘어가기
	@GetMapping("/comuApp")
	public String comuApp(HttpSession session ,
			@ModelAttribute ComuList comuList)throws Exception{
		
		
		System.out.println("대충 : " + comuList);
		String comu_list_code = ((EmpInfo) session.getAttribute("empInfo")).getComu_list_code();
		System.out.println("DDD : " + comu_list_code);		
		String list_name = service.comuApp(comu_list_code);
		
		System.out.println("list name : " + list_name);
		//2번째 단계 끝
		
		comuList.setComu_list_name(comu_list_code);
		//comuList.setEmp_info_name(list_name);
		
		service.comuApp(comu_list_code);
		
		System.out.println("App last : " + comuList);
		
		System.out.println("comuApp으로 가는길임??");
		return "community/comuApp";
	}
}


//	@GetMapping("/edit")
//		public String edit(@RequestParam String comu_post_wrtr_emp_no) {
//			Comu comu=sqlSession.selectOne("");
//		
//		
//			return "community/comuUpdate";
//		}
//		
//	}

//게시글 동호회 선택
/*
 * @GetMapping("/comuName") public ModelAndView comuName() throws Exception{ //
 * 게시글 리스트 ModelAndView mv = new ModelAndView(); List<Comu> comuName =
 * service.comuName(); mv.setViewName("community/comuAdd"); Map<String, Object>
 * mapName = new HashMap<String, Object>(); mapName.put("comuName", comuName);
 * mv.addObject("mapName", mapName); // model.addAttribute("comuList",comuList);
 * for (Comu a : comuName) { System.out.println("comuName 값 넘어오낭??" +
 * a.getComu_list_name()); } return mv; }
 */

// 동호회 게시글 등록
/*
 * @GetMapping("/comuAdd") public String comuAdd(Model
 * model, @ModelAttribute("comu.comuList") Comu comu) {
 * 
 * model.addAttribute("comu", comu);
 * 
 * return "community/comuAdd"; }
 */