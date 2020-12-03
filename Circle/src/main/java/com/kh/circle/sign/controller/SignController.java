package com.kh.circle.sign.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.circle.login.entity.EmpInfo;
import com.kh.circle.sign.service.SignService;
import com.kh.circle.sign.vo.SignEmpList;
import com.kh.circle.sign.vo.SignList;
import com.kh.circle.sign.vo.SignListJoiner;
import com.kh.circle.sign.vo.SignModify;
import com.kh.circle.sign.vo.SignSelectOne;
import com.kh.circle.sign.vo.SignType;
import com.kh.circle.sign.vo.SignWriteInsert;

@Controller
@RequestMapping("/sign")
public class SignController {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private SignService signService;	

//	결재 첫화면
	@GetMapping("/signList")
	public String signList(Model model, HttpSession session) {
		String emp_info_emp_no = ((EmpInfo)session.getAttribute("empInfo")).getEmp_info_emp_no();
		
		
		List<SignList> list = sqlSession.selectList("sign.list", emp_info_emp_no);
		model.addAttribute("list", list);
		
		List<SignList> list2 = sqlSession.selectList("sign.listComplete", emp_info_emp_no);
		model.addAttribute("list2", list2);

		return "sign/signList";
	}
	
//	결재 작성 화면
	@GetMapping("/signWrite")
	public String signWrite(Model model) {
		List<SignType> list = sqlSession.selectList("sign.signTypeList");
		model.addAttribute("list", list);
		
		List<SignEmpList> list2 = sqlSession.selectList("sign.signEmpList");
		model.addAttribute("list2", list2);
		
		return "sign/signWrite";
	}

// 결재 작성 등록
	@PostMapping("/signWrite")
	public String signWrite(@ModelAttribute SignWriteInsert signWriteInsert
					   /* , @RequestParam MultipartFile file */) throws IllegalStateException, IOException {
		signService.insert(signWriteInsert);
		
		return "redirect:signList";
	}
	
// 결재 첨부 파일	
	@PostMapping("/signFiles")
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

        	   signService.insertFile(files_oname, files_size, files_type, files_cname, files_route);
        	   
           } catch (Exception e) {
               e.printStackTrace();
           }
      }
       return "success";
	}
	
// 결재 한건 선택
	@GetMapping("/signSelectOne")
	public String signSelectOne(@RequestParam String signCode, Model model) {
		SignSelectOne signSelectOne = sqlSession.selectOne("sign.signSelectOne", signCode);
		model.addAttribute("signSelectOne", signSelectOne);
		
		List<SignListJoiner> signListJoiner = sqlSession.selectList("sign.signJoinerCode", signCode);	
		model.addAttribute("signListJoiner", signListJoiner);
		
		return "sign/signSelectOne";
	}
	
// 결재 한건 수정 화면
	@GetMapping("/signModify")
	public String signModify(@RequestParam String signCode, Model model) {
		SignModify signModify = sqlSession.selectOne("sign.signModify", signCode);
		model.addAttribute("signModify", signModify);
		
		List<SignType> list = sqlSession.selectList("sign.signTypeList");
		model.addAttribute("list", list);
		
		List<SignEmpList> list2 = sqlSession.selectList("sign.signEmpList");
		model.addAttribute("list2", list2);

		return "sign/signModify";
	}
	
// 결재 한건 수정
	@PostMapping("/signModify")
	public String signModify() {
		
		return "sign/signList";
	}
	
	
// 문서 첫화면
	@GetMapping("/docuList")
	public String docuList() {
		return "document/docuList";
	}
}
