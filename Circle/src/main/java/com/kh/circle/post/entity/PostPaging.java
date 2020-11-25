package com.kh.circle.post.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PostPaging {


	int recordsPerPage; // 페이지당 레코드 수
	int firstPageNo; // 첫페이지 번호
	int prevPageNo; //이전 페이지번호
	int startPageNo; //시작페이지 페이징너비기준
	int currentPageNo; //페이지번호
	int endPageNo; //끝 페이지 번호
	int nextPageNo; // 다음 페이지번호
	int finalPageNo; //마지막 페이지 번호
	int numberOfRecords; //전체 레코드 수
	int sizeOfPage; //보여지는 페이지수
	
	public PostPaging(int currentPageNo, int recordsPerPage) {
		
		this.currentPageNo = currentPageNo;
		//기본 페이지 : 5개로 default설정
		
		this.sizeOfPage = 5;
		
		this.recordsPerPage = (recordsPerPage != 0)? recordsPerPage : 5;
		
	}
	
	//paging 생성
	public void makePaging() {
		if(numberOfRecords == 0)
			return; // 게시글 전체 수 없을 경우
		
		if(currentPageNo == 0)
			setCurrentPageNo(1); // 기본값 설정
		
		if(recordsPerPage == 0)
			setRecordsPerPage(10); // 기본값 설정
		
		//마지막 페이지
		int finalPage = (numberOfRecords + (recordsPerPage - 1)) / recordsPerPage;
		
		if(currentPageNo > finalPage)
			setCurrentPageNo(finalPage);//기본값 설정
		
		if(currentPageNo < 0 || currentPageNo > finalPage)
			currentPageNo = 1;
		//현재 페이지 유효성 체크
		//시작 페이지 (전체)
		
		boolean isNowFirst = currentPageNo == 1 ?  true : false;
		boolean isNowFinal = currentPageNo == finalPage ? true : false;
		
		int startPage = ((currentPageNo - 1) / sizeOfPage) * sizeOfPage + 1;
		int endPage = startPage + sizeOfPage - 1;
		
		if(endPage > finalPage)
			endPage = finalPage;
		
		setFirstPageNo(1);
		
		if(isNowFirst)
			setPrevPageNo(1);
		else
			setPrevPageNo(((currentPageNo - 1) < 1? 1 : (currentPageNo - 1)));
		
		setStartPageNo(startPage);
		setEndPageNo(endPage);
		
		if(isNowFinal)
			setNextPageNo(finalPage);
		else 
			setNextPageNo(((currentPageNo + 1) > finalPage ? finalPage : (currentPageNo + 1)));
		
		setFinalPageNo(finalPage);
		
	}
	
	

}
