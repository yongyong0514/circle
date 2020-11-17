package com.kh.circle.login.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class Member {
	private String EMP_INFO_EMP_NO;
	private String EMP_INFO_NAME;
	private String EMP_INFO_PHTO;
	private String EMP_INFO_DEPT_CODE;
	private String EMP_INFO_JOB_CODE;
	private String EMP_INFO_EMAIL;
	private String EMP_INFO_MTEL;
	private String EMP_INFO_ETEL;
	private String EMP_INFO_COMP_CODE;
	private String EMP_INFO_RM;
	private String EMP_INFO_PWD;
	private String EMP_INFO_ID_NO;
	private String EMP_INFO_GEND;
	private String EMP_INFO_ADR;
	private String EMP_INFO_EMRG_TEL;
	private String EMP_INFO_MRRG;
	private String EMP_INFO_ACNT_NO;
	private String EMP_INFO_BANK_NAME;
	private String EMP_INFO_ACNT_NAME;
	private String EMP_INFO_IMPD_TYPE;
	private String EMP_INFO_IMPD_LEVL;
	private String EMP_INFO_VETR_NO;
	private String EMP_INFO_VETR_REL;
	private String EMP_INFO_MILS;
	private Date EMP_INFO_EDAT;
	private Date EMP_INFO_SDAT;
	
}
