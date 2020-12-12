package com.kh.circle.empInfo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.circle.addressBook.entity.PagingInfo;
import com.kh.circle.empInfo.entity.CareerInfo;
import com.kh.circle.empInfo.entity.CertificateInfo;
import com.kh.circle.empInfo.entity.EmpInfoAll;
import com.kh.circle.empInfo.entity.HREvaluation;
import com.kh.circle.empInfo.entity.InfoModify;
import com.kh.circle.empInfo.entity.RewardDiscipline;
import com.kh.circle.empInfo.repository.CareerInfoRepository;
import com.kh.circle.empInfo.repository.CertificateInfoRepository;
import com.kh.circle.empInfo.repository.EmpInfoRepository;
import com.kh.circle.empInfo.repository.HREvaluationRepository;
import com.kh.circle.empInfo.repository.InfoModifyRepository;
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
	
	@Autowired
	private InfoModifyRepository infoModifyRepository;
	
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
		List<InfoModify> infoModList = infoModifyRepository.infoModList(emp_no);
		map.put("infoModList", infoModList);
		
		return map;
	}

	@Override
	public Map<String, Object> empInfoList(PagingInfo pInfo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 1. pagingInfo 객체 완성
		pInfo.setPerGroup(5);
		pInfo.setTotal(empInfoRepository.total(pInfo));
		pInfo.calcValues();
		
		map.put("pInfo", pInfo);
		
		// 2. paingInfo 객체 전달하여 출력
		List<EmpInfoAll> empList = empInfoRepository.empInfoList(pInfo);
		
		map.put("empList", empList);
		
		return map;
	}

	@Override
	public String checkPwd(Map<String, Object> map) {
		String userPwd = empInfoRepository.checkPwd(map);
		
		if(map.get("curPwd").equals(userPwd)) {
			return "true";
		} else {
			return "false";
		}
		
	}

	@Override
	public List<String> compare(EmpInfoAll empInfoAll) {
		empInfoRepository.compare(empInfoAll);
		
		return null;
	}

	@Override
	public List<String> updatedColName(EmpInfoAll empInfoAll) {
		// TODO Auto-generated method stub
		return null;
	}

}
