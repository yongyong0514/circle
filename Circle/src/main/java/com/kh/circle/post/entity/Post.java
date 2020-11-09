package com.kh.circle.post.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class Post {
	
	private String post_code;
	private String post_type;
	private String post_emp;
	private String post_title;
	private String post_comt;
	private Date post_wdat;
	private Date post_mdat;
	private String post_stat;
	private String post_sec;
	private String post_noti;
	private String post_cvp;
	private String post_code_ref;
	

}
