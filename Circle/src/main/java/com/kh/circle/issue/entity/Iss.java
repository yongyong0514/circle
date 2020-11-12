package com.kh.circle.issue.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class Iss {

	
	private String iss_code;
	private String iss_emp_no;
	private String iss_title;
	private String iss_pro_code;
	private String iss_prog_code;
	private String iss_situ_code;
	private String iss_cont;
	private Date iss_wdat;
	private Date iss_sdat;
	private Date iss_edat;
	private String iss_ref_no;
	private String iss_stat;
}
