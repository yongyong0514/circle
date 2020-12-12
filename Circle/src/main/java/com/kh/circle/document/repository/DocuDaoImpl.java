package com.kh.circle.document.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.document.vo.DocuWriteInsert;

@Repository
public class DocuDaoImpl implements DocuDao {
	
	@Autowired
	private SqlSession sqlSession;

	
//	Create Document
	@Override
	public void add(DocuWriteInsert docuWriteInsert) {

		String seqDocu = sqlSession.selectOne("document.seqDocu");
		docuWriteInsert.setSeqDocu(seqDocu);
		sqlSession.insert("document.docuWriteInsert", docuWriteInsert);
		
	}
	
	
	private final String path = "d:/resources/files/document";

	
//	Create documentFiles	
	@Override
	public void add(String files_oname, long files_size, String files_type, String files_cname, String files_route) {
		
		//시퀀스 번호 생성 및 파일 등록
		String seqSignFiles = sqlSession.selectOne("sign.seqSignFiles");
		
		String seqSignFilesCurrval = sqlSession.selectOne("sign.seqSignFilesCurrval");
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("seqSignFiles", seqSignFiles);
		map.put("seqSignFilesCurrval", seqSignFilesCurrval);
		map.put("files_oname", files_oname);
		map.put("files_size", files_size);
		map.put("files_type", files_type);
		map.put("files_cname", files_cname);
		map.put("files_route", files_route);
		
		sqlSession.insert("sign.signFiles", map);
		
	}

}
