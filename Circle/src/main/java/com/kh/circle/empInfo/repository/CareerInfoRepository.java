package com.kh.circle.empInfo.repository;

import java.util.List;

import com.kh.circle.empInfo.entity.CareerInfo;

public interface CareerInfoRepository {
	public List<CareerInfo> careerInfoList(String emp_no);
}
