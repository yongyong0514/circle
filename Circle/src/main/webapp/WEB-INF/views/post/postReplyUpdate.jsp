<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<div class="wrap">
		<div class="header">
			<jsp:include page="../common/menuTopBar.jsp" />
			<jsp:include page="../common/menuAlertBar.jsp" />
		</div>
		<div class="leftBar">
			<jsp:include page="../post/postSidebar.jsp" />
		</div>
		<div class="container">
			<div class="contentBar">
				 <jsp:include page="../post/postHomebar.jsp" />
			</div>
	
		<div class="content">
		
			<!-- 본문 -->

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

<!-- 덧글 리스트 -->
<div>
<div id="reply">
<ol class="listReply">
<c:forEach var="postReplyUpdate" items="${postReplyUpdate}">
<li>
<p>
작성자 : ${listReply.emp_info_name}
작성날짜 : <fmt:formatDate value="${postReplyUpdate.post_repl_wdat}" pattern="yyyy-MM-dd"/>
</p>

<p> ${listReply.post_repl_cont}</p>
<div>
<c:forEach var="postView" items="${postView }">
<div><a href='<c:url value='/post/postReplyUpdate?post_repl_code=${postReplyUpdate.post_repl_code}'/>'>수정하기</a></div>
</c:forEach>
</div>
</li>
</c:forEach>
</ol>
</div>
</div>


<!--  덧글 작성 -->
<form name="replyForm"  action="${pageContext.request.contextPath}/post/replyInsertAdd"  method="post">
<input type="hidden" id="post_repl_post" name="post_repl_post" value="${post.post_code}"/>
<input type="hidden" id="post_repl_emp" name="post_repl_emp" value="${post.post_emp}"/>
<div>
<label for="post_repl_cont">댓글</label><input type="text" id="post_repl_cont" name="post_repl_cont"/>
</div>
<div>
<input type="submit" class="replyInsertBtn" value="작성하기"/>
</div>

</form>


<!--  종료 -->

		</div>
	</div>
	</div>

</body>
</html>