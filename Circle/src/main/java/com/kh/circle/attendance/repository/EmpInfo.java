package com.kh.circle.attendance.repository;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EmpInfo {
	private String empNo;
	private String name;
	private String phto;		// photo를 불러올 code
	private String deptCode;
	private String jobCode;
	private String email;
	private String mTel;		// 휴대전화번호
	private String eTel;		// 내선번호
	private String compCode;	// 회사코드
	private String rm;			// Remark 비고
	private String pwd;			// 계정 비밀번호
	private String idNo;		// 주민등록번호
	private String gend;		// 성별
	private String ard;			// 주소
	private String emrgTel;		// 비상연락처
	private String mrrg;		// 결혼여부
	private String acntNo;		// 계좌번호
	private String bankName;
	private String acntName;	// 예금주명
	private String impdType;	// 장애종류
	private String impdLevl;	// 장애급수
	private String vetrNo;		// 보훈번호
	private String vetrRel;		// 보훈자와의 관계
	private String mils;		// 병역이행여부
	private Date eDat;			// 입사일
	private Date sDat;			// 퇴사일
}
