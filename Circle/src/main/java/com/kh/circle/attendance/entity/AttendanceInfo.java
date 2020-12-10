package com.kh.circle.attendance.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AttendanceInfo {
	private String atdc_hstr_ordr;			// 순서
	private String atdc_hstr_emp_no;		// 사원번호
	private String atdc_hstr_dat;			// 일자
	private String atdc_hstr_writ_type;		// 작성구분 (본인/직권)
	private String atdc_hstr_stim;			// 출근시간
	private String atdc_hstr_etim;			// 퇴근시간
	private String atdc_hstr_type;			// 업무형태 (내근/외근/출장/교육)
	
	//calc Values
	private int workTimeHour;			// 근무시간(시)
	private int workTimeMinute;			// 근무시간(분)
	private String weekStartDate;		// 카운트 시작일(일)
	private String weekEndDate;			// 카운트 종료일(토)
		
}
