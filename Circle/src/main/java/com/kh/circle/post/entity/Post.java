package com.kh.circle.post.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class Post {
	

/*posttype*/
private String post_type_code;
private String post_type_title;

/*post*/
private String post_code;
private String post_type;
private String post_type_name;
private String post_emp;
private String post_emp_name;
private String post_title;
private String post_comt;
private Date post_wdat;
private Date post_mdat;
private String post_stat;
private String post_sec;
private String post_noti;
private String post_cvp;
private String post_code_ref;

/*postemp*/
private String emp_info_emp_no;
private String emp_info_name;
private String emp_info_dept_code;
private String emp_info_job_code;
private String emp_info_email;
private String emp_info_mtel;
private String emp_info_etel;
	

}
