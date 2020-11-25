package com.kh.circle.post.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostPaging;
import com.kh.circle.post.service.PostService;

@Repository
public class PostDaoImp implements PostDao{

	@Autowired
	private SqlSession sqlSession;
	
	int noOfRecords;
	
	


	@Override
	public int getNoOfRecords() {

		
		
		return noOfRecords;
	}

	@Override
	public List<Post> getPostList(int offset, int recordsPerPage) {

		List<Post> postList = new ArrayList<Post>();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		
		try {
			postList = sqlSession.selectList("postDao.selectPost", params);
			this.noOfRecords = sqlSession.selectOne("postDao.postCount");
			
		} finally {
			sqlSession.close();
		}
		
		return postList;
	}

	@Override
	public PostDao getInstance() {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	
	
	
}
