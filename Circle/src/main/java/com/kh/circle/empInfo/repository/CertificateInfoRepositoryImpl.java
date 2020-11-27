package com.kh.circle.empInfo.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.empInfo.entity.CertificateInfo;

@Repository
public class CertificateInfoRepositoryImpl implements CertificateInfoRepository{
	@Autowired
	private SqlSession sqlSession;
	
	//사원 1명의 자격정보 이력
	@Override
	public List<CertificateInfo> crtfInfoList(String emp_no) {
		
		List<CertificateInfo> crtfInfoOne = sqlSession.selectList("crtfInfo.searchListWithEmpNo", emp_no);
		
		return crtfInfoOne;
	}
}
