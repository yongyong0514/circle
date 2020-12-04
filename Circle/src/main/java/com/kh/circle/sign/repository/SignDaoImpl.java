package com.kh.circle.sign.repository;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.sign.vo.SignFiles;
import com.kh.circle.sign.vo.SignWriteInsert;

@Repository
public class SignDaoImpl implements SignDao {
	
	private final String path = "d:/resources/files/sign";
	
	@Autowired
	private SqlSession sqlSession;

	//결재 등록
	@Override
	public void add(SignWriteInsert signWriteInsert) {
		
		//시퀀스 번호 생성 및 결재 등록
		String seqSign = sqlSession.selectOne("sign.seqSign");	
		signWriteInsert.setSeqSign(seqSign);
		sqlSession.insert("sign.signWriteInsert", signWriteInsert);
		
		//생성된 시퀀스 번호로 결재자 등록
		String jList = signWriteInsert.getJCodeList();
		String [] jListArray = jList.split("/");
		Map<String, Object> jmap = new HashMap<>();
		
			for(int i = 0; i < jListArray.length; i++) {
				
				//결재자 시퀀스 번호 생성
				String seqSignJoiner = sqlSession.selectOne("sign.seqSignJoiner");
				
				jmap.put("seqSignJoiner", seqSignJoiner);
				jmap.put("seqSign", seqSign);
				jmap.put("sign_join_emp_code", jListArray[i]);
				
				sqlSession.insert("sign.signWriteJoiner", jmap);
			}
			
		//생성된 시숸스 번호로 참조자 등록
		String wList = signWriteInsert.getWCodeList();
		
		if(wList.length() != 0) {
			String [] wListArray = wList.split("/");
			Map<String, Object> wmap = new HashMap<>();
			
				for(int i = 0; i <wListArray.length; i++) {
					
					//참조자 시퀀스 번호 생성
					String seqSignJoiner = sqlSession.selectOne("sign.seqSignJoiner");
					
					wmap.put("seqSignJoiner", seqSignJoiner);
					wmap.put("seqSign", seqSign);
					wmap.put("sign_join_emp_code", wListArray[i]);
					
					sqlSession.insert("sign.signWriteWatcher", wmap);
				}
		}
		
		sqlSession.insert("sign.signProcessAdd1", seqSign);
	}
	
	//결재 파일 등록
	@Override
	public void add(String files_oname, long files_size, String files_type, String files_cname, String files_route) {
		
		//시퀀스 번호 생성 및 파일 등록
		String seqSignFiles = sqlSession.selectOne("sign.seqSignFiles");	
		
		//결재 시퀀스 조회 및 등록
		
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

	//결재 첨부 파일 정보 찾기
	@Override
	public SignFiles find(String fileCode) {
		return sqlSession.selectOne("sign.signFileOne", fileCode);
	}

	//결재 첨부 파일 로드
	@Override
	public byte[] load(String files_code) throws IOException {
		File target = new File(path, String.valueOf(files_code));
		byte[] data = FileUtils.readFileToByteArray(target);

		return data;
	}
}
