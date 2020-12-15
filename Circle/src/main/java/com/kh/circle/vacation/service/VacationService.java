package com.kh.circle.vacation.service;

import java.util.Map;

import com.kh.circle.sign.vo.SignWriteInsert;
import com.kh.circle.vacation.entity.VacationInfo;

public interface VacationService {
	
	public Map<String, Object> vacationList(String emp_no);
	
	public SignWriteInsert formVacation(VacationInfo vacationInfo);
	
	public String findSignCode(String emp_no);
	
	public void addVacation(VacationInfo vacationInfo);
}
