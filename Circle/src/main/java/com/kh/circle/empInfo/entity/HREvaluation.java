package com.kh.circle.empInfo.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class HREvaluation {
	private String hrev_info_ordr;
	private String hrev_info_emp_no;			//평가대상 사원번호
	private String hrev_info_dat;
	private String hrev_info_achv;
	private String hrev_info_eval;
	private String hrev_info_dept_code;
	private String hrev_info_eval_emp_no;		//평가자 사원번호
	private String hrev_info_rm;
	
	//join
	private String dept_info_name;				//부서명
	private String emp_info_name;				//평가자 이름
}
