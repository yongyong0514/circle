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
public class RewardDiscipline {
	private String rwdp_hstr_ordr;
	private String rwdp_hstr_emp_no;
	private String rwdp_hstr_type;
	private String rwdp_hstr_dat;
	private String rwdp_hstr_cont;	// 내용
	private String rwdp_hstr_resn;	// 사유
	private String rwdp_hstr_rm;
	
	private List<RewardDiscipline> rediList;
}
