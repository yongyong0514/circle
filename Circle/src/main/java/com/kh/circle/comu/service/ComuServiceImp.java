package com.kh.circle.comu.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.kh.circle.comu.entity.Comu;
import com.kh.circle.comu.entity.ComuList;
import com.kh.circle.comu.repository.ComuDao;
import com.kh.circle.login.entity.EmpInfo;

@Service
public class ComuServiceImp implements ComuService {
	
	@Autowired
	public ComuDao dao;
	
	//게시글 목록
	@Override
	public List<Comu> comuList(int start,int end) throws Exception{
		
		return dao.comuList(start,end);
	}
	
	//동호회 별 게시글 목록
	@Override
	public List<Comu> comuListPost(String comu_list_code) {
		
		
		return dao.comuListPost(comu_list_code);
	}
	@Override
	public List<Comu> comuAppList() {
		
		
		return dao.comuAppList();
	}


	@Override
	public int comuListarticle() throws Exception {
		// TODO Auto-generated method stub
		return dao.comuListarticle();
	}

	@Override
	public void comuAdd(Comu vo) throws Exception {
		// TODO Auto-generated method stub
		dao.comuAdd(vo);
	}
	
	//사원번호 가져오기
	@Override
	public String comuAdd2(String emp_no) {
		String emp_name = dao.comuAdd2(emp_no);

		return emp_name;
	}
	@Override
	public String comuAdd3(String emp_info_emp_no) {
		String emp_name = dao.comuAdd3(emp_info_emp_no);

		return emp_name;
	}
	
	//게시글 작성
	@Override
	public void comuInsert(Comu comu) {
		
		System.out.println("service : " + comu);
		
		dao.comuInsert(comu);
	}

	//상세조회
	@Override
	public List<Comu> comuDetail(String comu_post_ordr) {

		dao.CountView(comu_post_ordr);
	
		 
		return dao.comuDetail(comu_post_ordr);
	}
	@Override
	public List<Comu> appDetail(String comu_post_ordr){
		return dao.appDetail(comu_post_ordr);
	}
	
	
	//수정화면
	@Override 
	public Comu comuCheck(String comu_post_ordr) {
		
		return dao.comuCheck(comu_post_ordr);
	}

	@Override
	public void comuUpdate(Comu comu) {
		
		dao.comuUpdate(comu);
	}
	
	//삭제하기
	@Override
	public void comuDelete(String comu_post_ordr) {
		dao.comuDelete(comu_post_ordr);
	}
	//가입 신청서 삭제하기
	@Override
	public void appDelete(String comu_post_ordr) {
		dao.appDelete(comu_post_ordr);
	}
	//동호회 리스트 가져오기
	@Override
	public List<ComuList> comuListName(String comu_list_code) {
		

		return dao.comuListName(comu_list_code);
	}

	@Override
	public List<ComuList> comuApp(String comu_list_code) {
	
		
		return dao.comuApp(comu_list_code);
	}
	//사원번호 가져오기
		@Override
		public String comuApp2(String emp_no) {
			String emp_name = dao.comuApp2(emp_no);

			return emp_name;
		}
	//가입신청서 작성하기
		@Override
		public void comuAppAction(Comu comu) {
			
			dao.comuAppAction(comu);
			
		}
		
	//leftBar 리스트 가져오기
	@Override
	public List<EmpInfo> leftList(String emp_info_emp_no) {
		
		System.out.println("서비스인데 레프트 바 가져왔냐" +emp_info_emp_no);
		return dao.leftList(emp_info_emp_no);
	}

		//사원번호 가져오기
	@Override
	public String comuEmpNo(String emp_no) {
	
		return dao.comuEmpNo(emp_no);
	}

	@Override
	public String viewEmpNo(String comu_post_ordr) {
		
		return dao.viewEmpNo(comu_post_ordr);
	}

	@Override
	public String comuInfoNo(String comu_info_emp_no) {
		// TODO Auto-generated method stub
		return dao.comuInfoNo(comu_info_emp_no);
	}
	
	
	//동호회 가입시키기
	@Override
	public String comuApp3(String comu_info_comu_code) {


		return dao.comuApp3(comu_info_comu_code);
	}

	@Override
	public void comuInfoInsert(Comu comu) {
		dao.comuInfoInsert(comu);
	}

	@Override
	public String comuApp4(String emp_no) {
		
		return dao.comuApp4(emp_no);
	}	

	
	}


