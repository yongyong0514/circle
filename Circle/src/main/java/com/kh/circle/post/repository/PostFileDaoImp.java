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
	public String insert(PostFile postFile) {

String file_code = sqlession.selectOne("pofi_seq");
		
		postFile.setFile_code(file_code);
		sqlession.insert("postFile.fileInsert", postFile);
		
		return file_code;
	}

}
