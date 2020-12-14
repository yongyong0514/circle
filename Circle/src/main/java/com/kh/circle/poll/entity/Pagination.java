package com.kh.circle.poll.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Pagination {

	// 현재페이지, 시작페이지, 끝페이지, 게시글 총 갯수, 페이지당 글 갯수, 마지막페이지, SQL쿼리에 쓸 start, end
	private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end;
	private int cntPage = 5;
	private String empNo;
	private String searchTitle;
	private String searchWriter;
	private String sec;
	
	//페이지용 객체
	public Pagination(int total, int nowPage, int cntPerPage, String empNo, String searchTitle, String searchWriter) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
		this.empNo = empNo;
		this.searchTitle = searchTitle;
		this.searchWriter = searchWriter;
	}
	//내 설문 페이지용 객체
	public Pagination(int total, int nowPage, int cntPerPage, String empNo, String searchTitle) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
		this.empNo = empNo;
		this.searchTitle = searchTitle;
	}
	
	//총 페이지수 도출용 객체
	public Pagination(String empNo, String searchTitle, String searchWriter) {
		this.empNo = empNo;
		this.searchTitle = searchTitle;
		this.searchWriter = searchWriter;
	}
	//내 설문 총 페이지수 도출용 객체
	public Pagination(String empNo, String searchTitle) {
		this.empNo = empNo;
		this.searchTitle = searchTitle;
	}
	
	// 제일 마지막 페이지 계산
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}
	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}
	// DB 쿼리에서 사용할 start, end값 계산
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}
}
