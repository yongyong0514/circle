<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!--  본문 -->
<div class="main">
	<c:forEach var="projDetail" items="${projDetail}">
		<div>
			<h2>${projDetail.post_title}</h2>
			<h5>${projDetail.dept_info_name}</h5>
			<h5>${projDetail.emp_info_name},
				<fmt:formatDate value="${projDetail.post_wdat}" pattern="yyyy.MM.dd" />
			</h5>
			<div>
				<h5>[${projDetail.post_cvp}]</h5>
			</div>
		</div>
		<div>${projDetail.post_comt}</div>
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


