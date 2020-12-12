package com.kh.circle.document.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DocuWriteInsert {
	private String docu_keep;
	private String docu_acc;
	private String docu_title;
	private String docu_note;
	private String docu_emp_code;
	private String seqDocu;
	
}
