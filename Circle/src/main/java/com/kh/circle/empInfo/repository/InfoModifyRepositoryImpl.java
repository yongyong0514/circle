package com.kh.circle.empInfo.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.empInfo.entity.InfoModify;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class InfoModifyRepositoryImpl implements InfoModifyRepository{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<InfoModify> infoModList(String emp_no) {
		
		List<InfoModify> infoModList = sqlSession.selectList("infoModify.searchWithEmpNo", emp_no);
		
		return infoModList;
	}
}
