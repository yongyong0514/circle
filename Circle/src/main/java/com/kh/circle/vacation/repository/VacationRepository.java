package com.kh.circle.vacation.repository;

import java.util.List;
import java.util.Map;
import java.util.Map;

import com.kh.circle.vacation.entity.Vacation;
import com.kh.circle.vacation.entity.VacationInfo;

public interface VacationRepository {
	public List<Vacation> vacationList(String emp_no);
	
	public String annualTerm (String emp_no);
	
	public int annualLeave (String annualTerm);
	
	public double usedVacationDays (String emp_no);
	
	public void addVacation(VacationInfo vacationInfo);
	
	public String myDeptCode(String emp_no);
	
	public String ceoEmpNo();
	
	public String upperEmp(String dept_code);
	
	public String highDept(String dept_code);
}
