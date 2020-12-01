package com.kh.circle.vacation.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.circle.vacation.entity.Vacation;
import com.kh.circle.vacation.repository.VacationRepository;

@Service
public class VacationServiceImpl implements VacationService {
	@Autowired
	private VacationRepository vacationRepository;
	
	@Override
	public Map<String, Object> vacationList(String emp_no) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Vacation> vList = vacationRepository.vacationList(emp_no);
		map.put("vList", vList);
		
		return map;
	}

}
