package com.kh.circle.sign.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SignReplyInsert {
	private String sign_code;
	private String sign_reply_sign_code;
	private String sign_reply_content;
	private String sign_reply_emp_code;
}
