package com.kh.circle.comu.repository;

import java.util.List;

import com.kh.circle.comu.entity.Comu;
import com.kh.circle.comu.entity.ComuList;
import com.kh.circle.login.entity.EmpInfo;

public interface ComuDao {
	
	//글 목록
	public List<Comu> comuList(int start,int end)throws Exception;
	//글 갯수(페이징)
	public int comuListarticle()throws Exception;
	//글쓰기(X)
	public void comuAdd(Comu vo)throws Exception;
	//글쓰기 사원번호 가져오기
	public String comuAdd2(String emp_no);
	public String comuAdd3(String emp_info_emp_no);
	//글쓰기
	public void comuInsert(Comu comu);
	
	//동호회 별 글 목록
	public List<Comu> comuListPost(String comu_list_code);
	//가입신청서 리스트
	public List<Comu> comuAppList();
	
	//글읽기
	public List<Comu> comuDetail(String comu_post_ordr) ;
	//가입신청서 읽기
	public List<Comu> appDetail(String comu_post_ordr);
	//조회수
	void CountView(String comu_post_ordr);
	//수정하기로 들어가기
//	List<Comu> comuCheck(String comu_post_ordr);
	
	//수정하기
	void comuUpdate(Comu comu);
	
	Comu comuCheck(String comu_post_ordr);
	
	//삭제
	void comuDelete(String comu_post_ordr);
	//신청서 삭제
	void appDelete(String comu_post_ordr);
	
	//동호회 리스트 가져오기
	public List<ComuList> comuListName(String comu_list_code);
	//가입신청서에 동호회 이름 가져오기
	public List<ComuList> comuApp(String comu_list_code);
	//가입신청서 사원번호 가져오기
	public String comuApp2(String emp_no);
	//신청서 넣기
	public void comuAppAction(Comu comu);
	
	//leftbar 가입 동호회 리스트 가져오기
	public List<EmpInfo> leftList(String emp_info_emp_no);
	
	//디테일에 정보가져오기(완료)
	String comuEmpNo(String emp_no);
	String viewEmpNo(String comu_post_ordr);
	
	//리스트에 comu_info_emp_no 가져오기
	String comuInfoNo(String comu_info_emp_no);
	
	
	//가입신청서 받아주기
	
		public String comuApp3(String comu_info_comu_code);
		public String comuApp4(String emp_no);
		//글쓰기
		public void comuInfoInsert(Comu comu);
	
}
