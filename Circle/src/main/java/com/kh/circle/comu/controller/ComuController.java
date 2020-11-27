package com.kh.circle.comu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.circle.comu.entity.Comu;
import com.kh.circle.comu.entity.ComuPager;
import com.kh.circle.comu.service.ComuService;

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
			System.out.println("comuController 값 넘어오나?" + a.getComu_post_ordr() + a.getComu_post_cont());
		}

		return mav;
	}
	@RequestMapping(value="/comuAdd")
	public String comuAdd() {
		return "comuAdd";
	}

	@GetMapping("/comuInfoList")
	public String comuInfoList() {
		return "community/comuInfoList";
	}

	@GetMapping("/comuJoin")
	public String comuJoin() {
		return "community/comuJoin";
	}

	// 동호회 게시글 등록
	@GetMapping("/comuAdd")
	public String comuAdd(Model model, @ModelAttribute("comu.comuList") Comu comu) {

		model.addAttribute("comu", comu);

		return "community/comuAdd";
	}

	@GetMapping("/comuApp")
	public String comuApp() {
		return "community/comuApp";
	}
}
