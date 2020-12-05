package com.kh.circle.addressBook.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.circle.addressBook.entity.AddressInfo;
import com.kh.circle.addressBook.repository.AddressBookRepository;

@Service
public class AddressBookServiceImpl implements AddressBookService{
	@Autowired
	private AddressBookRepository addressBookRepository;
	
	@Override
	public List<AddressInfo> pagingEmp(Map<String, Object> inputMap) {
		
		List<AddressInfo> aList = addressBookRepository.pagingEmp(inputMap);
		
		return aList;
	}

}
