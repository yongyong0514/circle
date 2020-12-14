package com.kh.circle.addressBook.repository;

import java.util.List;

import com.kh.circle.addressBook.entity.AddressInfo;
import com.kh.circle.addressBook.entity.PagingInfo;
import com.kh.circle.empInfo.entity.EmpInfoAll;

public interface AddressBookRepository {
	public int total(PagingInfo pInfo);
	
	public List<AddressInfo> pagingEmp(PagingInfo pInfo);
	
	public EmpInfoAll detail(String emp_no);
	
	public List<String> deptList();
}
