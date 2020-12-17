package com.kh.circle.document.repository;

import java.io.IOException;

import com.kh.circle.document.vo.DocuFiles;
import com.kh.circle.document.vo.DocuReply;
import com.kh.circle.document.vo.DocuWriteInsert;

public interface DocuDao {
	
//	Create Document
	void add(DocuWriteInsert docuWriteInsert);

	
//	Create docuFiles
	void add(String files_oname, long files_size, String files_type, String files_cname, String files_route);

//	Create docuReply
	void add(DocuReply docuReply);

//	Delete docuReply
	void add(String replyCode);

//	Result docuFiles
	DocuFiles find(String fileCode);

//	Result docuFilesInfo
	byte[] load(String files_cname) throws IOException;

	
}
