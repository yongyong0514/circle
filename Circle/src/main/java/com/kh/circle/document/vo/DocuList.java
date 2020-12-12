package com.kh.circle.document.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DocuList {
	private String docu_code;
	private String docu_title;
	private String docu_wdat;
	private String docu_whour;
	

}
