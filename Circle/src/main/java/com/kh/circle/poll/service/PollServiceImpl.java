package com.kh.circle.poll.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.circle.poll.repository.PollDao;

@Service
public class PollServiceImpl implements PollService{
	
	@Autowired
	private PollDao pollDao;
	
	@Override
	public List<HashMap<String, String>> homeList(String emp_no) {
		
		List<HashMap<String, String>> list = pollDao.homeList(emp_no);
		
		return list;
	}

}
