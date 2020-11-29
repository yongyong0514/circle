package com.kh.circle.sign.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.sign.vo.SignWriteInsert;

@Repository
public class SignDaoImpl implements SignDao {
	
	@Autowired
	private SqlSession sqlSession;

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

}
