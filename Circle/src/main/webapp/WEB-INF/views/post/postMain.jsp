<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/post/postMain.css">

<script scr="http://kit.fontawesome.com/b00e675b6e.js"></script>

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
					<jsp:include page="../post/postHomebar.jsp" />
				</div>
				<!-- 내용 -->
				
				
				
			<div class="wrapper">
	<div class="links">
		<ul>
			<li data-view="list-view" class="li-list active">
			<i class="fas fa-th-list"></i>
			List View</li>
			<li data-view="grid-view" class="li-grid">
			<i class="fas fa-th-large"></i>
			Grid View</li>
		</ul>
	</div>
	
	
	
	<div class="view_main">
	
	
	<!--  list -->
		<div class="view_wrap list-view" style="display: block;">
			<div class="view_item">
				<div class="vi_left">
				</div>
				<div class="vi_right">
					<p class="title">Tomato</p>
					<p class="content">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam impedit, veniam! Voluptate a impedit animi!</p>
					<div class="btn">View More</div>
				</div>
			</div>
			<div class="view_item">
				<div class="vi_left">
				</div>
				<div class="vi_right">
					<p class="title">Chilli</p>
					<p class="content">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam impedit, veniam! Voluptate a impedit animi!</p>
					<div class="btn">View More</div>
				</div>
			</div>
			<div class="view_item">
				<div class="vi_left">
				</div>
				<div class="vi_right">
					<p class="title">Carrot</p>
					<p class="content">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam impedit, veniam! Voluptate a impedit animi!</p>
					<div class="btn">View More</div>
				</div>
			</div>
			<div class="view_item">
				<div class="vi_left">
				</div>
				<div class="vi_right">
					<p class="title">Onion</p>
					<p class="content">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam impedit, veniam! Voluptate a impedit animi!</p>
					<div class="btn">View More</div>
				</div>
			</div>
			<div class="view_item">
				<div class="vi_left">
				</div>
				<div class="vi_right">
					<p class="title">Potato</p>
					<p class="content">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam impedit, veniam! Voluptate a impedit animi!</p>
					<div class="btn">View More</div>
				</div>
			</div>
		</div>
		
		
		
		
		<!--  grid -->
		<div class="view_wrap grid-view" style="display: none;">
			<div class="view_item">
				<div class="vi_left">
				</div>
				<div class="vi_right">
					<p class="title">Apple</p>
					<p class="content">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam impedit, veniam! Voluptate a impedit animi!</p>
					<div class="btn">View More</div>
				</div>
			</div>
			<div class="view_item">
				<div class="vi_left">
				</div>
				<div class="vi_right">
					<p class="title">Banana</p>
					<p class="content">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam impedit, veniam! Voluptate a impedit animi!</p>
					<div class="btn">View More</div>
				</div>
			</div>
			<div class="view_item">
				<div class="vi_left">
				</div>
				<div class="vi_right">
					<p class="title">Grapes</p>
					<p class="content">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam impedit, veniam! Voluptate a impedit animi!</p>
					<div class="btn">View More</div>
				</div>
			</div>
			<div class="view_item">
				<div class="vi_left">
				</div>
				<div class="vi_right">
					<p class="title">Pineapple</p>
					<p class="content">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam impedit, veniam! Voluptate a impedit animi!</p>
					<div class="btn">View More</div>
				</div>
			</div>
			<div class="view_item">
				<div class="vi_left">
				</div>
				<div class="vi_right">
					<p class="title">Strawberry</p>
					<p class="content">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam impedit, veniam! Voluptate a impedit animi!</p>
					<div class="btn">View More</div>
				</div>
			</div>

		</div>
		<!-- grid end -->
		
		
	</div>
</div>
				
				
				
				
				
				<!-- - end  -->
			</div>
		</div>
	</div>
	</div>


	<script
		href="${pageContext.request.contextPath}/resources/js/post/postMain.js"></script>
	<script src="<c:url value="/resources/js/post/postMain.js" />"></script>
	<script>
		const editor = new toastui.Editor({
			el : document.querySelector('#editor'),
			previewStyle : 'vertical',
			height : '500px',
			initialValue : content
		});
	</script>
</body>
</html>