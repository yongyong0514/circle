package com.kh.circle.document.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.circle.document.service.DocuService;
import com.kh.circle.document.vo.DocuReply;

@RestController
@RequestMapping("/docuRest")
public class DocuRestController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private DocuService docuService;
	
	
//	Create docuReply
	@PostMapping("/docuReplyInsert")
	public void docuReplyInsert(@ModelAttribute DocuReply docuReply) {
	
		docuService.insertDocuReply(docuReply);
	}
		
//	Create docuFiles
	@PostMapping("/docuFiles")
	public String upload(MultipartHttpServletRequest multipartRequest) {
		
		 Iterator<String> itr =  multipartRequest.getFileNames();
         
	       String filePath = "d:/resources/files/sign";
	       
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
	
//	Result docuReply
	@GetMapping("/docuReply")
	public List<DocuReply> docuReply(@RequestParam String docuCode, Model model) {
	
		List<DocuReply> list = sqlSession.selectList("docu.docuReply", docuCode);
		
		model.addAttribute("list", list);
		
		return list;
	}
	
//	Result docuFileDownload
// 	Result 결재 첨부 파일 다운로드
	@GetMapping("/docuFileDownload")
	public ResponseEntity<ByteArrayResource> docuFileDownload(@RequestParam String fileCode) throws IOException {
		ResponseEntity<ByteArrayResource> entity = docuService.download(fileCode);
		
		return entity;
	}
	
//	Delete docuReply
	@PostMapping("/docuReplyDelete")
	public void docuReplyDelete(@RequestParam String replyCode) {
		
		docuService.deleteDocuReply(replyCode);
		
	}
	
}
