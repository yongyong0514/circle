package com.kh.circle.vacation.entity;

public class VacationAdd {
	private String empNo;
	private String empName;
	private String rdat;					// 등록일
	private String VacationType;			// 연차/반차/경조사/출산-육아/보건/예비군-민방위/병가/기타
	private String isHalf;					// 반차여부
	private String startDate;				// 시작일
	private String endDate;					// 종료일
	private int clacdate;					// 일수
	private String content;					// 내용
	private String confirm;					// 승인여부(y/n)
	private String sign_code;				// 결재코드 - 연결
}
