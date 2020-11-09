package com.kh.circle.post.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PostType {

	private String post_type_code;
	private String post_type_title;
	private String post_type_auth_lev;
	
	
}
