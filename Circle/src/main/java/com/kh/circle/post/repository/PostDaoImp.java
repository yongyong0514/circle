package com.kh.circle.post.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.post.entity.Post;

@Repository
public class PostDaoImp implements PostDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public String add(Post post) {

		String no = sqlSession.selectOne("post.seq");
		post.setPost_code(no);
		sqlSession.insert("post.add", post);
		
		
		return no;
	}
	
	
	
}
