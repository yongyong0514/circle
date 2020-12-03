package com.kh.circle.vacation.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Vacation {
	private String anva_hstr_emp_no;
	private String anva_hstr_type;			// 연차/경조사/출산/보건/예비군/민방위/병가/기타
	private String anva_hstr_rdat;			// 등록일
	private String anva_hstr_sdat;			// 시작일
	private String anva_hstr_edat;			// 종료일
	private String anva_hstr_cont;			// 내용
	private String anva_hstr_conf;			// 승인여부(y/n)
	private String anva_hstr_sign_code;		// 결재코드 - 연결
	
	//calc Values
	private double days;						// n일
	private int nights;						// n박
}
