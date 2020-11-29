package com.kh.circle.sign.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SignWriteInsert {
	private String sign_type_code;
	private String sign_keep;
	private String sign_acc;
	private String sign_title;
	private String sign_note;
	private String sign_emp_code;
	private String sign_count;
	private String seqSign;
	private String jCodeList;
	private String wCodeList;
}
