package com.kh.circle.comu.repository;

import java.util.List;

import com.kh.circle.comu.entity.Comu;

public interface ComuDao {
	
	public List<Comu> comuList(int start,int end)throws Exception;
	
	public int comuListarticle()throws Exception;
	
	public void comuAdd(Comu vo)throws Exception;


	
}
