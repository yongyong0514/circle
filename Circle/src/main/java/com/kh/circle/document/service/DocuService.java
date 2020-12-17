package com.kh.circle.document.service;

import java.io.IOException;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;

import com.kh.circle.document.vo.DocuReply;
import com.kh.circle.document.vo.DocuWriteInsert;

public interface DocuService {

//	Create document
	void insert(DocuWriteInsert docuWriteInsert);

//	Create docuFiles
	void insertFile(String files_oname, long files_size, String files_type, String files_cname, String files_route);

//	Create docuReply
	void insertDocuReply(DocuReply docuReply);

//	Delete docuReply
	void deleteDocuReply(String replyCode);

//	Result docuFileDownload
	ResponseEntity<ByteArrayResource> download(String fileCode) throws IOException;

}
