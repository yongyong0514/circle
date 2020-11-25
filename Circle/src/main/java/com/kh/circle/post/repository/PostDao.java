package com.kh.circle.post.repository;

import java.util.List;

import org.springframework.ui.Model;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostPaging;
import com.kh.circle.post.service.PostService;

public interface PostDao {


	int getNoOfRecords();

	List<Post> getPostList(int offset, int recordsPerPage);

	PostDao getInstance();

	



	

	
}
