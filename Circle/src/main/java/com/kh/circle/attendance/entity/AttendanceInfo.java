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
	
	private String workTime;				// String형 근무시간
	private long longWorkTime;;				// long형 근무시간(퇴근시간 - 출근시간)
}
