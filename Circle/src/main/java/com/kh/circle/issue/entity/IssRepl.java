package com.kh.circle.issue.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class IssRepl {

	private String iss_repl_code;
	private String iss_repl_emp;
	private String iss_repl_iss;
	private String iss_repl_cont;
	private Date iss_repl_sdat;
	private String iss_repl_type;
	
}
