package com.kh.circle.post.repository;

import java.io.File;
import java.io.IOException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.circle.post.entity.PostFile;

@Repository
public class PostFileDaoImp implements PostFileDao {

	@Autowired
	private SqlSession sqlession;

	@Autowired
	private PostFileDao postFileDao;

	private final String path = "C:/upload/post";

	@Override
	public String insert(PostFile fileInsert) {
		// TODO Auto-generated method stub
		return null;
	}



}
