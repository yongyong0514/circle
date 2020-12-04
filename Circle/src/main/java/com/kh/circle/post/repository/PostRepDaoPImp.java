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
	public List<PostReply> replyList(Model model) {
		List<PostReply> list  = sqlSession.selectList("postReplyList");
		model.addAttribute("postReplyList", list);
		return list;
	}

	@Override
	public String replyInsert(PostReply postReply) {
		
		return null;
	}

	@Override
	public String replyUpdate(PostReply postReply) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String replyDelete(String post_repl_code) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void postInsert(PostReply postReply) {
		// TODO Auto-generated method stub
		
	}

}
