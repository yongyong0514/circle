package com.kh.circle.schedule.controller;

import java.sql.Date;
import java.util.List;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	private ScheduleService scheduleService;
	
	@GetMapping("/id")
	public List<SchAjax_min> schMain(String id) {
		
		
		log.info("model : {}", id );
		
//		String id = "200101090031";
		
		List<SchAjax_min> list = scheduleService.list(id);
		log.info("list : {} " , list);
		
		return list;
	}
	
}
