package com.kh.circle.attendance.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.attendance.entity.AttendanceInfo;
import com.kh.circle.attendance.entity.WeekStackInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class AttendanceInfoRepositoryImpl implements AttendanceInfoRepository {
	@Autowired
	private SqlSession sqlSession;
	
	//주간 근태기록
	@Override
	public List<AttendanceInfo> attendanceList(Map<String, Object> inputMap) {
		List<AttendanceInfo> weekAttList = sqlSession.selectList("attendance.searchWithEmpNo", inputMap);
		
		return weekAttList;
	}

	//기준근무시간
	@Override
	public int worktimePerWeek(String emp_no) {
		int worktimePerWeek = sqlSession.selectOne("attendance.worktimePerWeek", emp_no);
		
		return worktimePerWeek;
	}

	//주간누적근무시간
	@Override
	public WeekStackInfo weekStackWorkTime(Map<String, Object> inputMap) {
		WeekStackInfo wsi = sqlSession.selectOne("attendance.weekStackWorkTime", inputMap);
		
		return wsi;
	}

}
