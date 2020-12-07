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

import com.kh.circle.empInfo.entity.EmpInfoAll;
import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostPaging;
import com.kh.circle.post.entity.PostSearch;
import com.kh.circle.post.service.PostService;

@Repository
public class PostDaoImp implements PostDao {

	@Autowired
	private SqlSession sqlSession;

	int noOfRecords;

// postMain page 진입 : 전체 게시판 : 공지 + 전사
	@Override
	public List<Post> postMain(Model model, PostPaging postPaging) {

		List<Post> postMain = sqlSession.selectList("post.postMain", postPaging);
		model.addAttribute("postMain", postMain);

		return postMain;
	}

//post  종류별 게시판 list
	@Override
	public List<Post> postParts(String post_type) {

		List<Post> postParts = sqlSession.selectList("post.postParts", post_type);

		return postParts;
	}

	@Override
	public int countPost() {

		int num = sqlSession.selectOne("post.postCount");
		return num;
	}

	@Override
	public List<Post> selectPost(PostPaging postPaging) {

		List<Post> paging = sqlSession.selectList("post.postSelect", postPaging);

		return paging;
	}
	
	@Override
	public List<Post> selectPost2(PostPaging postPaging) {
		
		List<Post> paging2 = sqlSession.selectList("post.postSelect2", postPaging);

		return paging2;
	}

	// 작성하기
	@Override
	public List<Post> insertType() {

		List<Post> post_type = sqlSession.selectList("post.postType");
		return post_type;
	}

	@Override
	public String postEmpInfo(String emp_no) {

		String emp_name = sqlSession.selectOne("post.empInfo", emp_no);

		return emp_name;
	}

	@Override
	public void postInsert(Post post) {

		sqlSession.insert("post.postInsert", post);

	}

	// 상세보기

	@Override
	public List<Post> viewDetail(String post_code) {

		List<Post> post = sqlSession.selectList("post.postView", post_code);

		return post;
	}

	@Override
	public void CountDetail(String post_code) {

		sqlSession.update("CountDetail", post_code);

	}
	// 수정하기

	@Override
	public void postUpdate(Post post) {

		sqlSession.update("postUpdate", post);

	}

	@Override
	public Post postCheck(String post_code) {

		Post post = sqlSession.selectOne("post.postCheck", post_code);

		return post;
	}

	// 삭제하기
	@Override
	public void postDelete(String post_code) {

		sqlSession.delete("post.postDelete2", post_code);
		sqlSession.delete("post.postDelete", post_code);
	}

	
	//검색하기
	
	
	
	@Override
	public List<Post> postSearch(PostPaging postSearch) {

		List<Post> list = sqlSession.selectList("post.getSearch", postSearch);		
	
		System.out.println("dao  list : : " + list);
		return list;
	}

	@Override
	public int countPostSearch(PostPaging postSearch) {
		int num = sqlSession.selectOne("post.countSearch", postSearch);
		
		System.out.println("dao postSearch: : " + postSearch);
		
		System.out.println("dao in : : " + num);
		return num;
	}



}