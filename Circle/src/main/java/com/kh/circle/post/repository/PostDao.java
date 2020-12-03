package com.kh.circle.post.repository;

import java.util.List;

import org.springframework.ui.Model;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostFile;
import com.kh.circle.post.entity.PostPaging;
import com.kh.circle.post.service.PostService;

public interface PostDao {



	List<Post> postMain(Model model);

	List<Post> postParts(String post_type);

	int countPost();

	List<Post> selectPost(PostPaging postPaging);

	Post postView(String post_code);

	String postInsert(Post post);

	List<Post> insertType();

	String insertEmpInfo(String emp_info_emp_no);

}
