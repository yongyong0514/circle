package com.kh.circle.vacation.repository;

import java.util.List;

import com.kh.circle.vacation.entity.Vacation;

public interface VacationRepository {
	public List<Vacation> vacationList(String emp_no);
}
