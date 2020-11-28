package com.kh.circle.empInfo.repository;

import java.util.List;

import com.kh.circle.empInfo.entity.HREvaluation;

public interface HREvaluationRepository {
	public List<HREvaluation> hREvaluationList(String emp_no);
}
