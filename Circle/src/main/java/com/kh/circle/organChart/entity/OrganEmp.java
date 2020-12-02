package com.kh.circle.organChart.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrganEmp {
	private String emp_info_emp_no;
	private String emp_info_name;
	private String emp_info_email;
	private String emp_info_phto;

	//join
	private String dept_info_name;
	private String job_info_name;
}
