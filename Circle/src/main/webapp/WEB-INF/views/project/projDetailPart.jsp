<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!--  본문 -->
<div class="main">
	<c:forEach var="postView" items="${postView}">
		<div>
			<h2>${postView.pro_title}</h2>
			<h5>${postView.pro_manager}</h5>
			<h5>${postView.emp_info_name},
				<fmt:formatDate value="${postView.post_wdat}" pattern="yyyy.MM.dd" />
			</h5>
			<div>
				<h5>[${postView.post_cvp}]</h5>
			</div>
		</div>
		<div>${postView.post_comt}</div>
		<div>
		<label>프로젝트 멤버 리스트</label>
			<table class="projParts">
					<tr>
						<th class="iss_title"> 참여 업무업무명</th>
						<th class="pro_title">프로젝트명</th>
						<th class="prog_title">업무 진행단계</th>
						<th class="situ_title">업무 상황</th>
					</tr>
					<c:forEach var="projissAll" items="${projissAll}">
						<tr>
							<td>${projissAll.iss_code}</td>

							<td><a
								href='<c:url value='/project/projIssMain?iss_code=${projissAll.iss_code}'/>'>${projissAll.iss_title}</a></td>
							<td><a
								href='<c:url value='/project/projIssMain?pro_code=${projissAll.pro_code}'/>'>${projissAll.pro_title}</a></td>
							<td>${projissAll.prog_title}</td>
							<td>${projissAll.situ_title}</td>
						</tr>
					</c:forEach>
				</table>
		
		</div>
	</c:forEach>
	<c:forEach var="postView" items="${postView}">
		<div>
			<h2>${postView.pro_title}</h2>
			<h5>${postView.pro_manager}</h5>
			<h5>${postView.emp_info_name},
				<fmt:formatDate value="${postView.post_wdat}" pattern="yyyy.MM.dd" />
			</h5>
			<div>
				<h5>[${postView.post_cvp}]</h5>
			</div>
		</div>
		<div>${postView.post_comt}</div>
		<div>
		<label>프로젝트 파일</label>
			<table class="projParts">
					<tr>
						<th class="iss_title">관련 업무명</th>
						<th class="pro_title">작성자</th>
						<th class="prog_title">파일명</th>
						<th class="situ_title">다운로드</th>
					</tr>
					<c:forEach var="projissAll" items="${projissAll}">
						<tr>
							<td>${projissAll.iss_code}</td>

							<td><a
								href='<c:url value='/project/projIssMain?iss_code=${projissAll.iss_code}'/>'>${projissAll.iss_title}</a></td>
							<td><a
								href='<c:url value='/project/projIssMain?pro_code=${projissAll.pro_code}'/>'>${projissAll.pro_title}</a></td>
							<td>${projissAll.prog_title}</td>
							<td>${projissAll.situ_title}</td>
						</tr>
					</c:forEach>
				</table>
		
		</div>
	</c:forEach>
	
</div>

<!-- 버튼 부분 -->

<div>
	<c:if test="${empNo eq viewEmpNo }">
		<c:forEach var="postView" items="${postView}">
			<div>
				<a
					href='<c:url value='/project/projUpdate?pro_code=${postView.pro_code}'/>'>수정하기</a>
			</div>
			<div>
				<a
					href='<c:url value='/project/projDelete?pro_code=${postView.pro_code}'/>'>삭제하기</a>
			</div>
		</c:forEach>
	</c:if>
	<div>
		<a
			href="${pageContext.request.contextPath}/post/postMain?nowPage=${paging.startPage}&cntPerPage=${paging.cntPerPage}">돌아가기</a>
	</div>
</div>

<!--  덧글 -->
<div>
	<c:if test="${sessionScope.emp_info_emp_no != null }">

		<input type="hidden" name="post_code" value="${postCheck.post_code}">

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
					<p>${listReply.post_repl_cont}</p> <c:if
						test="${empNo eq listReply.post_repl_emp }">
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


