package com.kh.circle.empInfo.service;

import java.lang.reflect.Field;
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
	public List<String> compare(Map<String, Object> inputMap) {
		// 인자 전달용 map
		Map<String, Object> compareMap = new HashMap<String, Object>();

		// 1. 기존 정보에서 변경된 컬럼명 추출
		// - updatedColumnNameList
		List<String> ucnList = empInfoRepository.compare((EmpInfoAll) inputMap.get("changeEmpInfoAll"));

		// 2. 리스트 값에 따라 해당하는 컬럼 업데이트
		//// 1) 정보변경이력 테이블에 변경내역 insert
		EmpInfoAll changeInfo = (EmpInfoAll) inputMap.get("changeEmpInfoAll");
		compareMap.put("emp_info_emp_no", changeInfo.getEmp_info_emp_no()); // 변경 대상의 사원번호

		// 컬럼별(반복) insert
		for (String col : ucnList) {
			compareMap.put("col", col); // 항목(컬럼)명

			// 변경 전 정보 추출
			Map<String, Object> beforeMap = new HashMap<String, Object>();

			beforeMap.put("emp_info_emp_no", ((EmpInfoAll) inputMap.get("changeEmpInfoAll")).getEmp_info_emp_no());

			beforeMap.put("col", col);

			String befr = empInfoRepository.searchWithCol(beforeMap);
			compareMap.put("befr", befr); // 변경 전 정보

			// 변경 후 정보 추출
			// 컬럼명 - 값으로 맵에 저장하여 해당 값만 추출

			Map<String, Object> afterColMap = empInfoRepository.setAfterCol(changeInfo);
			compareMap.put("aftr", afterColMap.get(col)); // 변경 후 정보

			compareMap.put("mdr_emp_no", inputMap.get("mdr_emp_no")); // 수정자 사원번호

			empInfoRepository.addChangeCol(compareMap);
		}

		//// 2) 해당 값 update
		empInfoRepository.updateChangeInfo(changeInfo);
		
		
		return null;
	}

	@Override
	public List<String> updatedColName(EmpInfoAll empInfoAll) {
		// TODO Auto-generated method stub
		return null;
	}

}
