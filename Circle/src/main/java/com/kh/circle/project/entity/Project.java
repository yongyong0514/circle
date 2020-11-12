package com.kh.circle.project.entity;

import java.sql.Date;

import com.kh.circle.issue.entity.Iss;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class Project {

	
	private String pro_code;
	private String pro_manager;
	private String pro_title;
	private String pro_intro;
	private Date pro_sdate;
	private Date pro_edate;
	private String pro_key;
	private String pro_stat;
	
}
