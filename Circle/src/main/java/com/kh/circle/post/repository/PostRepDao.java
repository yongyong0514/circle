package com.kh.circle.post.repository;

import java.util.List;

import org.springframework.ui.Model;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostReply;

public interface PostRepDao {

	//list
	List<Post> replyList(String post_code);

	//insert
	void replyInsert(Post post);


	//delete
	void replyDelte(String post_repl_code);

	List<Post> replyEmp(String post_code);


}
