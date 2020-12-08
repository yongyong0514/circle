package com.kh.circle.project.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ProjPaging {
	// 현재페이지, 시작페이지, 끝페이지, 게시글 총 갯수, 페이지당 글 갯수, 마지막페이지, SQL쿼리에 쓸 start, end
		private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end;
		private int cntPage = 5; // 하단 리스트 페이지 개수

	
	// iss table
	private String iss_code;
	private String iss_emp_no;
	private String iss_title;
	private String iss_pro_code;
	private String iss_prog_code;
	private String iss_situ_code;
	private String iss_situ_name;
	private String iss_cont;
	private Date iss_wdat;
	private Date iss_sdat;
	private Date iss_edat;
	private String iss_ref_no;
	private String iss_stat;

	
	//prog table
	private String prog_code;
	private String prog_title;

	
	//situ table
	private String situ_code;
	private String situ_title;

	
	//mem table
	private String mem_iss_code;
	private String mem_emp_no;
	private String mem_code;
	private String mem_type;
	
	//project table
	private String pro_code;
	private String pro_manager;
	private String pro_title;
	private String pro_intro;
	private Date pro_sdate;
	private Date pro_edate;
	private String pro_key;
	private String pro_stat;
	
	
	//emp table
	private String emp_info_emp_no;
	private String emp_info_name;
	private String emp_info_dept_code;
	private String emp_info_job_code;
	private String emp_info_email;
	private String emp_info_mtel;
	private String emp_info_etel;
	
	
	//deptinfo
	private String dept_info_code;
	private String dept_info_name;

	
	
	//검색
		private String type;
		private String keyword;

		public ProjPaging(int total, int nowPage, int cntPerPage) {
			setNowPage(nowPage);
			setCntPerPage(cntPerPage);
			setTotal(total);
			calcLastPage(getTotal(), getCntPerPage());
			calcStartEndPage(getNowPage(), cntPage);
			calcStartEnd(getNowPage(), getCntPerPage());
		}

		// 제일 마지막 페이지 계산
		public void calcLastPage(int total, int cntPerPage) {
			setLastPage((int) Math.ceil((double) total / (double) cntPerPage));
		}

		// 시작, 끝 페이지 계산
		public void calcStartEndPage(int nowPage, int cntPage) {
			setEndPage(((int) Math.ceil((double) nowPage / (double) cntPage)) * cntPage);
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

		public String[] getTypeArr() {
			return type == null? new String[] {}: type.split("");
		}
}
