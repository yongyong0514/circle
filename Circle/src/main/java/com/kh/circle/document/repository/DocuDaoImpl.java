package com.kh.circle.document.repository;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.document.vo.DocuFiles;
import com.kh.circle.document.vo.DocuReply;
import com.kh.circle.document.vo.DocuWriteInsert;

@Repository
public class DocuDaoImpl implements DocuDao {
	
	@Autowired
	private SqlSession sqlSession;

	
//	Create Document
	@Override
	public void add(DocuWriteInsert docuWriteInsert) {

		String seqDocu = sqlSession.selectOne("docu.seqDocu");
		
		docuWriteInsert.setSeqDocu(seqDocu);
		
		sqlSession.insert("docu.docuWriteInsert", docuWriteInsert);
		
	}
	
	
	private final String path = "d:/upload/kh52/resources/files/document";

	
//	Create documentFiles	
	@Override
	public void add(String files_oname, long files_size, String files_type, String files_cname, String files_route) {
		
		//시퀀스 번호 생성 및 파일 등록
		String seqDocuFiles = sqlSession.selectOne("docu.seqDocuFiles");
		
		String seqDocuFilesCurrval = sqlSession.selectOne("docu.seqDocuFilesCurrval");
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("seqDocuFiles", seqDocuFiles);
		map.put("seqDocuFilesCurrval", seqDocuFilesCurrval);
		map.put("files_oname", files_oname);
		map.put("files_size", files_size);
		map.put("files_type", files_type);
		map.put("files_cname", files_cname);
		map.put("files_route", files_route);
		
		sqlSession.insert("docu.docuFiles", map);
		
	}


//	Create docuReply
	@Override
	public void add(DocuReply docuReply) {
		
		//시퀀스 번호 생성 및 파일 등록
		String seqReply = sqlSession.selectOne("docu.seqReply");
				
		//결재 댓글 등록
		Map<String, Object> map = new HashMap<>();
				
		map.put("seqReply", seqReply);
		map.put("docu_repl_docu_code", docuReply.getDocu_repl_docu_code());
		map.put("docu_repl_content", docuReply.getDocu_repl_content());
		map.put("docu_repl_emp_code", docuReply.getDocu_repl_emp_code());
				
		sqlSession.insert("docu.docuReplyInsert", map);
		
	}


//	Delete docuReply
	@Override
	public void add(String replyCode) {
		System.out.println(replyCode);
		sqlSession.delete("docu.docuReplyDelete", replyCode);
		
	}


//	Result docuFiles
	@Override
	public DocuFiles find(String fileCode) {
		return sqlSession.selectOne("docu.docuFileOne", fileCode);
	}


//	Result docuFilesInfo
	@Override
	public byte[] load(String files_cname) throws IOException {
		File target = new File(path, String.valueOf(files_cname));
		byte[] data = FileUtils.readFileToByteArray(target);
		
		return data;
	}

}
