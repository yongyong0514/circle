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
	
	// 결재 등록	
	@Override
	public void insert(SignWriteInsert signWriteInsert) throws IllegalStateException, IOException {
		signDao.add(signWriteInsert);
	}
	
	// 결재 첨부 파일 등록
	@Override
	public void insertFile(String files_oname, long files_size, String files_type, String files_cname, String files_route) {
		signDao.add(files_oname, files_size, files_type, files_cname, files_route);
	}

}
