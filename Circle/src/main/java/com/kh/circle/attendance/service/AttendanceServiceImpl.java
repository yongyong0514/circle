package com.kh.circle.attendance.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.circle.attendance.entity.AttendanceInfo;
import com.kh.circle.attendance.repository.AttendanceDao;

@Service
public class AttendanceServiceImpl implements AttendanceService{

	@Autowired
	private AttendanceDao attendanceDao;
	
	@Override
	public Map<String, Object> mainList(String emp_no, String date) {

		//사원번호를 이용해 근태현황 불러오기
		List<AttendanceInfo> list = attendanceDao.list(emp_no, date);
		
		//누적현황 계산하기
		
		
		return null;
	}

}
