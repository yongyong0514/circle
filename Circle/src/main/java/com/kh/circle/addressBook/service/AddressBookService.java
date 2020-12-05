package com.kh.circle.addressBook.service;

import java.util.List;
import java.util.Map;

import com.kh.circle.addressBook.entity.AddressInfo;

public interface AddressBookService {

	public List<AddressInfo> pagingEmp(Map<String, Object> inputMap);
	
}
