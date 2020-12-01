package com.kh.circle.post.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.service.PostService;

@Repository
public class PostDaoImp implements PostDao {

	@Autowired
	private SqlSession sqlSession;

	int noOfRecords;

// postMain page 진입 : 전체 게시판 : 공지 + 전사
	@Override
	public List<Post> postMain(Model model) {

		System.out.println("post dao : " + model);

		List<Post> postMain = sqlSession.selectList("postMain");
		model.addAttribute("postMain", postMain);

		System.out.println("last dao : " + model);
		return postMain;
	}

//post  종류별 게시판 list
	@Override
	public List<Post> postParts(String post_type) {

		
		System.out.println("dao : " + post_type);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("post_type", post_type);
		
		List<Post> postParts = sqlSession.selectList("post.postParts", map);

		System.out.println(" doa : " + postParts);
		

		System.out.println("last dao : " + post_type);
		return postParts;
	}

	@Override
	public List<Post> postTest2(Post post) {
		// TODO Auto-generated method stub

		System.out.println("dao 2 : " + post);
		
		return sqlSession.selectList("postTypeList2", post);
	}

	/*
	 * 페이징처리
	 * 
	 * @Override public int getNoOfRecords() {
	 * 
	 * 
	 * 
	 * return noOfRecords; }
	 * 
	 * @Override public List<Post> getPostList(int offset, int recordsPerPage) {
	 * 
	 * List<Post> postList = new ArrayList<Post>();
	 * 
	 * HashMap<String, Object> params = new HashMap<String, Object>();
	 * 
	 * params.put("offset", offset); params.put("noOfRecords", noOfRecords);
	 * 
	 * try { postList = sqlSession.selectList("postDao.selectPost", params);
	 * this.noOfRecords = sqlSession.selectOne("postDao.postCount");
	 * 
	 * } finally { sqlSession.close(); }
	 * 
	 * return postList; }
	 * 
	 * @Override public PostDao getInstance() { // TODO Auto-generated method stub
	 * return null; }
	 * 
	 */

	@Override
	public List<Post> postTest(Post post, String type) {

		System.out.println("post dao" + post);
		System.out.println("post type" + type);

		List<Post> list = sqlSession.selectList("postTypeList", post);

		return list;
	}

}