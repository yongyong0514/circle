<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sign/signListAll.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sign/signHomeBar.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sign/signHomeListBar.css">
</head>
<body>
	<div class="wrap">
		<div class="header">
			<jsp:include page="../common/menuTopBar.jsp" />
			<jsp:include page="../common/menuAlertBar.jsp" />
		</div>
		<div class="leftBar">
			<jsp:include page="../sign/signLeftBar.jsp" />
		</div>
		<div>
			<c:import url="/organChart/getInfo"/>
		</div>
		<div class="container">
			<div class="contentBar">
				<div class="signHomeBar">
					<ul>
						<li class="signHomeTitle">전자결재</li>
					</ul>
				</div>
				<div class="signHomeListBar">
					<ul>
						<li class="signHomeListTitle"><img src="${pageContext.request.contextPath}/resources/img/sign/document.png" class="signHomeListTitleImg">나의 전체 결재 목록</li>
						<li><button class="signListBtn3">완료일</button></li>
						<li><button class="signListBtn3">작성일</button></li>
						<li><button class="signListBtn2">참조자</button></li>
						<li><button class="signListBtn2">결재자</button></li>
						<li><button class="signListBtn2">남은결재</button></li>
						<li><button class="signListBtn1">작성자</button></li>
					</ul>
				</div>
			</div>
			<div class="content">
				<div class="resultArea1">
					<table id="listArea">
						<c:forEach var="sign" items="${list}">
							<tr class="result">
 								<td class="textBox0"><c:out value="${sign.sign_code}"/></td>
								<td class="imgBox1"><img src="${pageContext.request.contextPath}/resources/img/sign/chat.png" class="img0"></td>
									<c:choose>
 										<c:when test ="${sign.sign_step eq 'SIPC000001'}">
 											<td><img src="${pageContext.request.contextPath}/resources/img/sign/process_ready.png" class="img1"></td>
 										</c:when>
										<c:when test ="${sign.sign_step eq 'SIPC000002'}">
 											<td><img src="${pageContext.request.contextPath}/resources/img/sign/process_run.png" class="img1"></td>
 										</c:when>
 										<c:when test ="${sign.sign_step eq 'SIPC000003'}">
 											<td><img src="${pageContext.request.contextPath}/resources/img/sign/process_end.png" class="img1"></td>
 										</c:when>
  										<c:when test ="${sign.sign_step eq 'SIPC000004'}">
 											<td><img src="${pageContext.request.contextPath}/resources/img/sign/process_cancel.png" class="img1"></td>
 										</c:when>									 										
 									</c:choose>										
								<td class="textBox1"><br><c:out value="${sign.sign_type_name}"/><br><br><c:out value="${sign.sign_title}"/></td>
								<td class="textBox4"><br><c:out value="${sign.sign_edat}"/><br><br><c:out value="${sign.sign_ehour}"/></td>
								<td class="textBox4"><br><c:out value="${sign.sign_wdat}"/><br><br><c:out value="${sign.sign_whour}"/></td>
								<td class="textBox3"><img src="${pageContext.request.contextPath}/resources/img/sign/share.png" class="signWatcher">
									<table>
										<tbody>
										</tbody>
									</table>						
								</td>
								<td class="textBox3"><img src="${pageContext.request.contextPath}/resources/img/sign/add-contact.png" class="signJoiner">
									<table>
										<tbody>
										</tbody>
									</table>
								</td>				
								<td class="textBox5"><br><img src="${pageContext.request.contextPath}/resources/img/sign/count.png" class="signCount"><c:out value="${sign.sign_count}"/>
									<table>
										<tbody>
										</tbody>
									</table>
								</td>
								<td class="textBox2"><br><c:out value="${sign.emp_info_name}"/><br><br><c:out value="${sign.job_info_name}"/></td>	
							</tr>
						</c:forEach>
					</table>
				</div>
				 <div class="paging-area" align="center">
					<button id="paging" onclick="location.href='${pageContext.request.contextPath}/sign/signListAll?currentPages=1'"><<</button>
			
						<c:if test="${ pi.currentPage <= 1 }">
							<button id="paging" disabled><</button>
						</c:if>
			
						<c:if test="${ pi.currentPage > 1 }">
							<button id="paging" onclick="location.href='${pageContext.request.contextPath}/sign/signListAll?currentPages=<c:out value="${ pi.currentPage - 1 }"/>'"><</button>
						</c:if>
		
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }" step="1">
							<c:if test="${ pi.currentPage eq p }">
								<button id="paging" disabled><c:out value="${ p }"/></button>
							</c:if>
							<c:if test="${ pi.currentPage ne p }">
								<button id="paging" onclick="location.href='${pageContext.request.contextPath}/sign/signListAll?currentPages=<c:out value="${ p }"/>'"><c:out value="${ p }"/></button>
							</c:if>
						</c:forEach>

						<c:if test="${ pi.currentPage >= pi.maxPage }">
							<button id="paging" disabled>></button>
						</c:if>
						
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<button id="paging" onclick="location.href='${pageContext.request.contextPath}/sign/signListAll?currentPages=<c:out value="${ pi.currentPage + 1 }"/>'">></button>
						</c:if>
						<button id="paging" onclick="location.href='${pageContext.request.contextPath}/sign/signListAll?currentPages=<c:out value="${ pi.maxPage }"/>'">>></button>
				</div>
			</div>
		</div>
	</div>
<!-- 왼쪽바 고정 추가 옵션 시작-->
	<script>
		$(function() {
    		var leftBar = $(".leftBar").offset().top;
    			$(window).scroll(function() {
    		var window = $(this).scrollTop();
    		if(leftBar <= window) {
    			$(".leftBar").addClass("fixed");
    		} else {
    			$(".leftBar").removeClass("fixed");
    			}
    		})
    	});
    </script>

<!-- 0. 한 건 클릭 조회 페이지로 이동 -->
	<script>
		$(".result").click(function(){
			var signCode =$(this).children().eq(0).text();
			location.href = "../sign/signSelectOne?signCode=" + signCode;
		});
	</script>
    
<!-- 1.1 남은 미결재자 조회 -->
   	<script>
		$(".signCount").mouseenter(function(){
			var base = "${pageContext.request.contextPath}";
			var tag1 = $(this);
			var tag2 = tag1.parent();
			var tag3 = tag2.prev().prev().prev().prev().prev().prev().prev().prev();
			var tag4 = tag1.next();
			var signCode = tag3.eq(0).text();
			var tableJArea = tag4.eq(0).children();
			$.ajax({
				url: base + "/signResult/signListJoinerCheck",
				type: "get",				
				data: {signCode : signCode},
				success: function(data) {
					
					if(data != 0) {
						var $signListJoinerCheck = tableJArea;
						$signListJoinerCheck.html('').addClass("box");						
						for(var key in data) {
							var $tr = $("<tr>");
							var $JoinerNameTd = $("<td class='tName'>").text(data[key].emp_info_name);
							var $JoinerClassTd = $("<td class='tClass'>").text(data[key].job_info_name);
							
							$tr.append($JoinerNameTd);
							$tr.append($JoinerClassTd);
							
							$signListJoinerCheck.append($tr);
						}
					} else {
						var $signListJoinerCheck = tableJArea;
						$signListJoinerCheck.html('').removeClass("box");
					}
				},
			});
		});
	</script>
   	<script>
		$(".signCount").mouseleave(function(){
			var tag1 = $(this);
			var tag4 = tag1.next();
			var tableJArea = tag4.eq(0).children();
			var $signListJoinerCheck = tableJArea;
				$signListJoinerCheck.html('').removeClass("box");
		});
	</script>
	
<!-- 2. 결재자 카운트 및 조회 조희 -->
   	<script>
		$(".signJoiner").mouseenter(function(){
			var base = "${pageContext.request.contextPath}";
			var tag1 = $(this);
			var tag2 = tag1.parent();
			var tag3 = tag2.prev().prev().prev().prev().prev().prev().prev();
			var tag4 = tag1.next();
			var signCode = tag3.eq(0).text();
			var tableJArea = tag4.eq(0).children();		
 			$.ajax({
				url: base + "/signResult/signListJoiner",
				type: "get",				
				data: {signCode : signCode},
				success: function(data) {
					if(data != null) {
						var $signListJoiner = tableJArea;
						$signListJoiner.html('').addClass("box");
						
						for(var key in data) {
							var $tr = $("<tr>");
							var $JoinerNameTd = $("<td class='tName'>").text(data[key].emp_info_name);
							var $JoinerClassTd = $("<td class='tClass'>").text(data[key].job_info_name);
							
							$tr.append($JoinerNameTd);
							$tr.append($JoinerClassTd);
							
							$signListJoiner.append($tr);
						}
					} else {
						console.log("error");
					}
				},
			});
		});
	</script>
   	<script>
		$(".signJoiner").mouseleave(function(){
			var tag1 = $(this);
			var tag4 = tag1.next();
			var tableJArea = tag4.eq(0).children();
			var $signListJoiner = tableJArea;
				$signListJoiner.html('').removeClass("box");
		});
		</script>
		  
<!-- 3. 참조자 카운트 및 조회 -->
   	<script>
		$(".signWatcher").mouseenter(function(){
			var base = "${pageContext.request.contextPath}";
			var tag1 = $(this);
			var tag2 = tag1.parent();
			var tag3 = tag2.prev().prev().prev().prev().prev().prev();
			var tag4 = tag1.next();
			var signCode = tag3.eq(0).text();
			var tableJArea = tag4.eq(0).children();		
			$.ajax({
				url: base + "/signResult/signListWatcher",
				type: "get",				
				data: {signCode : signCode},
				success: function(data) {
					
					if(data != null) {
						var $signListWatcher = tableJArea;
						$signListWatcher.html('').addClass("box");
						
						for(var key in data) {
							var $tr = $("<tr>");
							var $JoinerNameTd = $("<td class='tName'>").text(data[key].emp_info_name);
							var $JoinerClassTd = $("<td class='tClass'>").text(data[key].job_info_name);
							
							$tr.append($JoinerNameTd);
							$tr.append($JoinerClassTd);
							
							$signListWatcher.append($tr);
						}
					} else {
					}
				},
			});
		});
	</script>
   	<script>
		$(".signWatcher").mouseleave(function(){
			var tag1 = $(this);
			var tag4 = tag1.next();
			var tableJArea = tag4.eq(0).children();
			var $signListWatcher = tableJArea;
				$signListWatcher.html('').removeClass("box");
		});
	</script>	
</body>
</html>