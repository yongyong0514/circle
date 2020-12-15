package com.kh.circle.empInfo.service;

import java.util.List;
import java.util.Map;

import com.kh.circle.addressBook.entity.PagingInfo;
import com.kh.circle.empInfo.entity.CareerInfo;
import com.kh.circle.empInfo.entity.CertificateInfo;
import com.kh.circle.empInfo.entity.EmpInfoAll;
import com.kh.circle.empInfo.entity.HREvaluation;
import com.kh.circle.empInfo.entity.RewardDiscipline;
import com.kh.circle.empInfo.entity.HREvaluation;
import com.kh.circle.empInfo.entity.RewardDiscipline;

public interface EmpInfoService {
	
	public Map<String, Object> empInfoOne(String emp_no);

	public Map<String, Object> empInfoList(PagingInfo pInfo);

	public String checkPwd(Map<String, Object> map);
	
	public List<String> compare(Map<String, Object> inputMap);
	
	public Map<String, Object> deptMap();
	
	public Map<String, Object> jobMap();

	public void insertEmpInfoAll(EmpInfoAll eInfo);
	
	public void insertCertificateInfo(CertificateInfo crtf);
	
	public void insertCareerInfo(CareerInfo cInfo);
	
	public void insertHREvaluation(HREvaluation hre);
	
	public void insertRewardDiscipline(RewardDiscipline redi);
	
	
}
