package com.kh.circle.post.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostSearch  {

	
	private int pageNum; // 페이지 번호
	private int amount; //한 페이지당 데이터 개수
	private int cntPerPage;
	private int nowPage = 1;
    //추가
    private String type;
    private String keyword;
	
	
	public String[] getTypeArr() {
		return type == null? new String[] {}: type.split("");
	}
}
