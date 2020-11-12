package com.kh.circle.issue.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class JoinMem {

	private String mem_iss_code;
	private String mem_emp_no;
	
}
