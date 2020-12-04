package com.kh.circle.post.service;

import java.util.List;

import org.springframework.ui.Model;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostReply;

public interface PostRepService {

	String replyInsert(PostReply postReply);

	List<PostReply> replyList(Model model);

	String replyUpdate(PostReply postReply);

	String replyDelete(String post_repl_code);


}
