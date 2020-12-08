package com.kh.circle.sign.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

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

import com.kh.circle.login.entity.EmpInfo;
import com.kh.circle.sign.service.SignService;
import com.kh.circle.sign.vo.SignFiles;
import com.kh.circle.sign.vo.SignListJoiner;
import com.kh.circle.sign.vo.SignReply;
import com.kh.circle.sign.vo.SignReplyInsert;

@RestController
@RequestMapping("/signResult")
public class SignResultController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private SignService signService;

	
	@GetMapping("/signListJoinerCheck")
	public List<SignListJoiner> signJoinerCheck(@RequestParam String signCode) {	
		List<SignListJoiner> list = sqlSession.selectList("sign.signJoinerCheck", signCode);
		
		return list;
	}
	
	@GetMapping("/signListJoiner")
	public List<SignListJoiner> signJoiner(@RequestParam String signCode) {	
		List<SignListJoiner> list = sqlSession.selectList("sign.signJoiner", signCode);
		
		return list;
	}

	@GetMapping("/signListWatcher")
	public List<SignListJoiner> signWatcher(@RequestParam String signCode) {
		List<SignListJoiner> list = sqlSession.selectList("sign.signWatcher", signCode);
		
		return list;
	}
	
//	결재 타입 지정
	@GetMapping("/signTypeContent")
	public Map<String, Object> signTypeContent(@RequestParam String typeCode) {
		String result = sqlSession.selectOne("sign.signTypeContent", typeCode);
		Map<String, Object> map = new HashMap<>();
		map.put("result", result);
		
		return map;
	}
	
//	결재 첨부 파일 로드
	@GetMapping("/signFileList")
	public List<SignFiles> signFileList(@RequestParam String signCode) {
		List<SignFiles> list = sqlSession.selectList("sign.signFileList", signCode);
		
		return list;
	}

// 	결재 첨부 파일 다운로드
	@GetMapping("/signFileDownload")
	public ResponseEntity<ByteArrayResource> signFileDownload(@RequestParam String fileCode) throws IOException {
		ResponseEntity<ByteArrayResource> entity = signService.download(fileCode);
		
		return entity;
	}
	
// 	결재 댓글 로드
	@GetMapping("/signReply")
	public List<SignReply> signReply(@RequestParam String signCode, Model model) {
		List<SignReply> list = sqlSession.selectList("sign.signReply", signCode);
		model.addAttribute("list", list);
			
		return list;
	}
	
// 	결재 댓글 작성
	@PostMapping("/signReplyInsert")
	public void signReplyInsert(@ModelAttribute SignReplyInsert signReplyInsert) {
		signService.insertReply(signReplyInsert);
	}

// 	결재 서명 첨부 파일 등록
	@PostMapping("/signFilesSignature")
	public String uploadSignature(HttpSession session, MultipartHttpServletRequest multipartRequest) {
		String empCode = ((EmpInfo)session.getAttribute("empInfo")).getEmp_info_emp_no();
		int checkValue = sqlSession.selectOne("sign.sfsListCount", empCode);
		Iterator<String> itr =  multipartRequest.getFileNames();
		String filePath = "d:/resources/files/empInfo/signature";
		
		if(checkValue < 5) {
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
					
					signService.insertFilesSignature(files_oname, files_size, files_type, files_cname, files_route, empCode);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
		} else {
			System.out.println("denied");
		}
		return "sign/signConfig";	
	}	
}
