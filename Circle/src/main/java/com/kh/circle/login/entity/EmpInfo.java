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
	
	
	//직급가져오기
	private String job_info_code;
	private String job_info_name;
	
	//동호회 게시글 가져오기
	private String comu_post_ordr;
	private String comu_post_wrtr_emp_no;
	private String comu_post_title;
	private String comu_post_cont;
	private Date comu_post_dat;
	private int comu_post_view;
	private String comu_post_comu_code;
	private String comu_post_type;
	
	//동호회 정보 가져오기
	private String comu_list_code;
	private String comu_list_name;
	
	private String comu_info_emp_no;
}
