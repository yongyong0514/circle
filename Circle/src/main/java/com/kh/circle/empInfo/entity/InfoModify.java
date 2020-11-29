package com.kh.circle.empInfo.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class InfoModify {
	private String info_mod_hstr_ordr;
	private String info_mod_hstr_emp_no;
	private String info_mod_hstr_dat;
	private String info_mod_hstr_col;		//변경대상 컬럼명
	private String info_mod_hstr_befr;
	private String info_mod_hstr_aftr;
	private String info_mod_hstr_mdfr;
	private String info_mod_hstr_resn;
	
	//join
	private String emp_info_mdfr_name;			//수정자 이름

}
