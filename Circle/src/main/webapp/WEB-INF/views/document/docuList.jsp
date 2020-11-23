<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/document/docuList.css">
</head>
<body>
	<div class="wrap">
		<div class="header">
			<jsp:include page="../common/menuTopBar.jsp" />
			<jsp:include page="../common/menuAlertBar.jsp" />
		</div>
		<div class="leftBar">
			<jsp:include page="docuLeftBar.jsp" />
		</div>
		<div class="container">
			<div class="contentBar">
				<jsp:include page="docuHomeBar.jsp" />
			</div>
			<div class="homeListBar">
				<button class="homeListBtn">작성하기</button>
			</div>			
			<div class="content">
				<div>
					<div id="sortable1" class="connectedSortable">
						<ul class="test">
						  	<li>Item 1</li>
 							<li>Item 2</li>
  							<li>Item 3</li>
  							<li>Item 4</li>
  							<li>Item 5</li>
						</ul>
						<ul class="test">
						  	<li>Item 1</li>
 							<li>Item 2</li>
  							<li>Item 3</li>
  							<li>Item 4</li>
  							<li>Item 5</li>
						</ul>
 					</div>
 				</div>
 				<div>
 					<div id="sortable2" class="connectedSortable">
					</div>
				</div>
			</div>
		</div>
	</div>
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 왼쪽바 고정 추가 옵션 시작-->
	<script>
		$(function() {
    		var leftBar = $(".leftBar").offset().top;
    			$(window).scroll(function() {
    		var window = $(this).scrollTop();
    		console.log(leftBar+"left");
    		console.log(window+"window");
    		if(leftBar <= window) {
    			$(".leftBar").addClass("fixed");
    		} else {
    			$(".leftBar").removeClass("fixed");
    			}
    		})
    	});
    </script>
  	<script>
  		$( function() {
   	 		$( "#sortable1, #sortable2" ).sortable({
      			connectWith: ".connectedSortable"
    				}).disableSelection();
  		});
  </script>
</body>
</html>