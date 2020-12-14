package com.kh.circle.addressBook.service;

import java.util.List;
import java.util.Map;

import com.kh.circle.addressBook.entity.PagingInfo;
import com.kh.circle.empInfo.entity.EmpInfoAll;

public interface AddressBookService {

	public Map<String, Object> pagingEmp(PagingInfo pInfo);
	
	public EmpInfoAll detail(String emp_no);
	
	public List<String> deptList();
	
}
