package com.kh.circle.comu.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;


import com.kh.circle.comu.entity.Comu;
import com.kh.circle.comu.entity.ComuList;


public interface ComuService {
	
	//글 목록
	public List<Comu> comuList(int start,int end)throws Exception;
	
	//글 페이징
	public int comuListarticle()throws Exception;
	
	//글쓰기 (X)
	public void comuAdd(Comu vo)throws Exception;
	
	//글 쓰기 사원번호 가져오기
	public String comuAdd2(String emp_no);
	// 글쓰기
	public void comuInsert(Comu comu);
	
	//글 보기
	public List<Comu> comuDetail(String comu_post_ordr);
	
	//글 수정
	Comu comuCheck(String comu_post_ordr);
	
	void comuUpdate(Comu comu);
	
	//글 삭제하기
	void comuDelete(String comu_post_ordr);
	
	//동호회 리스트 가져오기
	List<ComuList> comuListName(String comu_list_code);
	
	//가입신청서에 동호회 이름 가져오기
	public String comuApp(String comu_list_code);
	
	
	 //void add(Comu comu, MultipartFile insert) throws IllegalStateException,IOException;
	  
	// ResponseEntity<ByteArrayResource> download(String no) throws UnsupportedEncodingException, IOException;
	 
	}
