package com.kh.circle.addressBook.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.addressBook.entity.AddressInfo;
import com.kh.circle.addressBook.entity.PagingInfo;

@Repository
public class AddressBookRepositoryImpl implements AddressBookRepository{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int total() {
		int total = sqlSession.selectOne("address.total");
		
		return total;
	}

	@Override
	public List<AddressInfo> pagingEmp(PagingInfo pInfo) {
		
		List<AddressInfo> aList = sqlSession.selectList("address.pagingEmp", pInfo);
		
		return aList;
	}
}
