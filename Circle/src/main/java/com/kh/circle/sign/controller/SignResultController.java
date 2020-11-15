package com.kh.circle.sign.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/signResult")
public class SignResultController {
	
	@Autowired
	private SqlSession sqlSession;

	@GetMapping("/signListJoinerCount")
	public Map<String, Object> signListJoinerCount(@RequestParam String signCode) {
		int count = sqlSession.selectOne("sign.count", signCode);
		
		Map<String, Object> map = new HashMap<>();
		map.put("count", count);

		return map;
	}
	
//	@GetMapping("/signListJoiner")
//	@GetMapping("/singListWatcher")
									
}
