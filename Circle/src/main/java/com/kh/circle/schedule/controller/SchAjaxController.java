package com.kh.circle.schedule.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.circle.schedule.entity.SchAjax;
import com.kh.circle.schedule.entity.SchAjax_min;
import com.kh.circle.schedule.entity.Sch_unit;
import com.kh.circle.schedule.service.ScheduleService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/schAjax")
public class SchAjaxController  {

	//jsp 없이 데이터만 전송할 예정
	
	@Autowired
	private ScheduleService schService;
	
	@GetMapping("/id")
	public List<SchAjax> schMain(String id, Date start, Date end) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("start", start);
		map.put("end", end);
		
		log.info("firstList - id, date import : {}", map);
		
//		String id = "200101090031";
		
		List<SchAjax> list = schService.list(map);
		log.info("firstList - month events callback : {} " , list);
		
		return list;
	}
	
	@PostMapping("/schInsert")
	public void schInsert(@RequestBody Map<String, String> insertEvent) {
		
		log.info("insert - info map : {} " ,insertEvent.get("allDay"));
		
		schService.insert(insertEvent);
		
	}
	
}
