package com.kh.circle.empInfo.service;

import java.util.List;
import java.util.Map;

import com.kh.circle.addressBook.entity.PagingInfo;
import com.kh.circle.empInfo.entity.EmpInfoAll;

public interface EmpInfoService {
	
	public Map<String, Object> empInfoOne(String emp_no);

	public Map<String, Object> empInfoList(PagingInfo pInfo);

	public String checkPwd(Map<String, Object> map);
	
	public List<String> updatedColName(EmpInfoAll empInfoAll);
	
	public List<String> compare(Map<String, Object> inputMap);
}
