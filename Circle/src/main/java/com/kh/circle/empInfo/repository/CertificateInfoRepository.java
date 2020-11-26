package com.kh.circle.empInfo.repository;

import java.util.List;

import com.kh.circle.empInfo.entity.CertificateInfo;

public interface CertificateInfoRepository {

	public List<CertificateInfo> crtfInfoList(String emp_no);
}
