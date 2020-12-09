package com.kh.circle.project.entity;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class Project {
	private String pro_code;
	private String iss_code;
	private String prog_code;
	private String situ_code;
	
	//project table
	private String pro_manager;
	private String pro_title;
	private String pro_intro;
	private Date pro_sdate;
	private Date pro_edate;
	private String pro_key;
	private String pro_stat;
	
	// iss table
	private String iss_emp_no;
	private String iss_title;
	private String iss_pro_code;
	private String iss_prog_code;
	private String iss_situ_code;
	private String iss_situ_name;
	private String iss_cont;
	private Date iss_wdat;
	private Date iss_sdate;
	private Date iss_edate;
	private String iss_ref_no;
	private String iss_stat;

	
	//prog table
	private String prog_title;

	
	//situ table
	private String situ_title;

	
	//mem table
	private String mem_iss_code;
	private String mem_emp_no;
	private String mem_code;
	private String mem_type;

	
	
	//emp table
	private String emp_info_emp_no;
	private String emp_info_name;
	private String emp_info_dept_code;
	private String emp_info_job_code;
	private String emp_info_email;
	private String emp_info_mtel;
	private String emp_info_etel;
	
	
	//deptinfo
	private String dept_info_code;
	private String dept_info_name;
}
