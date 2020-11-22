package com.kh.circle.post.repository;

import java.util.List;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostPaging;

public interface PostDao {

	List<Post> getListWithPaging(PostPaging paging);


	
}
