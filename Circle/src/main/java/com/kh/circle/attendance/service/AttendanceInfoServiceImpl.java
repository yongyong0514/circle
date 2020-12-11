package com.kh.circle.attendance.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.circle.attendance.entity.AttendanceInfo;
import com.kh.circle.attendance.entity.AttendanceInfoSummary;
import com.kh.circle.attendance.entity.WeekStackInfo;
import com.kh.circle.attendance.entity.WorkAndOff;
import com.kh.circle.attendance.repository.AttendanceInfoRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AttendanceInfoServiceImpl implements AttendanceInfoService {
	@Autowired
	private AttendanceInfoRepository attendanceInfoRepository;
	
	@Override
	public Map<String, Object> attendanceList(Map<String, Object> inputMap) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		//주간 근태기록 리스트
		List<AttendanceInfo> weekAttList = attendanceInfoRepository.attendanceList(inputMap);
		
		map.put("weekAttList", weekAttList);
		
		//기준근무시간
		int worktimePerWeek = attendanceInfoRepository.worktimePerWeek((String) inputMap.get("emp_no"));
		map.put("worktimePerWeek", worktimePerWeek);
		
		
		//주간근무정보 추출

		////주간누적근무시간 추출
		String sDate = "";
		String eDate = "";
		
		if(!weekAttList.isEmpty()) {
	
			sDate =(String) ( (List<AttendanceInfo>) map.get("weekAttList") ).get(0).getWeekStartDate();
			eDate =(String) ( (List<AttendanceInfo>) map.get("weekAttList") ).get(0).getWeekEndDate();
			
			int wtime = ( (int) map.get("worktimePerWeek"));
	
			//// 1) 주간 누적 근무시간(시)
			//// 2) 주간 누적 근무시간(분)
			WeekStackInfo wsInfo  = attendanceInfoRepository.weekStackWorkTime(inputMap);
			wsInfo.setWeekStartDate(sDate);
			wsInfo.setWeekEndDate(eDate);
			wsInfo.setWorktimePerWeek(wtime);
			
	
			//// 초과, 잔여근무시간 계산
			//// 1) 누적 근무시간 > 기준 근무시간 (근무
			//// 	or 2) 누적 근무시간 == 기준근무시간 && 누적근무분 > 0
			
			//// 누적 근무시간이 기준 근무시간보다 많은 경우
			if(wsInfo.getWeekSumWorktimeHour() > wsInfo.getWorktimePerWeek() ||
			   (wsInfo.getWeekSumWorktimeHour() == wsInfo.getWorktimePerWeek()
			    && wsInfo.getWeekSumWorktimeMinute() > 0)
			  ) {
				// 초과 근무시간 계산 후 저장
				//// 분단위 잔여시간 있을 시
				if(wsInfo.getWeekSumWorktimeMinute() > 0) {
					wsInfo.setWeekOverWorktimeMinute(60 - wsInfo.getWeekSumWorktimeMinute());
					wsInfo.setWeekOverWorktimeHour(
							wsInfo.getWeekSumWorktimeHour() -1 - wsInfo.getWorktimePerWeek());
				} 
				//// 분단위 잔여시간 없을 시
				else {
					wsInfo.setWeekOverWorktimeMinute(0);
					wsInfo.setWeekOverWorktimeHour(
							wsInfo.getWeekSumWorktimeHour() - wsInfo.getWorktimePerWeek());
				}
				
				// 잔여 근무시간 저장
				wsInfo.setWeekRemainWorktimeHour(0);
				wsInfo.setWeekRemainWorktimeMinute(0);
			}
			
			//// 누적 근무시간이 기준 근무시간보다 적은 경우
			else {
				// 잔여 근무시간 계산 후 저장
				// 분단위 잔여시간 있을 시
				if(wsInfo.getWeekSumWorktimeMinute() > 0) {
					wsInfo.setWeekRemainWorktimeMinute(60 - wsInfo.getWeekSumWorktimeMinute());
					wsInfo.setWeekRemainWorktimeHour(
							wsInfo.getWorktimePerWeek() - 1 - wsInfo.getWeekSumWorktimeHour());
				}
				// 분단위 잔여시간 없을 시
				else {
					wsInfo.setWeekRemainWorktimeHour(
							wsInfo.getWorktimePerWeek() - wsInfo.getWeekSumWorktimeHour());
				}
				// 초과 근무시간 저장
				wsInfo.setWeekOverWorktimeHour(0);
				wsInfo.setWeekOverWorktimeMinute(0);
			}
			map.put("weekStackInfo", wsInfo);
		} else {
			WeekStackInfo wsInfo  = attendanceInfoRepository.weekStackWorkTimeNull(inputMap);
			wsInfo.setWorktimePerWeek((int) map.get("worktimePerWeek"));
			
			map.put("weekStackInfo", wsInfo);
		}
		
		return map;
	}

	@Override
	public void insertStime(Map<String, Object> inputMap) {
		attendanceInfoRepository.insertStime(inputMap);
	}

	@Override
	public void insertEtime(Map<String, Object> inputMap) {
		attendanceInfoRepository.insertEtime(inputMap);
	}

	@Override
	public List<Map<String, Object>> allAttendanceList(Map<String, Object> inputMap) {

		//1.재직중인 전 사원의 사원번호 추출
		List<String> empNoList = attendanceInfoRepository.empNoList();
		
		//2.추출한 사원번호에 맞춰 주간 근무정보 추출하여 리스트로 저장
		List<AttendanceInfoSummary> summaryList = new ArrayList<AttendanceInfoSummary>();
		
		////사원 번호 하나씩 꺼내서 AttendanceInfoSummary 객체 생성 -> 리스트에 저장
		
		for(String emp_no : empNoList) {
			
			//근무시간 리스트 추출
			AttendanceInfoSummary empSummary = attendanceInfoRepository.empSummary(inputMap, emp_no);
			
			
		
		}
		
		
		//3. map에 저장하여 attendanceList()함수에 인자로 전달
		
		
		return null;
	}

}
