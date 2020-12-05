package com.kh.circle.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.circle.post.entity.PostReply;
import com.kh.circle.post.repository.PostRepDao;

@Service
public class PostRepServiceImp implements PostRepService{

	
	@Autowired
	PostRepDao repDao;
	
	@Override
	public void replyInsert(PostReply postReply) {
		 repDao.replyInsert(postReply);
	}

	@Override
	public List<PostReply> replyList(String post_code) {
		return repDao.replyList(post_code);
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
	public int countRep(PostReply post_code) {
		return repDao.countRep(post_code);
	}


	
}
