package com.kh.circle.sign.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SignEmpList {
	private String emp_info_emp_no;
	private String emp_info_name;
	private String job_info_code;
	private String job_info_name;
	private String dept_info_name;
	private String files_route;
}
