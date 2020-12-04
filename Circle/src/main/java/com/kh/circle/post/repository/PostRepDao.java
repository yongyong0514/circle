package com.kh.circle.post.repository;

import java.util.List;

import org.springframework.ui.Model;

import com.kh.circle.post.entity.PostReply;

public interface PostRepDao {

	void postInsert(PostReply postReply);

	List<PostReply> replyList(Model model);

	String replyInsert(PostReply postReply);

	String replyUpdate(PostReply postReply);

	String replyDelete(String post_repl_code);

}
