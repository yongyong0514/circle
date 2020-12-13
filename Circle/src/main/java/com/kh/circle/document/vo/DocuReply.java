package com.kh.circle.document.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DocuReply {
	private String docu_repl_docu_code;
	private String docu_repl_content;
	private String docu_repl_date;
	private String docu_repl_emp_code;
	private String emp_info_name;
	private String job_info_name;
	private String docu_repl_code;
}
