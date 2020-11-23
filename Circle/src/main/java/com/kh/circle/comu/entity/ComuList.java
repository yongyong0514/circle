package com.kh.circle.comu.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ComuList {
	private String comu_list_code;
	private String comu_list_name;
}
