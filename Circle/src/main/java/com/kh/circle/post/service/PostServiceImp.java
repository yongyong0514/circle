package com.kh.circle.post.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostFile;
import com.kh.circle.post.entity.PostFile.PostFileBuilder;
import com.kh.circle.post.repository.PostDao;
import com.kh.circle.post.repository.PostFileDao;
import com.kh.circle.post.repository.PostSaveDao;


@Service
public class PostServiceImp implements PostService{

	@Autowired
	private PostDao postDao;
	
	@Autowired
	private PostFileDao postFileDao;
	
	@Autowired
	private PostSaveDao postSaveDao;
	
	
	@Autowired
	private SqlSession sqlSession;




	/*end*/

	@Override
	public ResponseEntity<ByteArrayResource> download(String no) throws IOException {
	/*	PostFile postFile = postFileDao.find(no);
		
		
		if(postFile == null) {
			return ResponseEntity.notFound().build();
		}
		
		byte[] data = postSaveDao.load(postFile.getFile_code());
		
		ByteArrayResource resource = new ByteArrayResource(data);
		
		ResponseEntity<ByteArrayResource> entity =
				ResponseEntity.ok()
									.header("Content-Length", String.valueOf(postFile.getFile_size()))
									.header("Content-Type", "application/octet-stream; charset=UTF-8")
									.header("Content-Disposition", "attachment; filename=\""+URLEncoder.encode(postFile.getFile_cname(), "UTF-8"+ "\""))
									.body(resource);
		*/
		
		return null;
	}





		@Override
		public List<Post> postTest2(Post post) {
			// TODO Auto-generated method stub
			
			System.out.println("service : " + post);
			return postDao.postTest2(post);
		}




		@Override
		public List<Post> postTest1(Post post) {

			return 			postDao.postTest(post);

		}





	














/*
	@Override
	public int insertPost(Post post) {

		
		
		return postDao.insertPost(post);
	}
*/









/* 페이징 처리
	@Override
	public List<Post> getPostList(int offset, int recordsPerPage) {
		// TODO Auto-generated method stub
		return null;
	}





	@Override
	public int getNoOfRecords() {
		// TODO Auto-generated method stub
		return 0;
	}





	public PostService getInstance() {
		// TODO Auto-generated method stub
		return null;
	}


*/






	
	}
