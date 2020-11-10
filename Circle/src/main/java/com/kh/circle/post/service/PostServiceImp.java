package com.kh.circle.post.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostFile;
import com.kh.circle.post.entity.PostFile.PostFileBuilder;
import com.kh.circle.post.repository.PostDao;
import com.kh.circle.post.repository.PostFileDao;
import com.kh.circle.post.repository.PostSaveDao;

/*
@Service
public class PostServiceImp implements PostService{

	@Autowired
	private PostDao postDao;
	
	@Autowired
	private PostFileDao postFileDao;
	
	@Autowired
	private PostSaveDao postSaveDao;
	
	
	
	@Transactional
	@Override
	public void add(Post post, MultipartFile insert) throws IllegalStateException, IOException {

		String no = postDao.add(post);
		
		if(!insert.isEmpty()) {
			
			PostFile postFile = PostFile.builder()
					.file_oname(insert.getOriginalFilename())
					.file_type(insert.getContentType())
					.file_size(insert.getSize())
					.build();
			
			String file_no = postFileDao.add(postFile);
			
			postSaveDao.save(insert, file_no);
		}
	}




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
	}}
*/