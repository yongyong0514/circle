package com.kh.circle.post.contorller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.circle.post.entity.Post;
import com.kh.circle.post.entity.PostFile;
import com.kh.circle.post.entity.PostType;
import com.kh.circle.post.service.PostService;
import com.kh.circle.post.service.PostServiceImp;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private PostService postService;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private HttpServletResponse response;

	/* TEST ZONE */

	// 게시판 list 불러오기 [전사원]

	@GetMapping("/postEmpList")
	public String postPart(Model model) {

		List<Post> postEmpList = sqlSession.selectList("post.postEmpList");

		model.addAttribute("postEmpList", postEmpList);
		return "../post/postEmpList.jsp";

	}

	// 게시글 list
	
	   @GetMapping("/postTestPart")
	   public String postTestPart(Model model,
	                        @RequestParam("type") String type) {
	      System.out.println("type: " + type);
	      
	      String postName = "";
	      if(type.equals("test")) {
	         postName = "테스트";
	      }
	      
	      List<Post> postTestPart = sqlSession.selectList("post.postTestPart");
	      List<Post> postTestPart2 = sqlSession.selectList("post.postTestPart2");
	      
	      model.addAttribute("postTestPart", postTestPart);
	      model.addAttribute("postTestPart2", postTestPart2);
	      model.addAttribute("postName", postName);
	      
	      return "post/postTestPart";
	   }
	/*
	@GetMapping("/postTestPart")
	public String postTestPart(Model model, @RequestParam("name") String name, Post post) {

		System.out.println("type: " + name);

		String postName = "";
		if (name.equals("test")) {
			postName = "테스트";
		}

		List<Post> postTypeList = null;
		
		switch (name) {

		case "test":
			postName = "테스트";
			postTypeList = postService.postTest1(post);
			break;
		case "new":
			postName = "테스트2";
			postTypeList = postService.postTest2(post);
			break;
			
		case "notice":
			postName = "테스트1";
			postTypeList = postService.postTest2(post);
			break;
			
		}

		
		// 1번 리스트 -> 1번 서비스 2번 리스트 -> 2번 서비스
		 
		

		System.out.println("DDDDD" + postTypeList);

		model.addAttribute("postTypeList", postTypeList);
		model.addAttribute("postTypeList2", postTypeList);

		model.addAttribute("postName", postName);

		System.out.println("DD!!!!!!! " + model);
		return "post/postTestPart";

	}
*/
	   
	   
	// 게시글 view
	@GetMapping("/postTestView")
	public String postTestView(Model model) {

		List<Post> postTestView = sqlSession.selectList("post.postTestPart");
		model.addAttribute("postTestPart", postTestView);
		return "post/postTestView";

	}

	// 게시글 insert

	@GetMapping("/postTestInsert")
	public String postTestInsert() {

		return "post/postTestInsert";

	}

	@GetMapping("/testpost")
	public String posttestpost() {

		return "post/testpost";

	}

	/*
	 * 페이징처리한 파트 실패함
	 * 
	 * @GetMapping("postList") public String postList(Model model, PostPaging
	 * paging) {
	 * 
	 * 
	 * 
	 * 
	 * 
	 * // pageing calculation int currentPageNo = 1; int recordsPerPage = 0; String
	 * url = null;
	 * 
	 * //커넥션 풀 연결 / 인스턴스 생성 PostService postService = PostService.getInstance();
	 * 
	 * //pages, lines 파라미터를 받아 currnetPageNo, recordsPerpage대입 // 처음 페이지 열릴 때에는 당연히
	 * 1, 0 if(request.getParameter("pages") != null) currentPageNo =
	 * Integer.parseInt(request.getParameter("pages"));
	 * 
	 * if(request.getParameter("lines") != null) recordsPerPage =
	 * Integer.parseInt(request.getParameter("lines"));
	 * 
	 * 
	 * //Paging 객체 생성(currentPagenNO, recordsPerPage를 인자로 넣고 초기화함) //객체 선언한 뒤 paging
	 * 출력하면 recordsPerPage가 5로 출력 PostPaging postPaging = new
	 * PostPaging(currentPageNo, recordsPerPage);
	 * 
	 * 
	 * //해당 게시글의 인덱스를 구하는 변수offset
	 * 
	 * int offset = (postPaging.getCurrentPageNo() - 1) *
	 * postPaging.getRecordsPerPage();
	 * 
	 * 
	 * 
	 * //post 데이터 가져오기 List<Post> post = postService.getPostList(offset,
	 * postPaging.getRecordsPerPage());
	 * 
	 * //전체 갯수 구해서 numberOfRecords 메소드 세팅 //*************** 이 인근 이해안감
	 * postPaging.setNumberOfRecords(postService.getNoOfRecords());
	 * 
	 * 
	 * //paging 생성 paging.makePaging();
	 * 
	 * 
	 * //list 존재시 request.setAttribute("post", post); request.setAttribute("paging",
	 * paging);
	 * 
	 * return "post/postList";
	 * 
	 * 
	 * 
	 * }
	 * 
	 * 
	 * @GetMapping("/postList") public ModelAndView postList(ModelAndView
	 * model, @ModelAttribute String post_type) { String postType = post_type;
	 * 
	 * System.out.println("controller postName: " + post_type);
	 * 
	 * List<Post> postList = sqlSession.selectList("post.postList");
	 * 
	 * model = new ModelAndView();
	 * 
	 * model.addObject("postList", postList); model.setViewName("post/postList");
	 * 
	 * return model;
	 * 
	 * }
	 * 
	 * @GetMapping("postNoticeList") public String postNoticeList(Model model) {
	 * 
	 * List<Post> postNoticeList = sqlSession.selectList("post.postNoticeList");
	 * 
	 * model.addAttribute("postNoticeList", postNoticeList);
	 * 
	 * return "post/postNoticeList";
	 * 
	 * }
	 * 
	 * @GetMapping("postEmployeeList") public String postEmployeeList(Model model) {
	 * 
	 * List<Post> postEmployeeList = sqlSession.selectList("post.postEmployeeList");
	 * 
	 * model.addAttribute("postEmployeeList", postEmployeeList);
	 * 
	 * return "post/postEmployeeList";
	 * 
	 * }
	 * 
	 * @RequestMapping("postType") public String postType(Model model) {
	 * 
	 * List<PostType> postType = sqlSession.selectList("post.postType");
	 * 
	 * model.addAttribute("postType", postType); return "../post/postType"; }
	 * 
	 * @RequestMapping("/postInsert") public String postInsert(Model model, Post
	 * post) {
	 * 
	 * List<Post> list = sqlSession.selectList("post.postType");
	 * model.addAttribute("postList", list);
	 * 
	 * return null; }
	 */
}
