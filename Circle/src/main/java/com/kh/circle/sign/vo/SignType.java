package com.kh.circle.sign.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SignType {
	private String sign_type_code;
	private String sign_type_content;
	private String sign_type_name;

}
