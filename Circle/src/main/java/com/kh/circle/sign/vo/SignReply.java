package com.kh.circle.sign.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SignReply {
	private String sign_reply_code;
	private String sign_reply_date;
	private String sign_reply_content;
	private String emp_info_name;
	private String job_info_name;
}
