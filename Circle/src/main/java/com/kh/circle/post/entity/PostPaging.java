package com.kh.circle.post.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PostPaging {

	// 현재페이지, 시작페이지, 끝페이지, 게시글 총 갯수, 페이지당 글 갯수, 마지막페이지, SQL쿼리에 쓸 start, end
	private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end;
	private int cntPage = 5; // 하단 리스트 페이지 개수

	// 코드 받아올 것
	/*posttype*/
	private String post_type_code;
	private String post_type_title;

	/*post*/
	private String post_code;
	private String post_type;
	private String post_type_name;
	private String post_emp;
	private String post_emp_name;
	private String post_title;
	private String post_comt;
	private Date post_wdat;
	private Date post_mdat;
	private String post_stat;
	private String post_sec;
	private String post_noti;
	private String post_cvp;
	private String post_code_ref;

	/* post rep*/
	private String post_repl_code;
	private String post_repl_post;
	private String post_repl_emp;
	private String post_repl_cont;
	private Date post_repl_wdat;
	private String post_repl_crp;
	private String post_repl_mdat;
	private String post_repl_ref;
	

	/*postemp*/
	private String emp_info_emp_no;
	private String emp_info_name;
	private String emp_info_dept_code;
	private String emp_info_dept_name;
	private String emp_info_job_code;
	private String emp_info_job_name;
	private String emp_info_email;
	private String emp_info_mtel;
	private String emp_info_etel;
	
	//검색
	private String type;
	private String keyword;

	public PostPaging(int total, int nowPage, int cntPerPage, String post_type) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		setPost_type(post_type);
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
