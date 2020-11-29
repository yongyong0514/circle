package com.kh.circle.sign.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.circle.sign.repository.SignDao;
import com.kh.circle.sign.vo.SignWriteInsert;

@Service
public class SignServiceImpl implements SignService {

	@Autowired
	private SignDao signDao;
	
	@Override
	public void insert(SignWriteInsert signWriteInsert) throws IllegalStateException, IOException {
//		결재 등록
		signDao.add(signWriteInsert);

	}

}
