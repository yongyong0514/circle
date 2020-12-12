package com.kh.circle.project.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.circle.project.entity.ProjFile;


@Repository
public class ProjFileDaoImp implements ProjFileDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Transactional
	@Override
	public String insert(ProjFile projFile, String iss_code, String pro_code) {
		


		String files_code = sqlSession.selectOne("projFile.seq");

		System.out.println("pro code : " + pro_code);
		
		projFile.setFiles_code(files_code);
		projFile.setFiles_type(pro_code);
		projFile.setFiles_status(iss_code);
		
		sqlSession.insert("projFile.issFileInsert", projFile);
		
		return files_code;
	}


	@Override
	public ProjFile find(String files_code) {

		
		
		return sqlSession.selectOne("projFile.proFileFind", files_code);
	} 
	
	

}
