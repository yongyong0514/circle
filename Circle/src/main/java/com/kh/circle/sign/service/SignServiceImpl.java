package com.kh.circle.sign.service;

import java.io.IOException;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.kh.circle.sign.repository.SignDao;
import com.kh.circle.sign.vo.SignFiles;
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

	// 결재 첨부 파일 다운로드
	@Override
	public ResponseEntity<ByteArrayResource> download(String fileCode) throws IOException {
		
		SignFiles signFiles = signDao.find(fileCode);
		
		if(signFiles == null) {
			return ResponseEntity.notFound().build();
		}
		
		byte[] data = signDao.load(signFiles.getFiles_code());
		
		ByteArrayResource resource = new ByteArrayResource(data);
		
		ResponseEntity<ByteArrayResource> entity = 
				ResponseEntity.ok()
						.header("Content-Length", String.valueOf(signFiles.getFiles_size()))
						.header("Content-Type", "application/octet-stream; charset=UTF-8")
						.header("Content-Disposition", "attachment; filename=\""+URLEncoder.encode(signFiles.getFiles_oname(), "UTF-8")+"\"")
					.body(resource);
		
		return entity;
	}
}
