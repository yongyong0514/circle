package com.kh.circle.login.entity;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder

public class JoinMember {
	private String job_info_code;
	private String job_info_name;
}
