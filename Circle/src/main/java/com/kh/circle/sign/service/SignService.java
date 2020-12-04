package com.kh.circle.sign.service;

import java.io.IOException;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;

import com.kh.circle.sign.vo.SignWriteInsert;

public interface SignService {
	
	// 결재 등록
	void insert(SignWriteInsert signWriteInsert) throws IllegalStateException, IOException;

	// 결재 첨부 파일 등록
	void insertFile(String files_oname, long files_size, String files_type, String files_cname, String files_route);
	
	// 결재 첨부 파일 다운로드
	ResponseEntity<ByteArrayResource> download(String fileCode) throws IOException;

}
	