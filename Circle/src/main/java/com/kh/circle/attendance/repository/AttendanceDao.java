package com.kh.circle.attendance.repository;

import java.util.List;

import com.kh.circle.attendance.entity.AttendanceInfo;
import com.kh.circle.attendance.entity.AttendanceSum;

public interface AttendanceDao {
	
	public List<AttendanceInfo> attendanceList(String emp_no, String date);

	public AttendanceSum weekSum(String emp_no, String date);
}

