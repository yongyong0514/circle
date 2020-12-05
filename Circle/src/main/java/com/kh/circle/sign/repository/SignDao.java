package com.kh.circle.sign.repository;

import java.io.IOException;

import org.springframework.ui.Model;

import com.kh.circle.sign.vo.SignFiles;
import com.kh.circle.sign.vo.SignReplyInsert;
import com.kh.circle.sign.vo.SignWriteInsert;

public interface SignDao {
	//결재 등록
	void add(SignWriteInsert signWriteInsert);

	//결재 첨부 파일 등록
	void add(String files_oname, long files_size, String files_type, String files_cname, String files_route);

	//결재 첨부 파일 찾기
	SignFiles find(String fileCode);

	//결재 첨부 파일 로드
	byte[] load(String files_cname) throws IOException;

	//결재 댓글 등록
	void add(SignReplyInsert signReplyInsert);

}
