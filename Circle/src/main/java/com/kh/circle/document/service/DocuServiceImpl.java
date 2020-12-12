package com.kh.circle.document.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.circle.document.repository.DocuDao;
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
	
}
