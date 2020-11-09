<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/post/postMain.css">


</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/menuTopBar.jsp" />
		<jsp:include page="../common/menuAlertBar.jsp" />
		<div class="container">
			<div class="navLeft">
				<jsp:include page="../post/postSidebar.jsp" />
			</div>
			<div class="content">
				<div>
					<jsp:include page="../post/postHomebar.jsp"/>
				</div>
				<!-- 내용 -->
				<div>
				<div>게시글 위치</div> <div> 제목</div>
				<p>본문</p>
				<div>작성자</div> <p>작성시간</p>
				</div>
				
			</div>
		</div>
	</div>
	
	<script>
	const editor = new toastui.Editor({
        el: document.querySelector('#editor'),
        previewStyle: 'vertical',
        height: '500px',
        initialValue: content
      });
	
	</script>
</body>
</html>