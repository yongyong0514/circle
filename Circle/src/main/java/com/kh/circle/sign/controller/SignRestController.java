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
import com.kh.circle.sign.vo.SignJoinerCount;
import com.kh.circle.sign.vo.SignListJoiner;
import com.kh.circle.sign.vo.SignReply;
import com.kh.circle.sign.vo.SignReplyInsert;

@RestController
@RequestMapping("/signResult")
public class SignRestController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private SignService signService;

// 	Create 결재 댓글 작성
	@PostMapping("/signReplyInsert")
	public void signReplyInsert(@ModelAttribute SignReplyInsert signReplyInsert) {
		signService.insertReply(signReplyInsert);
	}

	
// 	Create 결재 서명 첨부 파일 등록
	@PostMapping("/signFilesSignature")
	public String uploadSignature(HttpSession session, MultipartHttpServletRequest multipartRequest) {
		String empCode = ((EmpInfo)session.getAttribute("empInfo")).getEmp_info_emp_no();
		String iempCode = 'i' + empCode;
		int checkValue = sqlSession.selectOne("sign.sfsListCount", iempCode);
		Iterator<String> itr =  multipartRequest.getFileNames();
		String filePath = "d:/resources/files/sign/signature/image";
		
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
					
					signService.insertFilesSignature(files_oname, files_size, files_type, files_cname, files_route, iempCode);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
		} else {
			System.out.println("denied");
		}
		return "sign/signConfig";	
	}	
	
	
//	Result 결재 참여 결재자 수
	@GetMapping("/signJoinerCount")
	public int signJoinerCount(@RequestParam String signCode) {
		int result = sqlSession.selectOne("sign.signJoinerCount", signCode);
		
		return result;
	}
	
	
//	Result 결재 참여 결재자 승인 수
	@GetMapping("/signListJoinerCheck")
	public List<SignListJoiner> signJoinerCheck(@RequestParam String signCode) {	
		List<SignListJoiner> list = sqlSession.selectList("sign.signJoinerCheck", signCode);
		
		return list;
	}
	
	
//	Result 결재 참여자 리스트
	@GetMapping("/signListJoiner")
	public List<SignListJoiner> signJoiner(@RequestParam String signCode) {	
		List<SignListJoiner> list = sqlSession.selectList("sign.signJoiner", signCode);
		
		return list;
	}

	
//	Result 결재 참조자 리스트
	@GetMapping("/signListWatcher")
	public List<SignListJoiner> signWatcher(@RequestParam String signCode) {
		List<SignListJoiner> list = sqlSession.selectList("sign.signWatcher", signCode);
		
		return list;
	}
	
	
//	Result 결재 종류 선택시 반환 타입 지정
	@GetMapping("/signTypeContent")
	public Map<String, Object> signTypeContent(@RequestParam String typeCode) {
		String result = sqlSession.selectOne("sign.signTypeContent", typeCode);
		Map<String, Object> map = new HashMap<>();
		map.put("result", result);
		
		return map;
	}
	
	
//	Result 결재 첨부 파일 리스트
	@GetMapping("/signFileList")
	public List<SignFiles> signFileList(@RequestParam String signCode) {
		List<SignFiles> list = sqlSession.selectList("sign.signFileList", signCode);
		
		return list;
	}

	
// 	Result 결재 첨부 파일 다운로드
	@GetMapping("/signFileDownload")
	public ResponseEntity<ByteArrayResource> signFileDownload(@RequestParam String fileCode) throws IOException {
		ResponseEntity<ByteArrayResource> entity = signService.download(fileCode);
		
		return entity;
	}
	
// 	Result 결재 댓글 리스트
	@GetMapping("/signReply")
	public List<SignReply> signReply(@RequestParam String signCode, Model model) {
		List<SignReply> list = sqlSession.selectList("sign.signReply", signCode);
		model.addAttribute("list", list);
			
		return list;
	}

	
//  Update 결재 참여 결재자 결재 승인 프로세스
	@PostMapping("/signProcess")
	public String updateSignProcess(@RequestParam String fileCode, String signCode, HttpSession session) {
		String empCode = ((EmpInfo)session.getAttribute("empInfo")).getEmp_info_emp_no();
		
		//1. SIGN_JOINER 결재 여부 결재로 변경 N -> Y
		Map<String, Object> map1 = new HashMap<>();
		
		map1.put("signCode", signCode);
		map1.put("empCode", empCode);
		
		sqlSession.update("sign.sjDecisionAgree", map1);
		
		//2. 조건에 따라 결재 프로세스 상태 변경을 위한 결재 카운트 조회 및 변수 설정
		List<SignJoinerCount> signJoinerCount = sqlSession.selectList("sign.sjDecisionCount", signCode);

		int signCount = 0;
		int signOCount = 0;
		
		for(SignJoinerCount value:signJoinerCount) {
			signCount = Integer.parseInt(value.getSign_count());
			signOCount = Integer.parseInt(value.getSign_ocount());
		}

		int result = signCount - signOCount;
		
		//3. 조건부에 따른 결재 반영
		//카운트 값 1 감소일 때 진행 상태 프로세스 추가
		//sign 한 건 카운트 1 감소 처리 및 진행 상태 진행으로 변경
		if(Math.abs(result) == 1) {
			sqlSession.insert("sign.signProcessAdd2", signCode);
			sqlSession.update("sign.signGo", signCode);
		}
		
		//카운트 값 0일 때 완료 상태 프로세스 추가
		//카운트 값 0과 함께 sign 한 건 완료 처리 및 카운터 0 처리
		else if(Math.abs(result) == signOCount) {
			sqlSession.insert("sign.signProcessAdd3", signCode);
			sqlSession.update("sign.signComplete", signCode);
		}
		
		//위에 둘에 해당되지 않을 때 sign 한건 카운트 1감소 처리
		else if(Math.abs(result) != 1 && Math.abs(result) != signOCount) {
			sqlSession.update("sign.signContinue", signCode);
		}
		
		//4. 댓글형 결재 폼 작성 후 페이지 새로고침
			signService.insertReplyAgree(empCode, signCode, fileCode);
	
		
		return "redirect:/sign/signSelecOne/?signCode="+signCode;
	}
	
	
//	Update signDenied
	@PostMapping("/signDenied")
	public String signCancel(@RequestParam String signCode, HttpSession session){
		String empCode = ((EmpInfo)session.getAttribute("empInfo")).getEmp_info_emp_no();
		
		//반려 상태 프로세스 추가
		//반려 상태 sign 한 건 반려 처리
		sqlSession.insert("sign.signProcessAdd4", signCode);
		
		sqlSession.delete("sign.signProcessDel2", signCode);
		
		sqlSession.update("sign.signDenied", signCode);
		 
		return "redirect:/sign/signSelecOne?signCode="+signCode;
	}	
	
	
//	Delete 결재 서명 첨부 파일 삭제
	@PostMapping("/sfsDelete")
	public void sfsDelete(@RequestParam String fileCode) {
		signService.update(fileCode);
	}
	

//	Delete signReply
	@PostMapping("/signReplyDelete")
	public void signReplyDelete(@RequestParam String replyCode) {
		
		signService.deleteSignReply(replyCode);
		
	}
	
//	Delete signType
	@PostMapping("/signTypeDelete")
	public void signTypeDelete(@RequestParam String typeCode) {
		
		signService.deleteSignType(typeCode);
	}
	
	
//	Result signReplyOwner
	@GetMapping("/signReplyOwner")
	public String signReplyOwner(@RequestParam String replyCode) {
		
		String empCode = sqlSession.selectOne("sign.signReplyOwner", replyCode);
		
		return empCode;
	}
}
