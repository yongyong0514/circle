package com.kh.circle.document.service;

import com.kh.circle.document.vo.DocuWriteInsert;

public interface DocuService {

//	Create document
	void insert(DocuWriteInsert docuWriteInsert);

	
//	Create docuFiles
	void insertFile(String files_oname, long files_size, String files_type, String files_cname, String files_route);


}
