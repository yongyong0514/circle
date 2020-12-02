package com.kh.circle.sign.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SignModify {
	private String sign_code;
	private String sign_emp_code;
	private String sign_type_name;
	private String sign_title;
	private String emp_info_name;
	private String job_info_name;
	private String sign_wdat;
	private String sign_whour;
	private String sign_edat;
	private String sign_ehour;
	private String sign_step;
	private String sign_count;
	private String sign_note;
	private String sign_keep;
	private String jCodeList;
	private String wCodeList;
}
