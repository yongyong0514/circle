package com.kh.circle.addressBook.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.circle.addressBook.entity.AddressInfo;
import com.kh.circle.addressBook.entity.PagingInfo;
import com.kh.circle.addressBook.repository.AddressBookRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AddressBookServiceImpl implements AddressBookService{
	@Autowired
	private AddressBookRepository addressBookRepository;
	
	@Override
	public Map<String, Object> pagingEmp(PagingInfo pInfo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 1. pagingInfo 객체 완성
		pInfo.setPerGroup(5);
		pInfo.setTotal(addressBookRepository.total(pInfo));
		pInfo.calcValues();
		
		map.put("pInfo", pInfo);
		
		// 2. paingInfo 객체 전달하여 출력
		List<AddressInfo> aList = addressBookRepository.pagingEmp(pInfo);
		map.put("aList", aList);
		
		return map;
	}

}
