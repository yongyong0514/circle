package com.kh.circle.login.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class EmpInfo {
	private String emp_info_emp_no;
	private String emp_info_name;
	private String emp_info_phto;
	private String emp_info_dept_code;
	private String emp_info_job_code;
	private String emp_info_email;
	private String emp_info_mtel;
	private String emp_info_etel;
	private String emp_info_cmp_code;
	private String emp_info_rm;
	private String emp_info_pwd;
	private String emp_info_id_no;
	private String emp_info_gend;
	private String emp_info_adr;
	private String emp_info_emrg_tel;
	private String emp_info_mrrg;
	private String emp_info_acnt_no;
	private String emp_info_bank_name;
	private String emp_info_acnt_name;
	private String emp_info_impd_type;
	private String emp_info_impd_levl;
	private String emp_info_vetr_no;
	private String emp_info_vetr_rel;
	private String emp_info_mils;
	private Date emp_info_edat;
	private Date emp_info_sdat;
}
