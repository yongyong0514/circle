<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!--  본문 -->
<div class="main">
	<c:forEach var="projIssDetail" items="${projIssDetail}">
		<div>
			<div>
			<h2>제목 : ${projIssDetail.iss_title}</h2>
			<h5>작성자 : ${projIssDetail.dept_info_name} ${projIssDetail.emp_info_name}</h5>
			</div>
			<div>
			<label> 업무 관련 정보</label>
			<h5>작성일 : ${projIssDetail.iss_wdat}</h5>
			<h5>시작일 :<c:if test="${projIssDetail.iss_sdate eq null}"><label>시작일을 설정하지 않으셨습니다.</label></c:if> ${projIssDetail.iss_sdate}</h5>		<div> 수정하기 </div>
			
			<h5>종료일 : <c:if test="${projIssDetail.iss_edate eq null}"><label>종료일을 설정하지 않으셨습니다.</label></c:if>${projIssDetail.iss_edate}</h5>		<div> 수정하기 </div>
			
			<h5>진행단계 : ${projIssDetail.prog_title}</h5>		<div> 수정하기 </div>
			
			<h5>업무상황 : ${projIssDetail.situ_title}</h5>		<div> 수정하기 </div>
			
			
			</div>
			
		<div>
		<h2>업무 설명</h2>
		${projIssDetail.iss_cont}
		</div>
		<div> 수정하기 </div>
			
		</div>
		<div>
		업무관련 자료
		<div>
		<c:if  test="${projIssDetail.files_code  eq null}"> <label>관련 자료가 없습니다. </label></c:if>
		<c:if test="${projIssDetail.files_code  != null}">
			파일 명 : ${projIssDetail.files_oname}<a href='<c:url value='/project/projDownload?files_code=${projIssDetail.files_code}'/>'>다운로드</a>
		</c:if>
		</div>
				<div> 수정하기 </div>
		
		</div>
	</c:forEach>
		
</div>


	

<!-- 버튼 부분 -->

<div>
<c:if test="${empNo eq viewEmpNo }">
	<c:forEach var="projDetail" items="${projDetail}">
			<div>
				<a
					href='<c:url value='/project/projUpdate?pro_code=${projDetail.pro_code}'/>'>수정하기</a>
			</div>
			<div>
				<a
					href='<c:url value='/project/projDelete?pro_code=${projDetail.pro_code}'/>'>삭제하기</a>
			</div>
	</c:forEach>
	</c:if>
	<div>
		<a
			href="${pageContext.request.contextPath}/project/projMain?nowPage=${paging.startPage}&cntPerPage=${paging.cntPerPage}">돌아가기</a>
	</div>
</div>

<!--  덧글 -->
<div>
	<c:if test="${sessionScope.emp_info_emp_no != null }">

		<input type="hidden" name="pro_code" value="${postCheck.pro_code}">

		<textarea id="post_repl_cont" name="post_repl_cont">
	
	
	</textarea>
		<span>
			<button type="button" id="btnReply" name="btnReply">댓글 작성</button>
		</span>
	</c:if>

</div>
<!-- 덧글 리스트 -->
<div>
	<div id="reply">
		<ol class="listReply">
			<c:forEach var="listReply" items="${listReply}">
				${listReply.post_repl_emp }
				<li>
					<p>
						작성자 : ${listReply.emp_info_name} 작성날짜 :
						<fmt:formatDate value="${listReply.post_repl_wdat}"
							pattern="yyyy-MM-dd" />
					</p>
					<div id="post_repl_code">${listReply.post_repl_code}</div>
					<p>${listReply.post_repl_cont}</p>
					
					<c:if test="${empNo eq listReply.post_repl_emp }">
					<div>
						<div>
							<a
								href='<c:url value='/post/postReplyUpdate?post_code=${listReply.post_repl_post}'/>'>수정하기</a>
						</div>
						<div>
							<a
								href='<c:url value='/post/postReplyDelete?post_code=${listReply.post_repl_post}'/>'>삭제하기</a>
						</div>
					</div>
					</c:if>
				</li>
			</c:forEach>
		</ol>
	</div>
</div>


<!--  덧글 작성 -->
<form name="replyForm"
	action="${pageContext.request.contextPath}/post/replyInsertAdd"
	method="post">
	<input type="hidden" id="post_repl_post" name="post_repl_post"
		value="${post.post_code}" /> <input type="hidden" id="post_repl_emp"
		name="post_repl_emp" value="${post.post_emp}" />
	<div>
		<label for="post_repl_cont">댓글</label><input type="text"
			id="post_repl_cont" name="post_repl_cont" />
	</div>
	<div>
		<input type="submit" class="replyInsertBtn" value="작성하기" />
	</div>

</form>


