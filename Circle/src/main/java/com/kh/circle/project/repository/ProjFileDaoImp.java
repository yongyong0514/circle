package com.kh.circle.project.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.kh.circle.project.entity.ProjFile;


@Repository
public class ProjFileDaoImp implements ProjFileDao{

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public String insert(ProjFile projFile) {
		


		String files_code = sqlSession.selectOne("projFile.seq");
		
		projFile.setFiles_code(files_code);
		
		sqlSession.insert("projFile.issFileInsert", projFile);
		
		return files_code;
	} 
	
	

}
