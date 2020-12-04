<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="container">
	<!--  본문 -->
	<div class="main">
		<c:forEach var="postView" items="${postView}">
			<div>
				<h2>${postView.post_title}</h2>
				<h5>${postView.emp_info_name},
					<fmt:formatDate value="${postView.post_wdat}" pattern="yyyy.MM.dd" />
				</h5>
					<div><h5>[${postView.post_cvp}]</h5></div>
			</div>
			<div>${postView.post_comt}</div>
		</c:forEach>
	</div>
	
	
<!-- 버튼 부분 -->
<c:forEach var="postView" items="${postView }">
<div><a href='<c:url value='/post/postUpdate?post_code=${postCheck.post_code}'/>'>수정하기</a></div>
</c:forEach>
<c:forEach var="postView" items="${postView }">
<div><a href='<c:url value='/post/postDelete?post_code=${postView.post_code}'/>'>삭제하기</a></div>
</c:forEach>
<button>돌아가기</button>
</div>

<!--  덧글 -->

<c:if test="${sessionScopt.emp_info_emp_no != null }">
	
	<input type="hidden" name="post_code" value="${ostCheck.post_code}">

	<textarea id="post_repl_cont" name="post_repl_cont">
	
	
	</textarea>
	<span>
	<button type="button" id="btnReply" name="btnReply">댓글 작성</button>
	</span>
	</c:if>
	<div id="listReply"></div>
		<jsp:include page="../post/PostReply.jsp" />
