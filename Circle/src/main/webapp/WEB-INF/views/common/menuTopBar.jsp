<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/menuBar/menuTopBar.css">
</head>
<body>
<nav>
	<div class="menuTopBar">
		<ul>
			<li><img src="${pageContext.request.contextPath}/resources/img/common/menuTopBar/grid50x50.png" class="menuBtnLeft" id="menuBtnLeft" onclick=""></li>
			
			<li><button class="menuBtn" onclick="">회사이름불러올자리</button></li>
			<li><button class="menuBtn2">My Page</button></li>
			<li><button class="menuBtn2">My Profile</button></li>
			<li><img src="${pageContext.request.contextPath}/resources/img/common/menuTopBar/hamburger50x50.png" class="menuBtnRight" id="menuBtnRight" onclick=""></li>
			<li><input type="text" class="menuAlert" id="menuAlert" value="" placeholder ="0" readonly></li>
			<li><input type="text" class="menuSearchBox" id="menuSearchBox" placeholder="검색" onfocus="this.placeholder = ''" onblur="this.placeholder='검색'"></li>	
		</ul>
	</div>
	<div class="menuScroll">
		<jsp:include page="../common/menuScrollList.jsp" />
	</div>
</nav>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(".menuBtnLeft").mouseenter(function(){
		$(this).add(".menuScroll").fadeIn(100);
	});
	
	$(".menuScroll").mouseleave(function(){
		$(".menuScroll").fadeOut(100);
	});
</script>
</body>
</html>