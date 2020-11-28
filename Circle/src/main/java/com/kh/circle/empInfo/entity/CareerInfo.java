package com.kh.circle.empInfo.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CareerInfo {
	private String carr_hstr_ordr;
	private String carr_hstr_emp_no;
	private String carr_hstr_sdat;
	private String carr_hstr_edat;
	private String carr_hstr_dept_code;
	private String carr_hstr_job_code;
	private String carr_hstr_job_type;
	private String carr_hstr_rm;
	
	//calc value
	private int year_term;
	private int month_term;
	
	//join result
	private String dept_info_name;		//부서명
	private String job_info_name;		//직책명
}
