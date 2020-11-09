package com.kh.circle.post.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.circle.post.entity.PostFile;

public class PostFileDaoImp implements PostFileDao{

	@Autowired
	private SqlSession sqlession;
	
	@Override
	public String add(PostFile postFile) {

		String file_no = sqlession.selectOne("post_file.seq");
		postFile.setFile_code(file_no);
		sqlession.insert("post_file.add", postFile);
		
		
		return file_no;
	}




	@Override
	public PostFile find(String no) {
		return sqlession.selectOne("post_file.find", no);
	}

}
