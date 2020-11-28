package com.kh.circle.empInfo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.circle.empInfo.entity.CareerInfo;
import com.kh.circle.empInfo.entity.CertificateInfo;
import com.kh.circle.empInfo.entity.EmpInfoAll;
import com.kh.circle.empInfo.entity.HREvaluation;
import com.kh.circle.empInfo.entity.RewardDiscipline;
import com.kh.circle.empInfo.repository.CareerInfoRepository;
import com.kh.circle.empInfo.repository.CertificateInfoRepository;
import com.kh.circle.empInfo.repository.EmpInfoRepository;
import com.kh.circle.empInfo.repository.HREvaluationRepository;
import com.kh.circle.empInfo.repository.RewardDisciplineRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EmpInfoServiceImpl implements EmpInfoService{

	@Autowired
	private EmpInfoRepository empInfoRepository;
	
	@Autowired
	private CertificateInfoRepository certificateInfoRepository;
	
	@Autowired
	private CareerInfoRepository careerInfoRepository;
	
	@Autowired
	private RewardDisciplineRepository rewardDisciplineRepository;
	
	@Autowired
	private HREvaluationRepository hREvaluationRepository;
	
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
		
		//경력이력
		List<CareerInfo> careerInfoList = careerInfoRepository.careerInfoList(emp_no);
		map.put("careerInfoList", careerInfoList);
		
		//포상/징계이력
		List<RewardDiscipline> rdInfoList = rewardDisciplineRepository.rdInfoList(emp_no);
		map.put("rdInfoList", rdInfoList);
		
		//인사평가기록
		List<HREvaluation> hREvaluationList = hREvaluationRepository.hREvaluationList(emp_no);
		map.put("hREvaluationList", hREvaluationList);
		
		//정보변경이력
		
		
		return map;
	}

}
