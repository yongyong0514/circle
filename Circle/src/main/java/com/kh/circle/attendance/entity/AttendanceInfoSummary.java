package com.kh.circle.attendance.entity;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AttendanceInfoSummary {
	private String emp_no;
	private String emp_name;
	
	private int worktimePerWeek;				//기준근무시간
	private String worktime_week_hour;			//주간 근무(시간)
	private String worktime_week_minute;		//주간 근무(분)
	private String over_worktime_week_hour;		//주간 초과근무(시간)
	private String over_worktime_week_minute;	//주간 초과 근무(분)
	
	private String startDate;					//시작일
	private String endDate;						//종료일
	
	private List<WorkAndOff> workAndOffList;	//근무시간 리스트
	
}
