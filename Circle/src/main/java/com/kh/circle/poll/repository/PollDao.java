package com.kh.circle.poll.repository;

import java.util.HashMap;
import java.util.List;

public interface PollDao {

	List<HashMap<String, String>> homeList(String emp_no);

}
