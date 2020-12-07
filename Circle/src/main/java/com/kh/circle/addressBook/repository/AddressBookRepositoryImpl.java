package com.kh.circle.addressBook.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.addressBook.entity.AddressInfo;
import com.kh.circle.addressBook.entity.PagingInfo;
import com.kh.circle.empInfo.entity.EmpInfoAll;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class AddressBookRepositoryImpl implements AddressBookRepository{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int total(PagingInfo pInfo) {
		int total = sqlSession.selectOne("address.total", pInfo);
		
		return total;
	}

	@Override
	public List<AddressInfo> pagingEmp(PagingInfo pInfo) {
		
		List<AddressInfo> aList = sqlSession.selectList("address.pagingEmp", pInfo);
		
		return aList;
	}

	@Override
	public EmpInfoAll detail(String emp_no) {
		
		EmpInfoAll empInfo = sqlSession.selectOne("address.detail", emp_no);
		
		return empInfo;
	}
}
