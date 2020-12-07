package com.kh.circle.post.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostReply;

@Repository
public class PostRepDaoPImp implements PostRepDao {

	@Autowired
	SqlSession sqlSession;

	// list
	@Override
	public List<Post> replyList(String post_code) {
		return sqlSession.selectList("postReply.replyList", post_code);
	}

//insert
	@Override
	public void replyInsert(Post post) {


		sqlSession.insert("postReply.replyInsert", post);
	}



	@Override
	public void replyDelte(String post_repl_code) {
		sqlSession.delete("postReply.replyDelete", post_repl_code);		
	}

	@Override
	public List<Post> replyEmp(String post_code) {

		
		return sqlSession.selectList("postReply.replyEmp" , post_code);
	}

}
