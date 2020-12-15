package com.kh.circle.vacation.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.circle.sign.vo.SignWriteInsert;
import com.kh.circle.vacation.entity.Vacation;
import com.kh.circle.vacation.entity.VacationInfo;
import com.kh.circle.vacation.repository.VacationRepository;

@Service
public class VacationServiceImpl implements VacationService {
	@Autowired
	private VacationRepository vacationRepository;
	
	@Override
	public Map<String, Object> vacationList(String emp_no) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 연차사용목록 출력
		List<Vacation> vList = vacationRepository.vacationList(emp_no);
		map.put("vList", vList);
		
		// 요약정보 출력
		// 1. 근속연월 확인
		String annualTerm = vacationRepository.annualTerm(emp_no);
		
		// 2. 반환된 근속연월로 발급된 연차 확인
		// 	- 1년 미만은 1개월 당 1일
		int annualLeave = vacationRepository.annualLeave(annualTerm);
		map.put("annualLeave", annualLeave);
		
		// 3. 사용연차 일수 계산
		double usedVacationDays = vacationRepository.usedVacationDays(emp_no);
		map.put("usedVacationDays", usedVacationDays);
		
		// 4. 잔여 연차 일수 계산
		double leftVacationDays = annualLeave - usedVacationDays;
		map.put("leftVacationDays", leftVacationDays);
		
		return map;
	}

	@Override
	public SignWriteInsert formVacation(VacationInfo vacationInfo) {
		// 받아온 정보를 vo형식으로 변환
		String emp_no = vacationInfo.getEmpNo();
		
		
		// 휴가계 내용 html 형식으로 변환
		String jSignerList = "";	// 결재자 사원번호 List("/"로 연결)
		// html 구문
		String formedNote = "<ul style='list-style-type : disc; padding-left:3rem'>";
		
		formedNote += "<li>신청일자 : " + vacationInfo.getRegitDate() + "</li><br>";
		formedNote += "<li>구분 : " + vacationInfo.getVacationType() + "</li><br>";
		formedNote += "<li>전일/반일 : " + vacationInfo.getIsHalf() + "</li><br>";
		formedNote += "<li>기간 : " + vacationInfo.getStartDate() + " ~ " + vacationInfo.getEndDate() + "</li><br>";
		formedNote += "<li>내용 : " + vacationInfo.getContent() + "</li>";

		formedNote += "</ul>";
		
		
		// 결제자 선정
		// 본인을 제외한 해당 부서 상급자 또는 상위부서 상급자
		
		// 1) 내 부서 확인
		String dept_code = vacationRepository.myDeptCode(emp_no);
		
		Map<String, Object> empMap = new HashMap<String, Object>();
		empMap.put("emp_no", emp_no);
		empMap.put("dept_code", dept_code);
		
		// 2) 결제자 수, 결제자 리스트
		// 대표이사인 경우
		String totalSigner = "";
		if("D0000".equals(dept_code)) {
			//자신을 결재자로 추가
			totalSigner = "1";
			
			jSignerList = vacationRepository.ceoEmpNo();
		}
		// 대표이사가 아닌 경우
		else {
			//부서장 사원번호 추출
			String upperEmp = vacationRepository.upperEmp(dept_code);
			
			//자신이 부서장인 경우
			if(emp_no.equals(upperEmp)) {
				//상급 부서장(1명)을 결재자로 등록
				totalSigner = "1";
				
				//상급 부서코드 추출
				String highDept = vacationRepository.highDept(dept_code);
				
				//상급 부서장 추가
				jSignerList = vacationRepository.upperEmp(highDept);
			}
			//자신이 부서장이 아닌 경우
			else {
				//부서장(1명), 상급부서장(1명)을 결제자로 등록
				totalSigner = "2";
				
				//1)부서장 사원번호 추출
				upperEmp = vacationRepository.upperEmp(dept_code);
				
				//2)상급 부서 부서장 사원번호 추출
				//상급 부서코드 추출
				String highDept = vacationRepository.highDept(dept_code);
				String highDeptEmp = vacationRepository.upperEmp(highDept);
				
				//부서장, 상급 부서장 추가
				jSignerList = upperEmp + "/" + highDeptEmp;
			}
		}
		
		// vo에 저장
		SignWriteInsert signForm = SignWriteInsert.builder()
									.sign_type_code("SITC000001")
									.sign_keep("1095")	// 3년 고정
									.sign_acc("4")		// c등급
									.sign_title(vacationInfo.getRegitDate() + " " + vacationInfo.getEmpName() + " 휴가계")
									.sign_note(formedNote)
									.sign_emp_code(vacationInfo.getEmpNo())
									.sign_count(totalSigner)		// 결재자 수
									.jCodeList(jSignerList)		// 결재자"/"로 연결
									.wCodeList("")				// 참조자 0명
									.build();
		return signForm;
	}

	@Override
	public void addVacation(VacationInfo vacationInfo) {
		vacationRepository.addVacation(vacationInfo);
	}

	@Override
	public String findSignCode(String emp_no) {
		return vacationRepository.findSignCode(emp_no);
	}
	
}
