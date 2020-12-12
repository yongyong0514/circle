package com.kh.circle.empInfo.service;

import java.util.List;
import java.util.Map;

import com.kh.circle.empInfo.entity.EmpInfoAll;

public interface EmpInfoService {
	
	public Map<String, Object> empInfoOne(String emp_no);

	public List<EmpInfoAll> empInfoList(Map<String, Object> inputMap);

}
