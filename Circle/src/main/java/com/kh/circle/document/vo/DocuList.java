package com.kh.circle.document.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DocuList {
	private String docu_code;
	private String docu_title;
	private String docu_wdat;
	private String docu_whour;
	private String docu_emp_code;
	private String emp_info_name;
	private String job_info_name;
	private String docu_type;
	private String docu_check;
}
