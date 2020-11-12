package com.kh.circle.issue.entity;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class IssFile {

	
	
	private String file_code;
	private String file_type;
	private String file_oname;
	private String file_cname;
	private String file_route;
	private long file_size;
	private Date file_date;
	private String file_status;
	private String file_storage_code;
}