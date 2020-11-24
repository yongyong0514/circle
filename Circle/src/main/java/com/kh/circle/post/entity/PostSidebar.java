package com.kh.circle.post.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PostSidebar {

	private String dept_info_code;
	private String dept_info_name;
	private String dept_info_levl;
	private String dept_info_uper;
	
	
}
