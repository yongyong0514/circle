package com.kh.circle.sign.repository;

import com.kh.circle.sign.vo.SignWriteInsert;

public interface SignDao {
	//결재 등록
	void add(SignWriteInsert signWriteInsert);

	//결재 파일 등록
	void add(String files_oname, long files_size, String files_type, String files_cname, String files_route);

}
