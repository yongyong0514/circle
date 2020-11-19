package com.kh.circle.login.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder

public class JoinMember {
	private String JOB_INFO_CODE;
	private String JOB_INFO_NAME;
}
