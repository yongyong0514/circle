package com.kh.circle.project.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder

public class ProjFile {

	private String files_code;
	private String files_oname;
	private String files_cname;
	private String files_route;
	private Date files_date;
	private String files_type;
	private String files_status;
	private long files_size;
}
