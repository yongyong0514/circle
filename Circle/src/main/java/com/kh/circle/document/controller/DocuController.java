package com.kh.circle.document.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.circle.document.service.DocuService;
import com.kh.circle.document.vo.DocuList;
import com.kh.circle.document.vo.DocuWriteInsert;
import com.kh.circle.login.entity.EmpInfo;

@Controller
@RequestMapping("/document")
public class DocuController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private DocuService docuService;
	
	
//	Create Document
	@PostMapping("/docuWrite")
	public String docuWriteInsert(@ModelAttribute DocuWriteInsert docuWriteInsert) throws IllegalStateException, IOException{
		docuService.insert(docuWriteInsert);
		
		return "redirect:docuList";
		
	}
	

//	Create docuFiles
	@PostMapping("/docuFiles")
	public String upload(MultipartHttpServletRequest multipartRequest) {
		
		Iterator<String> itr = multipartRequest.getFileNames();
		
		 String filePath = "d:/resources/files/document";
	       
	       while (itr.hasNext()) { 
	           MultipartFile multipartFile = multipartRequest.getFile(itr.next());   
	    
	           String files_oname = multipartFile.getOriginalFilename();
	           
	           String extension = files_oname.substring(files_oname.lastIndexOf("."), files_oname.length());
	           
	           long files_size = multipartFile.getSize();
	           
	           String files_type = multipartFile.getContentType();
	           
	           String files_cname = UUID.randomUUID().toString() + extension;
	           
	           String files_route = filePath + "/" + files_cname;
	    
	           try {
	        	   multipartFile.transferTo(new File(files_route));

	        	   docuService.insertFile(files_oname, files_size, files_type, files_cname, files_route);
	        	   
	           } catch (Exception e) {
	               e.printStackTrace();
	           }
	      }
	       return "success";
	}
	
	
//	Result docuWrite
	@GetMapping("/docuWrite")
	public String docuWriteSelect() {
		
		return "document/docuWrite";
	}

	
//	Result docuList
	@GetMapping("/docuList")
	public String docuList(Model model, HttpSession session) {
		
		if(null != session.getAttribute("empInfo")) {
			String emp_info_emp_no = ((EmpInfo)session.getAttribute("empInfo")).getEmp_info_emp_no();
			
			List<DocuList> list = sqlSession.selectList("document.docuList", emp_info_emp_no);
			
		}
		
		return "document/docuList";
	}
}
