package com.kh.circle.post.service;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostFile;
import com.kh.circle.post.entity.PostFile.PostFileBuilder;
import com.kh.circle.post.entity.PostPaging;
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
	
	
	




	@Override
	public ResponseEntity<ByteArrayResource> download(String no) throws IOException {
		PostFile postFile = postFileDao.find(no);
		
		
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
		
		
		return entity;
	}







	@Override
	public List<Post> getList(PostPaging paging) {

		
		
		return postDao.getListWithPaging(paging);
	}



	
	}
