package com.kh.circle.post.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostSearch extends PostPaging {

	
	private String searchType;
	private String keyword;
	
}
