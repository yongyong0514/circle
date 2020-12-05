package com.kh.circle.addressBook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.circle.addressBook.entity.AddressInfo;
import com.kh.circle.addressBook.entity.PagingInfo;
import com.kh.circle.addressBook.repository.AddressBookRepository;

@Service
public class AddressBookServiceImpl implements AddressBookService{
	@Autowired
	private AddressBookRepository addressBookRepository;
	
	@Override
	public List<AddressInfo> pagingEmp(PagingInfo pInfo) {
		
		// 1. pagingInfo 객체 완성
		pInfo.setTotal(addressBookRepository.total());
		
		
		// 2. paingInfo 객체 전달하여 출력
		List<AddressInfo> aList = addressBookRepository.pagingEmp(pInfo);
		
		return aList;
	}

}
