package com.kh.circle.post.repository;

import java.util.List;

import org.springframework.ui.Model;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostPaging;
import com.kh.circle.post.entity.PostSearch;
import com.kh.circle.post.service.PostService;

public interface PostDao {

	// select
	List<Post> postMain(Model model, PostPaging postPaging);

	List<Post> postParts(String post_type);

	int countPost();

	List<Post> selectPost(PostPaging postPaging);
	List<Post> selectPost2(PostPaging postPaging);

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

	List<Post> postSearch(PostPaging postSearch);

	int countPostSearch(PostPaging postSearch);

	String postEmpNo(String emp_no);

	String viewEmpNo(String post_code);



	
}
