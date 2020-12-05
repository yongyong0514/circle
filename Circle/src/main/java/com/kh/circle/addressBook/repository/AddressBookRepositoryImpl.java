package com.kh.circle.addressBook.repository;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.addressBook.entity.AddressInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class AddressBookRepositoryImpl implements AddressBookRepository{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<AddressInfo> pagingEmp(Map<String, Object> inputMap) {
		
		List<AddressInfo> aList = sqlSession.selectList("address.pagingEmp", inputMap);
		
		return aList;
	}

}
