package com.kh.circle.comu.repository;

import java.util.List;

import com.kh.circle.comu.entity.Comu;
import com.kh.circle.comu.entity.ComuList;

public interface ComuDao {
	
	//글 목록
	public List<Comu> comuList(int start,int end)throws Exception;
	//글 갯수(페이징)
	public int comuListarticle()throws Exception;
	//글쓰기(X)
	public void comuAdd(Comu vo)throws Exception;
	//글쓰기 사원번호 가져오기
	public String comuAdd2(String emp_no);
	//글쓰기
	public void comuInsert(Comu comu);
	
	
	
	
	//글읽기
	public List<Comu> comuDetail(String comu_post_ordr) ;
	//조회수
	void CountView(String comu_post_ordr);
	//수정하기로 들어가기
//	List<Comu> comuCheck(String comu_post_ordr);
	
	//수정하기
	void comuUpdate(Comu comu);
	
	Comu comuCheck(String comu_post_ordr);
	
	//삭제
	void comuDelete(String comu_post_ordr);
	
	//동호회 리스트 가져오기
	public List<ComuList> comuListName(String comu_list_code);
	//가입신청서에 동호회 이름 가져오기
	public String comuApp(String comu_list_code);
	
	//leftbar 가입 동호회 리스트 가져오기
	public List<ComuList> leftList(String comu_info_emp_no);
	
}
