<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!--  본문 -->
<div class="main">
	<c:forEach var="postView" items="${postView}">
		<div>
			<h2>${postView.post_title}</h2>
			<h5>${postView.dept_info_name}</h5>
			<h5>${postView.emp_info_name},
				<fmt:formatDate value="${postView.post_wdat}" pattern="yyyy.MM.dd" />
			</h5>
			<div>
				<h5>[${postView.post_cvp}]</h5>
			</div>
		</div>
		<div>${postView.post_comt}</div>
	</c:forEach>
</div>


<!-- 버튼 부분 -->
<div>
	<c:forEach var="postView" items="${postView }">
		<div>
			<a
				href='<c:url value='/post/postUpdate?post_code=${postView.post_code}'/>'>수정하기</a>
		</div>
	</c:forEach>
	<c:forEach var="postView" items="${postView }">
		<div>
			<a
				href='<c:url value='/post/postDelete?post_code=${postView.post_code}'/>'>삭제하기</a>
		</div>
	</c:forEach>
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
				<li>
					<p>
						작성자 : ${listReply.emp_info_name} 작성날짜 :
						<fmt:formatDate value="${listReply.post_repl_wdat}"
							pattern="yyyy-MM-dd" />
					</p>
					<div id="post_repl_code"> ${listReply.post_repl_code}</div>
					<p>${listReply.post_repl_cont}</p>
					
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


