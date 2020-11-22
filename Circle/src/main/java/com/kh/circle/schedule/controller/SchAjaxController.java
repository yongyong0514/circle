package com.kh.circle.schedule.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.circle.schedule.entity.SchAjax;
import com.kh.circle.schedule.entity.SchAjaxEntry;
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
	public List<SchAjax> schMain(String id, Date start, Date end, String myCalendarCheck
								, String pollCheck, String projectCheck,String communityCheck
								, String vacationCheck) {
		
		
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("start", start);
		map.put("end", end);
		map.put("myCalendarCheck", myCalendarCheck);
		map.put("pollCheck", pollCheck);
		map.put("projectCheck", projectCheck);
		map.put("communityCheck", communityCheck);
		
		
		log.info("calendar data(id,date, grouping check data) received into server: {}", map);
		
		List<SchAjax> MergedList = new ArrayList<SchAjax>();
		if(myCalendarCheck.length() < 5 ) {
			List<SchAjax>list = schService.list(map);
			MergedList.addAll(list);
		}
		if(vacationCheck.length() < 5 ) {
			List<SchAjax>list = schService.vacationList(map);
			MergedList.addAll(list);
		}
//		if(pollCheck.length() < 5 ) {
//			List<SchAjax>list = schService.pollList(map);
//			MergedList.addAll(list);
//		}
//		if(projectCheck.length() < 5 ) {
//			List<SchAjax>list = schService.projectList(map);
//			MergedList.addAll(list);
//		}
//		if(communityCheck.length() < 5 ) {
//			List<SchAjax>list = schService.list(map);
//			MergedList.addAll(list);
//		}
		
		log.info("month events callback data send to page: {} " , MergedList);
		return MergedList;
	}
	
	@PostMapping("/entry")
	public List<HashMap<String, String>> entryList(@RequestBody String id){
		
		log.info("id : {}", id);
		
		List<HashMap<String, String>> list = schService.entryList(id);
		
		return list;
	}
	
	@PostMapping("/schInsert")
	public void schInsert(@RequestBody Map<String, String> insertEvent) {
		
		log.info("insert data received into server: {} " ,insertEvent);
		
		schService.insert(insertEvent);
		
	}
	
	@PostMapping("/schDelete")
	public void schDelete(@RequestBody String id) {
		log.info("delete data received into server: {} ", id);
		
		schService.delete(id);
	}
	
	@PostMapping("/schUpdate")
	public void schUpdate(@RequestBody Map<String, String> updateEvent) {
		log.info("update date received into server: {}", updateEvent);
		
		schService.update(updateEvent);
	}
	
}
