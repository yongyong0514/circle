package com.kh.circle.organChart.entity;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrganDept {
	private String dept_info_code;
	private String dept_info_name;
	private String dept_info_uper;
	private List<OrganEmp> empList;

	//calc Values
	private int lvl;						// 레벨
}
