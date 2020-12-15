package com.kh.circle.empInfo.entity;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CertificateInfo {
	private String crtf_info_ordr;
	private String crtf_info_emp_no;
	private String crtf_info_type;
	private String crtf_info_crtf_name;
	private String crtf_info_crtf_no;
	private String crtf_info_crtf_levl;
	private String crtf_info_inst;
	private String crtf_info_sdat;
	private String crtf_info_edat;
	private String crtf_info_rm;
	
	private List<CertificateInfo> crtfList;
	
}
