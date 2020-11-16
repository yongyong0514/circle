package com.kh.circle.login.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class Member {
	private String EMP_INFO_EMP_NO;
	private String EMP_INFO_PWD;
	private String EMP_INFO_NAME;
}
