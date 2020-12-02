package com.kh.circle.organChart.repository;

import java.util.List;

import com.kh.circle.organChart.entity.OrganDept;
import com.kh.circle.organChart.entity.OrganEmp;

public interface OrganChartRepository {

	public int maxLevel();
	
	public List<OrganDept> oDList(int lvl);
	
	public List<OrganEmp> oEList(String dept_code);
}
