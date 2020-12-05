package com.kh.circle.addressBook.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AddressInfo {
	private String name;
	private String photo;		// 사진파일 코드
	private String deptName;	// 부서명
	private String jobName;		// 직위/직책명
	private String email;
	private String tel;			// 연락처(휴대전화)
	private String cmpName;		// 회사명
	private String remark;		// 비고
}
