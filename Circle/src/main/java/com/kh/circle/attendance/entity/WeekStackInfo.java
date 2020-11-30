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
public class WeekStackInfo {
	private String weekStartDate;			// 카운트 시작일(일)
	private String weekEndDate;				// 카운트 종료일(토)
	private int worktimePerWeek;			// 기준근무시간
	
	//calc Values
	private int weekSumWorktimeHour;		// 주간 누적 근무시간 (시/일~토)
	private int weekSumWorktimeMinute;		// 주간 누적 근무시간 (분/일~토)
	private int weekOverWorktimeHour;		// 주간 초과근무시간(시/1주 근무시간 기준)
	private int weekOverWorktimeMinute;		// 주간 초과근무시간(분/1주 근무시간 기준)
	private int weekRemainWorktimeHour;		// 주간 잔여 근무시간(시)
	private int weekRemainWorktimeMinute;	// 주간 잔여 근무시간(분)
}