package com.kh.circle.comu.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.comu.entity.Comu;
import com.kh.circle.comu.entity.ComuList;

@Repository
public class ComuDaoImp implements ComuDao {
	@Autowired
	private SqlSession sqlSession;
	
	//기능구현 주석
	 @Override 
	 public List<Comu> comuList(int start,int end) throws Exception{
		 
		 Map<String,Object> map = new HashMap<String,Object>();
		 
		 //페이징 처리 스타트와 엔드
		 map.put("start", start);
		 map.put("end", end);
		 
		 return sqlSession.selectList("comu.comuList",map); 
		 }

	@Override
	public int comuListarticle() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("comu.comuListarticle");
	}

	@Override
	public void comuAdd(Comu vo) throws Exception {
		sqlSession.insert("comu.comuAdd",vo);
		
	}
	
	//사원번호 가져오기
	@Override
	public String comuAdd2(String emp_no) {
											/* 매퍼 네임스페이스.id */
		String emp_name = sqlSession.selectOne("comu.add2",emp_no);
		
		return emp_name;
	}
	
	//게시글 작성
	@Override
	public void comuInsert(Comu comu) {
		
		System.out.println("dao : " + comu);
		sqlSession.insert("comu.insert",comu);
		
	}
	//상세조회
	@Override
	public List<Comu> comuDetail(String comu_post_ordr) {

		return sqlSession.selectList("comu.comuDetail",comu_post_ordr);
	}
	//조회수
	@Override
	public void CountView(String comu_post_ordr) {
		sqlSession.update("comu.CountView",comu_post_ordr);
		
	}
	
	//수정하기
	@Override
	public void comuUpdate(Comu comu) {
		
		sqlSession.update("comuUpdate",comu);
	}
	
	@Override
	public Comu comuCheck(String comu_post_ordr) {
		
		Comu comu = sqlSession.selectOne("comu.comuCheck",comu_post_ordr);
		
		return comu;
	}
	//삭제하기
	@Override
	public void comuDelete(String comu_post_ordr) {
		
		
		sqlSession.delete("comu.comuDelete",comu_post_ordr);
	}
	
	//동호회 리스트 가져오기
	@Override
	public List<ComuList> comuListName(String comu_list_code) {

		List<ComuList> comuListName = sqlSession.selectList("comu.comuListName",comu_list_code);
		
		return comuListName;
	}
	//가입신청서에 동호회 이름 가져오기
	@Override
	public String comuApp(String comu_list_code) {
		String list_name = sqlSession.selectOne("comu.comuApp",comu_list_code);
		
		return list_name;
	}
	
	
	//leftBar 리스트 가져오기
	@Override
	public List<ComuList> leftList(String comu_info_emp_no) {
		
		//List<ComuList> leftList =sqlSession.selectList("comu.leftList",comu_list_code);
		
		
		return sqlSession.selectList("comu.leftList",comu_info_emp_no);
		
	}



}
