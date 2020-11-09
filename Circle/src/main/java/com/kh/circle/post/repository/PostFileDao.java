package com.kh.circle.post.repository;

import com.kh.circle.post.entity.PostFile;

public interface PostFileDao {

	String add(PostFile postFile);

	PostFile find(String no);

}
