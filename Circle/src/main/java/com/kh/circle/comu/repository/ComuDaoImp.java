package com.kh.circle.comu.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.circle.comu.entity.Comu;
import com.kh.circle.comu.entity.ComuList;
import com.kh.circle.login.entity.EmpInfo;

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
	 
	//동호회 별 리스트
		@Override
		public List<Comu> comuListPost(String comu_list_code) {
			
			System.out.println("controller 개별 리스트"+comu_list_code);
			return sqlSession.selectList("comu.comuListPost",comu_list_code);
			 }
		//가입신청서 별 리스트
		@Override
		public List<Comu> comuAppList() {
			
			System.out.println("controller 가입 신청서 리스트");
			return sqlSession.selectList("comu.comuAppList");
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
	@Override
	public String comuAdd3(String emp_info_emp_no) {
											/* 매퍼 네임스페이스.id */
		String emp_name = sqlSession.selectOne("comu.comuNameList",emp_info_emp_no);
		
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

		List<Comu> comu = sqlSession.selectList("comu.comuDetail",comu_post_ordr);

		return comu;
	}
	//가입신청서 상세조회
	@Override
	public List<Comu> appDetail(String comu_post_ordr){
		
		List<Comu> comu = sqlSession.selectList("comu.appDetail",comu_post_ordr);
		return comu;
	
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
	//삭제하기
	@Override
	public void appDelete(String comu_post_ordr) {
		sqlSession.delete("comu.appDelete",comu_post_ordr);
	}
	//동호회 리스트 가져오기
	@Override
	public List<ComuList> comuListName(String comu_list_code) {

		List<ComuList> comuListName = sqlSession.selectList("comu.comuListName",comu_list_code);
		
		return comuListName;
	}
	//가입신청서에 동호회 이름 가져오기
	@Override
	public List<ComuList> comuApp(String comu_list_code) {
		List<ComuList> list_name = sqlSession.selectList("comu.comuApp",comu_list_code);
		
		return list_name;
	}
	//사원번호 가져오기
		@Override
		public String comuApp2(String emp_no) {
												/* 매퍼 네임스페이스.id */
			String emp_name = sqlSession.selectOne("comu.app2",emp_no);
			
			return emp_name;
		}
	//신청서 넣기
	@Override
	public void comuAppAction(Comu comu) {

		sqlSession.insert("comu.comuAppAction",comu);
	}
	
	
	//leftBar 리스트 가져오기
	@Override
	public List<EmpInfo> leftList(String emp_info_emp_no) {
		
		//List<ComuList> leftList =sqlSession.selectList("comu.leftList",comu_list_code);
		
		System.out.println("dao 레프트 바 가져오냐 " + emp_info_emp_no);
		return sqlSession.selectList("comu.leftList",emp_info_emp_no);
		
	}
	
	
	//사원번호 가져오기
	@Override
	public String comuEmpNo(String emp_no) {
		String emp_info_no = sqlSession.selectOne("comu.empNo",emp_no);
		return emp_info_no;
	}

	@Override
	public String viewEmpNo(String comu_post_ordr) {
		String comu = sqlSession.selectOne("comu.viewEmpNo",comu_post_ordr);
		return comu;
	}

	@Override
	public String comuInfoNo(String comu_info_emp_no) {
		String comu_info_no = sqlSession.selectOne("comu.comuInfoNo"+comu_info_emp_no);
		return comu_info_no;
	}
	
	
	//동호회 회원 insert
	@Override
	public String comuApp3(String comu_post_list_code) {
		String emp_name = sqlSession.selectOne("comu.comuApp3",comu_post_list_code);
		return emp_name;
	}

	
	@Override
	public String comuApp4(String emp_no) {
		String emp_info_no = sqlSession.selectOne("comu.comuApp4",emp_no);
		return emp_info_no;
	}
	@Override
	public void comuInfoInsert(Comu comu) {
		sqlSession.insert("comu.comuInfoInsert",comu);
		
	}
	
	
	
	}




