package com.kh.circle.comu.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;


import com.kh.circle.comu.entity.Comu;


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
	
	//글 수정으로 입장
	List<Comu> comuCheck(String emp_info_name);
	
	//글 수정
	void comuUpdate(Comu comu);
	
	
	
	
	 //void add(Comu comu, MultipartFile insert) throws IllegalStateException,IOException;
	  
	// ResponseEntity<ByteArrayResource> download(String no) throws UnsupportedEncodingException, IOException;
	 
	}
