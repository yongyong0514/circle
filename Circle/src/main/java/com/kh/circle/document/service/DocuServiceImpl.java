package com.kh.circle.document.service;

import java.io.IOException;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.kh.circle.document.repository.DocuDao;
import com.kh.circle.document.vo.DocuFiles;
import com.kh.circle.document.vo.DocuReply;
import com.kh.circle.document.vo.DocuWriteInsert;

@Service
public class DocuServiceImpl implements DocuService {

	@Autowired
	private DocuDao docuDao;
	
//	Create Document
	@Override
	public void insert(DocuWriteInsert docuWriteInsert) {
		docuDao.add(docuWriteInsert);
	}


//	Create docuFiles
	@Override
	public void insertFile(String files_oname, long files_size, String files_type, String files_cname,
			String files_route) {
		docuDao.add(files_oname, files_size, files_type, files_cname, files_route);
	}


//	Create docuReply
	@Override
	public void insertDocuReply(DocuReply docuReply) {
		docuDao.add(docuReply);
		
	}

//	Delete docuReply
	@Override
	public void deleteDocuReply(String replyCode) {
		docuDao.add(replyCode);
		
	}

//	Result docuFileDownload
	@Override
	public ResponseEntity<ByteArrayResource> download(String fileCode) throws IOException {
		DocuFiles file = docuDao.find(fileCode);
		
		if(file == null) {
			return ResponseEntity.notFound().build();
		}
		byte[] data = docuDao.load(file.getFiles_cname());
		ByteArrayResource resource = new ByteArrayResource(data);
		ResponseEntity<ByteArrayResource> entity = 
				ResponseEntity.ok()
						.header("Content-Length", String.valueOf(file.getFiles_size()))
						.header("Content-Type", "application/octet-stream; charset=UTF-8")
						.header("Content-Disposition", "attachment; filename=\""+URLEncoder.encode(file.getFiles_oname(), "UTF-8")+"\"")
						.body(resource);	
		return entity;
	}
	
}
