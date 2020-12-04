package com.kh.circle.vacation.entity;

public class VacationAdd {
	private String empNo;
	private String empName;
	private String regitDate;				// 등록일
	private String vacationType;			// 구분: 연차/반차/경조사/출산-육아/보건/예비군-민방위/병가/기타
	private String isHalf;					// 반차정보
	private String startDate;				// 시작일
	private String endDate;					// 종료일
	private double clacdate;				// 일수
	private String permission;				// 전자결재 상태
	private String used;					// 사용여부 (종료일 > 오늘)
	private String content;					// 내용
	private String confirm;					// 승인여부(y/n)

	private String sign_code;				// 결재코드 - 연결
}
