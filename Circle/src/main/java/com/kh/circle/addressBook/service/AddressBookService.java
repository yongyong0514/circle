package com.kh.circle.addressBook.service;

import java.util.Map;

import com.kh.circle.addressBook.entity.PagingInfo;

public interface AddressBookService {

	public Map<String, Object> pagingEmp(PagingInfo pInfo);
	
}
