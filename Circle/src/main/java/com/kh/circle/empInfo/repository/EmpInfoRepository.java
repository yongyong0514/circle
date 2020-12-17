package com.kh.circle.empInfo.repository;

import java.util.List;
import java.util.Map;

import com.kh.circle.addressBook.entity.PagingInfo;
import com.kh.circle.empInfo.entity.EmpInfoAll;

public interface EmpInfoRepository {

	public EmpInfoAll empInfoOne(String emp_no);
	
	public int total(PagingInfo pInfo);
	
	public List<EmpInfoAll> empInfoList(PagingInfo pInfo);
	
	public String checkPwd(Map<String, Object> map);
	
	public List<String> compare(EmpInfoAll empInfoAll);
	
	public String searchWithCol(Map<String, Object> beforeMap);

	public Map<String, Object> setAfterCol(EmpInfoAll changeInfo);
	
	public void addChangeCol(Map<String, Object> compareMap);
	
	public void updateChangeInfo(EmpInfoAll changeInfo);
	
	public List<String> deptCodeList();
	
	public List<String> deptNameList();

	public List<String> jobCodeList();
	
	public List<String> jobNameList();
	
	public void insert(EmpInfoAll eInfo);
	
}
