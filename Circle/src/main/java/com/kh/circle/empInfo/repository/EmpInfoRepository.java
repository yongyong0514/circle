package com.kh.circle.empInfo.repository;

import java.util.List;

import com.kh.circle.addressBook.entity.PagingInfo;
import com.kh.circle.empInfo.entity.EmpInfoAll;

public interface EmpInfoRepository {

	public EmpInfoAll empInfoOne(String emp_no);
	
	public int total(PagingInfo pInfo);
	
	public List<EmpInfoAll> empInfoList(PagingInfo pInfo);
}
