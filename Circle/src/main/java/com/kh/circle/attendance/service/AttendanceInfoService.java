package com.kh.circle.attendance.service;

import java.util.List;
import java.util.Map;

public interface AttendanceInfoService {
	public Map<String, Object> attendanceList(Map<String, Object> inputMap);
	
	public void insertStime(Map<String, Object> inputMap);

	public void insertEtime(Map<String, Object> inputMap);
	
	public List<Map<String, Object>> allAttendanceList(Map<String, Object> inputMap);
}
