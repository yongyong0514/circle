package com.kh.circle.attendance.repository;

import java.util.List;

import com.kh.circle.attendance.entity.AttendanceInfo;

public interface AttendanceDao {
	
	public List<AttendanceInfo> list(String emp_no, String date);
}
