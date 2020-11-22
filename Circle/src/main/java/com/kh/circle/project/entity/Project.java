package com.kh.circle.project.entity;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class Project {

	
	private String iss_code;
	private String iss_emp_no;
	private String iss_title;
	private String iss_pro_code;
	private String iss_prog_code;
	private String iss_situ_code;
	private String iss_situ_name;
	private String iss_cont;
	private Date iss_wdat;
	private Date iss_sdat;
	private Date iss_edat;
	private String iss_ref_no;
	private String iss_stat;

	private String prog_code;
	private String prog_title;

	private String situ_code;
	private String situ_title;

	private String mem_iss_code;
	private String mem_emp_no;
	
	
	private String pro_code;
	private String pro_manager;
	private String pro_title;
	private String pro_intro;
	private Date pro_sdate;
	private Date pro_edate;
	private String pro_key;
	private String pro_stat;
	
	private String emp_info_emp_no;
	private String emp_info_name;
	private String emp_info_dept_code;
	private String emp_info_job_code;
	private String emp_info_email;
	private String emp_info_mtel;
	private String emp_info_etel;
	
}
