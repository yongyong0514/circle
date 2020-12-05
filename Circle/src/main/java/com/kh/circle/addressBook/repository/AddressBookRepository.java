package com.kh.circle.addressBook.repository;

import java.util.List;

import com.kh.circle.addressBook.entity.AddressInfo;
import com.kh.circle.addressBook.entity.PagingInfo;

public interface AddressBookRepository {
	public int total();
	
	public List<AddressInfo> pagingEmp(PagingInfo pInfo);
}
