package com.kh.circle.sign.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class signList {
	private String sign_type_name;
	private String sign_title;
	private String emp_info_name;
	private String sign_wdat;
	private String sign_edat;
}
