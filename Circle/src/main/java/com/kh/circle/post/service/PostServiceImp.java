package com.kh.circle.post.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

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
import com.kh.circle.post.entity.PostPaging;
import com.kh.circle.post.repository.PostDao;
import com.kh.circle.post.repository.PostFileDao;
import com.kh.circle.post.repository.PostSaveDao;

@Service
public class PostServiceImp implements PostService {

	@Autowired
	private PostDao postDao;

	@Autowired
	private PostFileDao postFileDao;

	@Autowired
	private PostSaveDao postSaveDao;

	@Autowired
	private SqlSession sqlSession;

	// 게시글 리스트
	@Override
	public List<Post> postMain(Model model) {

		return postDao.postMain(model);
	}

	@Override
	public List<Post> postParts(String post_type) {

		return postDao.postParts(post_type);
	}

	@Override
	public int countPost() {
		return postDao.countPost();
	}

	@Override
	public List<Post> selecePost(PostPaging postPaging) {

		return postDao.selectPost(postPaging);
	}

	// 입력하기
	@Override
	public List<Post> insertType() {
		return postDao.insertType();
	}

	@Override
	public String postEmpInfo(String emp_no) {

		String emp_name = postDao.postEmpInfo(emp_no);

		return emp_name;
	}

	@Override
	public void postInsert(Post post) {

		postDao.postInsert(post);

	}
	
	//상세보기

	@Override
	public List<Post> viewDetail(String post_code) {

		postDao.CountDetail(post_code);

		return postDao.viewDetail(post_code);
	}

	//수정하기
	@Override
	public void postUpdate(Post post) {

		
		System.out.println("seeeeeeeee ; "+ post);
		postDao.postUpdate(post);
	}

	@Override
	public List<Post> postCheck(String post_code) {

		return postDao.postCheck(post_code);
	}
	

}
