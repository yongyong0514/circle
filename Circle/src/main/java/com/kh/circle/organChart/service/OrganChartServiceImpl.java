package com.kh.circle.organChart.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.circle.organChart.entity.OrganDept;
import com.kh.circle.organChart.repository.OrganChartRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OrganChartServiceImpl implements OrganChartService {
	@Autowired
	private OrganChartRepository organChartRepository;
	
	@Override
	public List<OrganDept> oDList() {
// 보류	// 계획
		// 1. level별로 dept정보를 불러온다
		// 2. dept별 포함된 사원 정보를 list 형태로 저장한다.
		// 3. jsp 페이지에서 dept의 list 포함여부 판단 후 출력구문 생성(반복문 이용)
		
		// dept에 level을 두어 추출
		List<OrganDept> oDList = organChartRepository.oDList();

		for(OrganDept organDept : oDList) {
			organDept.setEmpList(organChartRepository.oEList(organDept.getDept_info_code()));
		}
		
		return oDList;
		
		// 계획
		// 1. 부서별 최대레벨을 추출
		// 2. 레벨 수 만큼 부서정보를 저장하는 리스트 생성
		// 3. 2.에서 생성된 리스트에 부서별 사원정보 저장
		// 4. 3에서 생성된 리스트를 묶어 전송용 리스트 생성
		
//		int maxLevel = organChartRepository.maxLevel();
//		
//		List<List<OrganDept>> levelList = new ArrayList<List<OrganDept>>();
//		
//		
//		for(int lvl = 1; lvl <= maxLevel; lvl++) {
//			// 레벨별 부서리스트 저장
//			List<OrganDept> tempList = organChartRepository.oDList(lvl);
//
//			// 부서원 저장
//			for(OrganDept organDept: tempList) {
//				
//				organDept.setEmpList(organChartRepository.oEList(organDept.getDept_info_code()));
//
//			}
//
//			levelList.add(tempList);
//			
//		}
//
//		log.info("levelList: " + levelList);
//		return levelList;
	}

	
	
}
