package com.kh.circle.post.repository;

import java.util.List;

import org.springframework.ui.Model;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostFile;
import com.kh.circle.post.entity.PostPaging;
import com.kh.circle.post.service.PostService;

public interface PostDao {

	// select
	List<Post> postMain(Model model);

	List<Post> postParts(String post_type);

	int countPost();

	List<Post> selectPost(PostPaging postPaging);

	// insert

	List<Post> insertType();

	String postEmpInfo(String emp_no);

	void postInsert(Post post);
	
	//상세보기

	List<Post> viewDetail(String post_code);

	void CountDetail(String post_code);

	//수정하기
	void postUpdate(Post post);

	Post postCheck(String post_code);
	
//삭제하기
	
	void postDelete(String post_code);
}
