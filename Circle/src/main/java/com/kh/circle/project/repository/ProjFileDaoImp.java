package com.kh.circle.project.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.circle.project.entity.ProjFile;

public class ProjFileDaoImp implements ProjFileDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String insert(ProjFile projFile) {

		String file_code = sqlSession.selectOne("projFile.seq");
		
		sqlSession.insert("projFile.issFileInsert", projFile);
		
		return file_code;
	} 
	
	

}
