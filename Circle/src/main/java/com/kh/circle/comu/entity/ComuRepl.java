package com.kh.circle.comu.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
//동호회 게시글 댓글
public class ComuRepl {
	private String comu_repl_ordr;
	private String comu_repl_post_ordr;
	private String comu_repl_content;
	private Date comu_repl_date;
	private String comu_repl_emp_no;
}
