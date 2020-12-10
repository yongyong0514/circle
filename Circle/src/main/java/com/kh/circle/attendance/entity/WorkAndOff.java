package com.kh.circle.attendance.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class WorkAndOff {
	private String emp_no;
	private String sTime;		//출근시간
	private String eTime;		//퇴근시간
	private String workHour;	//근무(시간)
	private String workMinute;	//근무(분)
}
