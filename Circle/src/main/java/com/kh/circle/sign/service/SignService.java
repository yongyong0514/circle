package com.kh.circle.sign.service;

import java.io.IOException;

import com.kh.circle.sign.vo.SignWriteInsert;

public interface SignService {
	
//	결재 추가
	void insert(SignWriteInsert signWriteInsert) throws IllegalStateException, IOException;
		
}
