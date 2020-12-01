package com.kh.circle.sign.service;

import java.io.IOException;
import java.util.Map;

import com.kh.circle.sign.vo.SignWriteInsert;

public interface SignService {
	
//	결재 추가
	void insert(SignWriteInsert signWriteInsert) throws IllegalStateException, IOException;

	void insert(Map<String, Object> map);
		
}
