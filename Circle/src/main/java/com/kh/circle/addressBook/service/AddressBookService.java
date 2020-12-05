package com.kh.circle.addressBook.service;

import java.util.List;

import com.kh.circle.addressBook.entity.AddressInfo;
import com.kh.circle.addressBook.entity.PagingInfo;

public interface AddressBookService {

	public List<AddressInfo> pagingEmp(PagingInfo pInfo);
	
}
