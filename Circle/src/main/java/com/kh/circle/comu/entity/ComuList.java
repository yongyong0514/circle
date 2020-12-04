package com.kh.circle.comu.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ComuList {
	private String comu_list_code;
	private String comu_list_name;
	
	//동호회 사원 정보
	private String comu_info_emp_no;
	private String comu_info_comu_code;
	private Date comu_info_sdat;
	private Date comu_info_edat;
	private String comu_info_comu_job_code;
	private String comu_info_rm;
	private String comu_info_join;
	private Date comu_info_join_rqst_dat;
	
	//사원정보 가져오기
	private String emp_info_name;
	private String job_info_name;
}
