package com.kh.circle.comu.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
//동호회 정보
public class ComuInfo {
	private String comu_info_emp_no;
	private String comu_info_comu_code;
	private Date comu_info_sdat;
	private Date comu_info_edat;
	private String comu_info_comu_job_code;
	private String comu_info_rm;
	private String comu_info_join;
	private Date comu_info_join_rqst_dat;
}
