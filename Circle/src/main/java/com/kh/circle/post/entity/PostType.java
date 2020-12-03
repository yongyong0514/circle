package com.kh.circle.post.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PostType {
	/*posttype*/
	private String post_type_code;
	private String post_type_title;
}
