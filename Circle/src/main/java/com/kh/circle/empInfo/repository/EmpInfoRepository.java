package com.kh.circle.empInfo.repository;

import java.util.List;
import java.util.Map;

import com.kh.circle.empInfo.entity.EmpInfoAll;

public interface EmpInfoRepository {

	public EmpInfoAll empInfoOne(String emp_no);
	
	public List<EmpInfoAll> empInfoList(Map<String, Object> inputMap);
}
