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
public class EmpInfo {
	private String emp_no;
	private String name;
	private String phto;		// photo를 불러올 code
	private String dept_code;
	private String job_code;
	private String email;
	private String mtel;		// 휴대전화번호
	private String etel;		// 내선번호
	private String comp_code;	// 회사코드
	private String rm;			// Remark 비고
	private String pwd;			// 계정 비밀번호
	private String id_no;		// 주민등록번호
	private String gend;		// 성별
	private String ard;			// 주소
	private String emrg_tel;		// 비상연락처
	private String mrrg;		// 결혼여부
	private String acnt_no;		// 계좌번호
	private String bank_name;
	private String acnt_name;	// 예금주명
	private String impd_type;	// 장애종류
	private String impd_levl;	// 장애급수
	private String vetr_no;		// 보훈번호
	private String vetr_rel;		// 보훈자와의 관계
	private String mils;		// 병역이행여부
	private Date edat;			// 입사일
	private Date sdat;			// 퇴사일
}
