package com.kh.circle.post.repository;

import java.util.List;

import org.springframework.ui.Model;

import com.kh.circle.post.entity.PostReply;

public interface PostRepDao {

	void replyInsert(PostReply postReply);

	List<PostReply> replyList(String post_code);

	int countRep(PostReply post_code);


}
