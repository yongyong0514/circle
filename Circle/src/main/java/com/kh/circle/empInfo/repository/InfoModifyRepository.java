package com.kh.circle.empInfo.repository;

import java.util.List;

import com.kh.circle.empInfo.entity.InfoModify;

public interface InfoModifyRepository {
	public List<InfoModify> infoModList(String emp_no);
}
