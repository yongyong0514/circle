package com.kh.circle.empInfo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.circle.empInfo.entity.CertificateInfo;
import com.kh.circle.empInfo.entity.EmpInfoAll;
import com.kh.circle.empInfo.repository.CertificateInfoRepository;
import com.kh.circle.empInfo.repository.EmpInfoRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EmpInfoServiceImpl implements EmpInfoService{

	@Autowired
	private EmpInfoRepository empInfoRepository;
	
	@Autowired
	private CertificateInfoRepository certificateInfoRepository;
	
	//사원 1명의 정보
	@Override
	public Map<String, Object> empInfoOne(String emp_no) {

		Map<String, Object> map = new HashMap<>();
		
		//기본인사정보
		EmpInfoAll empInfoOne = empInfoRepository.empInfoOne(emp_no);
		map.put("empInfoOne", empInfoOne);
		
		//자격정보
		List<CertificateInfo> crtfInfoList = certificateInfoRepository.crtfInfoList(emp_no);
		map.put("crtfInfoList", crtfInfoList);
		
		return map;
	}

}
