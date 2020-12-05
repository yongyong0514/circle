package com.kh.circle.addressBook.repository;

import java.util.List;
import java.util.Map;

import com.kh.circle.addressBook.entity.AddressInfo;

public interface AddressBookRepository {
	public List<AddressInfo> pagingEmp(Map<String, Object> inputMap);
}
