package com.kh.circle.addressBook.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PagingInfo {
	private int nowPage;
	private int perPage;		// 게시물 출력단위
	private int startPage;		// 페이지 묶음의 첫 페이지
	private int endPage;		// 페이지 묶음의 마지막 페이지
	private int minPage;		// 전체 첫 페이지
	private int maxPage;		// 전체 마지막 페이지
	private int total;			// 전체 게시물 수
}
