package com.kh.circle.post.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostPaging;

@Repository
public class PostDaoImp implements PostDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Post> getListWithPaging(PostPaging paging) {
		return null;
	}

	
	
	
	
}
