package com.kh.circle.project.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostPaging;
import com.kh.circle.post.repository.PostDao;
import com.kh.circle.project.entity.ProjFile;
import com.kh.circle.project.entity.ProjPaging;
import com.kh.circle.project.entity.Project;
import com.kh.circle.project.repository.ProjFileDao;
import com.kh.circle.project.repository.ProjSaveDao;
import com.kh.circle.project.repository.ProjectDao;



@Service
public class ProjectServiceImp implements ProjectService{

	@Autowired
	private ProjectDao projDao;
	
	@Autowired
	private ProjFileDao projFileDao;
	
	@Autowired
	private ProjSaveDao projSaveDao;
	
	@Autowired
	private PostDao postDao;

	@Override
	public List<Project> projIssMain(String pro_code) {
		return projDao.projIssMain(pro_code);
	}


	@Override
	public int countPost() {
		return projDao.countProj();
	}


	@Override
	public String projEmpNo(String emp_no) {
		return projDao.projEmpNo(emp_no);
	}


	@Override
	public List<Project> projMain(String emp_no) {
		return projDao.projMain(emp_no);
	} 




	@Override
	public List<Project> projMember() {
		return projDao.projMember();
	}


	@Override
	public void projInsert(Project project, String emp_no) {

		projDao.projInsert(project, emp_no);
	}


	@Override
	public List<Project> issMember() {
		return projDao.issMember();
	}


	@Override
	public void projInsertIss(Project project,  MultipartFile iss_file) throws IllegalStateException, IOException {
		
		System.out.println(project);
		
		System.out.println("이 인근 어딘가");
		String pro_code = projDao.projGetPro(project);
		System.out.println("이 인근 어딘가2");
		
		System.out.println("test pro----" + pro_code);
		project.setPro_code(pro_code);
		String iss_code = projDao.projInsertIss(project);
		
		
		if(!iss_file.isEmpty()) {
			
			ProjFile projFile = ProjFile.builder()
									.files_oname(iss_file.getOriginalFilename())
									.files_cname(iss_file.getContentType())
									.files_size(iss_file.getSize())
									.files_code(iss_code)
									.build();
			
		
			String file_code = projFileDao.insert(projFile, iss_code, pro_code);
			
			//저장
			projSaveDao.save(iss_file, file_code);
			
			
		}
	}


	@Override
	public List<Project> issProg() {
		return projDao.issProg();
	}


	@Override
	public List<Project> issSitu() {
		return projDao.issSitu();
	}


	@Override
	public List<Project> selecetProject(ProjPaging projPaging) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Post> selecePost(PostPaging postPaging) {

		return postDao.selectPost(postPaging);
	}




	@Override
	public List<Project> projIssAll(String emp_no) {
		// TODO Auto-generated method stub
		return projDao.projIssAll(emp_no);
	}


	@Override
	public List<Project> projDetail(String pro_code) {
		return projDao.projDetail(pro_code);
	}


	@Override
	public List<Project> projDetail2(String pro_code) {
		// TODO Auto-generated method stub
		return projDao.projDetail2(pro_code);
	}


	@Override
	public List<Project> projMemberlist(String pro_code) {
		// TODO Auto-generated method stub
		return projDao.projMemberlist(pro_code);
	}


	@Override
	public ResponseEntity<ByteArrayResource> download(int iss_code) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Project> projDetail3(String iss_code) {
		// TODO Auto-generated method stub
		return projDao.projDetail3(iss_code);
	}









}
