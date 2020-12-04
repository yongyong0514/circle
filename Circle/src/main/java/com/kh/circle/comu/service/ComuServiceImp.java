package com.kh.circle.comu.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.kh.circle.comu.entity.Comu;
import com.kh.circle.comu.repository.ComuDao;

@Service
public class ComuServiceImp implements ComuService {
	
	@Autowired
	public ComuDao dao;
	
	@Override
	public List<Comu> comuList(int start,int end) throws Exception{
		
		return dao.comuList(start,end);
	}
	/*
	 * @Override public ResponseEntity<ByteArrayResource> download(String no) throws
	 * UnsupportedEncodingException, IOException { // TODO Auto-generated method
	 * stub return null;
	 */

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
	
	//수정화면 들어가기
	@Override 
	public List<Comu> comuCheck(String emp_info_name) {
		
		return dao.comuCheck(emp_info_name);
	}
	@Override
	public void comuUpdate(Comu comu) {
		
		dao.comuUpdate(comu);
	}

	
	}


