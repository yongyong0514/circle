package com.kh.circle.empInfo.service;

import java.util.Map;

import com.kh.circle.addressBook.entity.PagingInfo;

public interface EmpInfoService {
	
	public Map<String, Object> empInfoOne(String emp_no);

	public Map<String, Object> empInfoList(PagingInfo pInfo);

	public String checkPwd(Map<String, Object> map);
}
