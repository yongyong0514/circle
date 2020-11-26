package com.kh.circle.attendance.repository;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.attendance.entity.AttendanceInfo;
import com.kh.circle.attendance.entity.AttendanceSum;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class AttendanceDaoImpl implements AttendanceDao{

	@Autowired
	private SqlSession sqlSession;
	
	//근태이력 출력
	@Override
	public List<AttendanceInfo> attendanceList(String emp_no, String date) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("emp_no", emp_no);
		map.put("date", date);
		
		
		List<AttendanceInfo> list = sqlSession.selectList("attendance.list", map);
		
		SimpleDateFormat sdf = new SimpleDateFormat("hh"+"시간 "+"mm"+"분");
		
		//long형으로 반환된 근무시간을 workTime에 저장
		for(AttendanceInfo attendanceInfo : list) {
			attendanceInfo.setWorkTime(sdf.format(attendanceInfo.getLongWorkTime()));
			
			log.info("dao attendanceInfo: " + attendanceInfo);
		}
		
		return list;
	}

	//주간 누적 출력
	@Override
	public AttendanceSum weekSum(String emp_no, String date) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("emp_no", emp_no);
		map.put("date", date);
		
		AttendanceSum atSum = sqlSession.selectOne("attendance.weekSum", map);
		
		return atSum;
	}
	
	
}
