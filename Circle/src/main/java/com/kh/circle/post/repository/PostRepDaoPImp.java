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

//update
	@Override
	public void replyUpdate(Post post) {
		sqlSession.update("postReply.replyUpdate", post);
	}

//delete
	@Override
	public void replyDelte(Post post) {

		sqlSession.delete("postReply.replyDelete", post);
		
	}

//select
	@Override
	public Post replySelect(String post_repl_code) {

		
		return sqlSession.selectOne("postReply.replySelect", post_repl_code);
	}

}
