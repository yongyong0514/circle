package com.kh.circle.sign.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
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
import com.kh.circle.sign.vo.SignFiles;
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
		
		if(null != session.getAttribute("empInfo")) {
		
		String emp_info_emp_no = ((EmpInfo)session.getAttribute("empInfo")).getEmp_info_emp_no();
		
		List<SignList> list = sqlSession.selectList("sign.list", emp_info_emp_no);
		model.addAttribute("list", list);
		
		List<SignList> list2 = sqlSession.selectList("sign.listComplete", emp_info_emp_no);
		model.addAttribute("list2", list2);
		
		}
		
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
	
	
// 결재 첨부 파일 등록
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
	public String signSelectOne(@RequestParam String signCode, Model model, HttpSession session) {
		String empCode = ((EmpInfo)session.getAttribute("empInfo")).getEmp_info_emp_no();
		SignSelectOne signSelectOne = sqlSession.selectOne("sign.signSelectOne", signCode);
		model.addAttribute("signSelectOne", signSelectOne);
		
		List<SignListJoiner> signListJoiner = sqlSession.selectList("sign.signJoinerCode", signCode);	
		model.addAttribute("signListJoiner", signListJoiner);
		
		List<SignFiles> list3 = sqlSession.selectList("sign.signFileList", signCode);
		model.addAttribute("list3", list3);
		
		List<SignFiles> list4 = sqlSession.selectList("sign.sfsListMini2", empCode);
		model.addAttribute("list4", list4);
		
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
		
		List<SignFiles> list3 = sqlSession.selectList("sign.signFileList", signCode);
		model.addAttribute("list3", list3);

		return "sign/signModify";
	}
	
	
// 결재 한건 수정
	@PostMapping("/signModify")
	public String signModify() {
		
		return "sign/signList";
	}

	
// 결재 설정 화면
	@GetMapping("/signConfig")//여기서 다운로드 처리해야 함
	public String signConfig(HttpSession session, Model model) {
		String empCode = ((EmpInfo)session.getAttribute("empInfo")).getEmp_info_emp_no();
		List<SignFiles> list = sqlSession.selectList("sign.signFilesSignatureList", empCode);
		model.addAttribute("list", list);
		
		List<SignFiles> list2 = sqlSession.selectList("sign.sfsListMini", empCode);
		model.addAttribute("list2", list2);
		
		return "sign/signConfig";
	}
	
	
// 	결재 서명 첨부 파일 다운로드
	@GetMapping("/sfsDownload")
	public ResponseEntity<ByteArrayResource> sfsDownload(@RequestParam String fileCode) throws IOException {
		ResponseEntity<ByteArrayResource> entity = signService.sfsdownload(fileCode);
		
		return entity;
	}
	
	
// 전자 결재 한명 결재 프로세스
	@PostMapping("/signProcess")
	public String updateSignProcess(@RequestParam String fileCode, String signCode, HttpSession session) {
		String empCode = ((EmpInfo)session.getAttribute("empInfo")).getEmp_info_emp_no();
		
		//1. 프로세스 상태 변경 대기->진행 insert
		//보류(상태 변경 시점이 애매함)
		//최초 상태 밴경시 -> 진행으로 바뀌는 트리거 필요
		//카운트 0 일 때 작동하는 트리거로 완료 처리
		
		//2. 결재자 상태 변경 결재여부 N->Y 결재 날짜 입력 update
		//진행가능
		
		//3. 결재 카운트 감소-1 update
		//진행가능
		
		//4. 결재 댓글에 파일코드 가져와서 댓글형 결재 완료 작성 insert
		//진행가능
		
		return "success";
	}
	
	
// 문서 첫화면
	@GetMapping("/docuList")
	public String docuList() {
		return "document/docuList";
	}

}
