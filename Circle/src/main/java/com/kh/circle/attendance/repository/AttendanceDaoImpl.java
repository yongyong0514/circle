package com.kh.circle.attendance.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.attendance.entity.AttendanceInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class AttendanceDaoImpl implements AttendanceDao{

	@Autowired
	private SqlSession sqlSession;
	
	//근태이력 출력
	@Override
	public List<AttendanceInfo> list(String emp_no, String date) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("emp_no", emp_no);
		map.put("date", date);
		
		List<AttendanceInfo> list = sqlSession.selectList("attendance.list", map);
		
		log.info("list 결과:" + list);
		
		return list;
	}
	
	
}
