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
import com.kh.circle.sign.vo.PageInfo;
import com.kh.circle.sign.vo.SignEmpList;
import com.kh.circle.sign.vo.SignFiles;
import com.kh.circle.sign.vo.SignList;
import com.kh.circle.sign.vo.SignListJoiner;
import com.kh.circle.sign.vo.SignModify;
import com.kh.circle.sign.vo.SignReply;
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

	
//	Create sign
	@PostMapping("/signWrite")
	public String signWrite(@ModelAttribute SignWriteInsert signWriteInsert
					   /* , @RequestParam MultipartFile file */) throws IllegalStateException, IOException {
		signService.insert(signWriteInsert);
			
		return "redirect:signList";
	}	

	
//	Create signFiles
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
	
	
//	Result signWrite
	@GetMapping("/signWrite")
	public String signWrite(Model model) {
		List<SignType> list = sqlSession.selectList("sign.signTypeList");
		model.addAttribute("list", list);
		
		List<SignEmpList> list2 = sqlSession.selectList("sign.signEmpList");
		model.addAttribute("list2", list2);
		
		return "sign/signWrite";
	}
	
	
//	Result signListAll
	@GetMapping("/signListAll")
	public String signListAll(@RequestParam(required = false) String currentPages, HttpSession session, Model model) {
		
		if(null != session.getAttribute("empInfo")) {
			String empCode = ((EmpInfo)session.getAttribute("empInfo")).getEmp_info_emp_no();
			int currentPage;
			int limit;
			int maxPage;
			int startPage;
			int endPage;
			
			currentPage = 1;
			
			if(currentPages != null) {
				currentPage = Integer.parseInt(currentPages);
			}
			
			limit = 8;
			
			int listCount = sqlSession.selectOne("sign.signListAllCount", empCode);
			
			maxPage = (int)((double) listCount / limit + 0.9);
			
			startPage = (((int)((double) currentPage / limit + 0.9)) - 1) * 10 + 1;
			
			endPage = startPage + 10 - 1;
			
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() -1;
			
			Map<String, Object> map = new HashMap<>();
			
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			map.put("empCode", empCode);
			
			List<SignList> list = sqlSession.selectList("sign.signListAll", map);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
		}
		
		return "sign/signListAll";
	}

	
//	Result signList
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
	
	
//	Result signSelectOne
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
		
		List<SignReply> list5 = sqlSession.selectList("sign.signResult", signCode);
		model.addAttribute("list5", list5);
		
		return "sign/signSelectOne";
	}
	
//	주석용 커밋	
//  Result signModify
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

	
//  Result signConfig
	@GetMapping("/signConfig")//여기서 다운로드 처리해야 함
	public String signConfig(HttpSession session, Model model) {
		String empCode = ((EmpInfo)session.getAttribute("empInfo")).getEmp_info_emp_no();
		List<SignFiles> list = sqlSession.selectList("sign.signFilesSignatureList", empCode);
		model.addAttribute("list", list);
		
		List<SignFiles> list2 = sqlSession.selectList("sign.sfsListMini", empCode);
		model.addAttribute("list2", list2);
		
		return "sign/signConfig";
	}
	

// 	Result signFilesSignatureDownload
	@GetMapping("/sfsDownload")
	public ResponseEntity<ByteArrayResource> sfsDownload(@RequestParam String fileCode) throws IOException {
		ResponseEntity<ByteArrayResource> entity = signService.sfsdownload(fileCode);
		
		return entity;
	}
	
	
// 	Update signModify
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
