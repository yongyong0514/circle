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

	@Override
	public String comuAdd2(String emp_no) {
		String emp_name = dao.comuAdd2(emp_no);

		
		return emp_name;
	}

	@Override
	public void comuInsert(Comu comu) {
		
		System.out.println("service : " + comu);
		
		dao.comuInsert(comu);
	}

	}


