package com.kh.circle.poll.repository;

import java.util.HashMap;
import java.util.List;

import com.kh.circle.poll.entity.Pagination;

public interface PollDao {

	List<HashMap<String, String>> homeList(String empNo);
	
	List<HashMap<String, String>> getResult(HashMap<String, String> params);
	
	int countTotalProgressPost(Pagination prePageInfo);
	List<HashMap<String, String>> progressList(Pagination pageInfo);
	
	int countTotalFinishedPost(Pagination prePageInfo);
	List<HashMap<String, String>> finishedList(Pagination pageInfo);
	
	int countTotalMyPost(Pagination prePageInfo);
	List<HashMap<String, String>> myList(Pagination pageInfo);


}
