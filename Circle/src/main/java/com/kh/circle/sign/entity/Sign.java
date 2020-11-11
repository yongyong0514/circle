package com.kh.circle.sign.entity;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Sign {
	private String sign_code;
	private String sign_type_code;
	private Date sign_keep;
	private String sign_acc;
	private String sign_title;
	private String sign_note;
	private String sing_status;
	private Date sign_wdat;
	private Date sign_edat;
	private String sign_emp_code;
}
