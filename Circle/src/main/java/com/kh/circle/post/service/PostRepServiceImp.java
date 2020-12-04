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
	public List<PostReply> replyList(Model model) {
		
		
		return repDao.replyList(model);
	}

	
	@Override
	public String replyInsert(PostReply postReply) {
		return repDao.replyInsert(postReply);
	}

	@Override
	public String replyUpdate(PostReply postReply) {
		return repDao.replyUpdate(postReply);
	}

	@Override
	public String replyDelete(String post_repl_code) {
		return repDao.replyDelete(post_repl_code);
	}

	
}
