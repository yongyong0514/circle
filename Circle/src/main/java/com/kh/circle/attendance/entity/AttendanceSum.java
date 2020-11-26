package com.kh.circle.attendance.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AttendanceSum {
	private Date weekSumWorktime;		// 주간 누적 (일-토)
	private Date weekOverWorktime;		// 주간 초과근무시간(1주 근무시간 기준)
	private Date weekRemainWorktime;	// 주간 잔여 근무시간
	private Date monthSumWorktime;		// 월간 누적(1~마지막
	private Date monthOverWorktime;		// 월간 초과근무시간(1달 근무시간 기준)
	
	private int cmp_info_worktime;		// 기준근무시간(시간 단위 정수형)
}
