package com.kh.circle.document.repository;

import com.kh.circle.document.vo.DocuWriteInsert;

public interface DocuDao {
	
//	Create Document
	void add(DocuWriteInsert docuWriteInsert);

	
//	Create docuFiles
	void add(String files_oname, long files_size, String files_type, String files_cname, String files_route);

	
}
