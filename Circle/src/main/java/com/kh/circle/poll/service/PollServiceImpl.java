package com.kh.circle.poll.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.circle.poll.entity.Pagination;
import com.kh.circle.poll.repository.PollDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PollServiceImpl implements PollService{
	
	@Autowired
	private PollDao pollDao;
	
	@Override
	public List<HashMap<String, String>> homeList(String empNo) {
		List<HashMap<String, String>> list = pollDao.homeList(empNo);
		return list;
	}

	@Override
	public List<HashMap<String, String>> getResult(HashMap<String, String> params) {
		List<HashMap<String, String>> list = pollDao.getResult(params);
		return list;
	}

	@Override
	public List<HashMap<String, String>> progressList(Pagination pageInfo) {

		List<HashMap<String, String>> list = pollDao.progressList(pageInfo);
		
		return list;
	}

	@Override
	public int countTotalProgressPost(Pagination totalPageInfo) {
		int total = pollDao.countTotalProgressPost(totalPageInfo);
		return total;
	}
	

}
