package com.kh.circle.empInfo.repository;

import java.util.List;

import com.kh.circle.empInfo.entity.RewardDiscipline;

public interface RewardDisciplineRepository {
	public List<RewardDiscipline> rdInfoList(String emp_no);
}
