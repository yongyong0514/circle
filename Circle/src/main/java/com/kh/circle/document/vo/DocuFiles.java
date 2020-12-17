package com.kh.circle.document.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class DocuFiles {
	private String files_code;
	private String files_oname;
	private String files_cname;
	private String files_route;
	private String files_date;
	private String files_type;
	private String files_status;
	private String files_size;
}
