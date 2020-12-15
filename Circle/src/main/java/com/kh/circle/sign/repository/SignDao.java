package com.kh.circle.sign.repository;

import java.io.IOException;

import com.kh.circle.sign.vo.SignFiles;
import com.kh.circle.sign.vo.SignReplyInsert;
import com.kh.circle.sign.vo.SignType;
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

	//결재 서명 파일 등록
	void add(String files_oname, long files_size, String files_type, String files_cname, String files_route,
			String iempCode);

	//결서 서명 파일 로드
	byte[] loadFile(String files_cname) throws IOException;

	//결재 동의 댓글 등록
	void addAgree(String empCode, String signCode, String fileCode);

	//결재 서명 삭제 업데이트
	void update(String fileCode);

	//결재 댓글 삭제
	void add(String replyCode);

	//결재 문서 양식 등록
	void add(SignType signType);

	//결재 타입 삭제
	void addDeleteSignType(String typeCode);

}
