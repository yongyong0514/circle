package com.kh.circle.post.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostReply;


@Repository
public class PostRepDaoPImp implements PostRepDao{

	@Autowired
	SqlSession sqlSession;

	@Override
	public void replyInsert(PostReply postReply) {
		sqlSession.insert("Postreply.insertreply", postReply);
	}

	@Override
	public List<PostReply> replyList(String post_code) {
		return sqlSession.selectList("Postreply.listReply", post_code);
	}

	@Override
	public int countRep(PostReply post_code) {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
