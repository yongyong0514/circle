package com.kh.circle.login.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class Member {
	private String ISS_CODE;
	private String EMP_PER_INFO_EMP_NO;
}
