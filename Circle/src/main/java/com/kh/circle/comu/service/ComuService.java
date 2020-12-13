package com.kh.circle.comu.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;


import com.kh.circle.comu.entity.Comu;
import com.kh.circle.comu.entity.ComuList;
import com.kh.circle.login.entity.EmpInfo;


public interface ComuService {
	
	//글 목록
	public List<Comu> comuList(int start,int end)throws Exception;
	
	//게시글 당 글 목록
	public List<Comu> comuListPost(String comu_list_code);
	//가입신청서 리스트
	public List<Comu> comuAppList();
	
	
	//글 페이징
	public int comuListarticle()throws Exception;
	
	//글쓰기 (X)
	public void comuAdd(Comu vo)throws Exception;
	
	//글 쓰기 사원번호 가져오기
	public String comuAdd2(String emp_no);
	public String comuAdd3(String emp_info_emp_no);
	// 글쓰기
	public void comuInsert(Comu comu);
	
	
	
	//글 보기
	public List<Comu> comuDetail(String comu_post_ordr);
	//가입신청서 보기
	public List<Comu> appDetail(String comu_post_ordr);
	
	
	//글 수정
	Comu comuCheck(String comu_post_ordr);
	
	void comuUpdate(Comu comu);
	
	//글 삭제하기
	void comuDelete(String comu_post_ordr);
	//가입신청서 삭제하기
	void appDelete(String comu_post_ordr);
	
	
	//동호회 리스트 가져오기
	List<ComuList> comuListName(String comu_list_code);
	
	//가입신청서에 동호회 이름 가져오기
	List <ComuList> comuApp(String comu_list_code);
	//가입신청서 쓰기 사원번호 가져오기
	public String comuApp2(String emp_no);
	//가입 신청서 작성
	public void comuAppAction(Comu comu);
		
	
	//leftBar 리스트 가져오기
	public List<EmpInfo> leftList(String emp_info_emp_no);
	
	String comuEmpNo(String emp_no);

	String viewEmpNo(String comu_post_ordr);
	
	//리스트에 comu_info_emp_no 값 가져오기
	String comuInfoNo(String comu_info_emp_no);
	
	public String comuApp3(String comu_info_comu_code);
	public String comuApp4(String emp_no);
	// 글쓰기
	public void comuInfoInsert(Comu comu);
	
	 //void add(Comu comu, MultipartFile insert) throws IllegalStateException,IOException;
	  
	// ResponseEntity<ByteArrayResource> download(String no) throws UnsupportedEncodingException, IOException;
	 
	}
