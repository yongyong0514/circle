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

import com.kh.circle.alert.controller.alertController;
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
		/*
		 * for (Comu a : comuList) { System.out.println("comuController 값 넘어오나?" +
		 * a.getComu_list_name() + a.getEmp_info_name()); }
		 */
			
		return mav;
	}
	//동호회 별 게시글 목록
	@GetMapping("/comuListPost")
	public String comuListPost(Model model,@RequestParam("comu_list_code") String comu_list_code) {
		
		//번호가져와서 해당하는 번호를 볼수있게
		model.addAttribute("comuListPost",service.comuListPost(comu_list_code));
		
		//System.out.println("controller 개별로 나오는지 확인"+model);
		return "community/comuListPost";
	}
	//가입신청서 별 리스트
	@GetMapping("/comuAppList")
	public String comuAppList( @ModelAttribute Comu comu ,Model model ) {
		
		//타입 가져오기
		model.addAttribute("comuAppList",service.comuAppList());
		
		//System.out.println("controller 가입신청서 나오냐 "+model);
		return "community/comuAppList";
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
		String emp_no = ((EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();	
		String emp_name = service.comuAdd2(emp_no);
		//2번째 단계 끝
		comu.setComu_post_wrtr_emp_no(emp_no);
		comu.setEmp_info_name(emp_name);
		
		service.comuInsert(comu);
		
		System.out.println("last : " + comu);
		
		return"redirect:/community/comuList";
	}
//	@PostMapping("/comuAppAction")
//	public String comuAppAction(HttpSession session ,
//			@ModelAttribute Comu comu)throws Exception{
//		//여기까지가 1번째 단계
//		String emp_no = ((EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();	
//		String emp_name = service.comuAdd2(emp_no);
//		//2번째 단계 끝
//		comu.setComu_post_wrtr_emp_no(emp_no);
//		comu.setEmp_info_name(emp_name);
//		
//		service.comuInsert(comu);
//		
//		System.out.println("last : " + comu);
//		
//		return"redirect:/community/comuList";
//	}
	

	//게시글 상세조회
	@GetMapping ("comuDetail")
		public String comuDetail(Model model,Comu comu,
				@RequestParam("comu_post_ordr") String comu_post_ordr , HttpSession session) {
		
		String emp_no = ((EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();
		
		String emp_name = service.comuEmpNo(emp_no);
		
		model.addAttribute("empNo", emp_name);
		
		//번호가져와서 해당하는 번호를 볼수있게
		List<Comu> detail = service.comuDetail(comu_post_ordr);
		String comu_emp = service.viewEmpNo(comu_post_ordr);
		model.addAttribute("viewEmpNo",comu_emp);
		
		model.addAttribute("comuDetail",detail);
	
		
		return "community/comuDetail";
	}
	//가입신청서 디테일
	@GetMapping("/appDetail")
	public String appDetail(Model model,
			@RequestParam("comu_post_ordr") String comu_post_ordr ) {
	
	List<Comu> detail = service.appDetail(comu_post_ordr);
	  
	model.addAttribute("appDetail",detail);
	
	
	return "community/appDetail";
	}
	/* 수정하기로 들어가기 comu_post_wrtr_emp_no 가 맞아야 들어간다 */
	@GetMapping("/comuUpdate")
									//화면을 보여주려면 게시글 번호가 필요
	public String comuUpdate(Model model,@RequestParam("comu_post_ordr")String comu_post_ordr) {
		
		Comu comuCheck = service.comuCheck(comu_post_ordr);
		model.addAttribute("comuCheck",comuCheck);
		
		System.out.println("comuCheck controller"+model);
		
		model.addAttribute("msg", "수정하기로"); 
		model.addAttribute("url", "comuUpdate.jsp"); 
		
		return "community/comuUpdate";
	}
	@PostMapping("/comuUpdate")//필요한 정보 한번에 가져오기Model
	public String comuUpdate(@ModelAttribute Comu comu,HttpSession session,
			@RequestParam("comu_post_ordr")String comu_post_ordr) {
		
		service.comuUpdate(comu);
		System.out.println("comuUpdate controller"+comu);
		//return "redirect:/community/comuList";
		return "redirect: comuDetail?comu_post_ordr="+comu.getComu_post_ordr(); 
	}
	//가입 신청서 
	//게시글 삭제
	@GetMapping("/comuDelete")
	public String comuDelete(@RequestParam("comu_post_ordr")String comu_post_ordr) {
	service.comuDelete(comu_post_ordr);
	return "redirect:/community/comuList";
}	
	@GetMapping("/appDelete")
	public String appDelete(@RequestParam("comu_post_ordr")String comu_post_ordr) {
	service.appDelete(comu_post_ordr);
	
	return "redirect:/community/comuAppList";
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
		
		return "community/comuListName";
	}
	//동호회 가입 신청서로 넘어가기
	@GetMapping("/comuApp")
	public String comuApp(Model model ,
			@RequestParam("comu_list_code") String comu_list_code){
		
		
		model.addAttribute("comuApp",service.comuApp(comu_list_code));
		
		System.out.println("App last : " + model);
		
		System.out.println("comuApp으로 가는길임??");
		return "community/comuApp";
	}
	//가입신청서 작성하기
	@PostMapping("/comuAppAction")
	public String comuAppAction(HttpSession session ,
					@ModelAttribute Comu comu)throws Exception{
		//여기까지가 1번째 단계
		
		//System.out.println("대충 : " + comu);
		String emp_no = ((EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();
		//System.out.println("DDD : " + emp_no);		
		String emp_name = service.comuApp2(emp_no);
		
		//System.out.println("DDFD : " + emp_name);
		//2번째 단계 끝
		
		comu.setComu_post_wrtr_emp_no(emp_no);
		comu.setEmp_info_name(emp_name);
		
		service.comuAppAction(comu);
		
		System.out.println("last : " + comu);
		
		return"redirect:/community/comuListName";
	}
	
	//comuLeftBar에 가입한 동호회 리스트
	@GetMapping("/comuLeftBar")
	public String leftList(Model model, @RequestParam("emp_info_emp_no") String emp_info_emp_no) {
		//comuList.getComu_list_code();
		
		//List<ComuList> leftList = sqlSession.selectList("comu.leftList");
		
		
		model.addAttribute("leftList",service.leftList(emp_info_emp_no));
		
		System.out.println("controller 레프트 바 가져왓냐"+model);
		
		return "community/comuLeftBar";
	}
	@PostMapping("/comuInfoInsert")
	public String comuInfoInsert(HttpSession session ,
					@ModelAttribute Comu comu){
		//여기까지가 1번째 단계
		
		//System.out.println("대충 : " + comu);
		String emp_no = ((EmpInfo) session.getAttribute("empInfo")).getEmp_info_emp_no();
		System.out.println("가입신청사번 출력  : " + emp_no);		
		String emp_name = service.comuApp4(emp_no);
		
		//String emp_code = service.comuApp3(emp_no);
		//System.out.println("뭐뽑았냐? : " + emp_code);
		//2번째 단계 끝
		
		comu.setComu_info_emp_no(emp_no);
		comu.setComu_info_comu_code(emp_name);
		
		//comu.setComu_info_comu_code(emp_code);
		System.out.println("가입신청허가"+comu);
		
		service.comuInfoInsert(comu);
		
		System.out.println("last 가입승인임니다 : " + comu);
		
		return"redirect:/community/comuAppList";
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

