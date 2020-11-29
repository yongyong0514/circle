package com.kh.circle.comu.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;


import com.kh.circle.comu.entity.Comu;


public interface ComuService {
	
	public List<Comu> comuList(int start,int end)throws Exception;

	public int comuListarticle()throws Exception;
	
	public void comuAdd(Comu vo)throws Exception;

	
	 //void add(Comu comu, MultipartFile insert) throws IllegalStateException,IOException;
	  
	// ResponseEntity<ByteArrayResource> download(String no) throws UnsupportedEncodingException, IOException;
	 
	}
