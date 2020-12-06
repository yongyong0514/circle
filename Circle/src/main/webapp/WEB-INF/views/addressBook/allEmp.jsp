<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/addressBook/allEmp.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
	<div class="wrap">
		<div class="header">
			<jsp:include page="../common/menuTopBar.jsp" />
			<jsp:include page="../common/menuAlertBar.jsp" />
		</div>
		<div class="leftBar">
			<jsp:include page="common/addressBookLeftBar.jsp" />
		</div>
		<div class="organChart">
			<c:import url="/organChart/getInfo" />
		</div>
		<div class="container">
			<div class="content">
				<!-- 주소록 이름 -->
				<h1>전사주소록(주소록 이름)</h1>
				<button value="alertAll">이 그룹에게 전체쪽지 보내기</button>
				<br>
				<br>
				<form class="searchAddress" action="${pageContext.request.contextPath}/addressBook/allEmp">
					<!-- 검색창 시작 -->
					<input class="name" type="text" name="name" placeholder="이름(표시명)" value="${name }"/>
					<input class="email" type="text" name="email" placeholder="이메일 주소" value="${email }"/>
					<input class="tel" type="text" name="tel" placeholder="휴대전화번호" value="${tel }"/>
					<input type="submit" value="검색하기"></input>&nbsp;
					<button value="insert">추가하기</button>
					<!-- 검색창 끝 -->

					&nbsp;
					<!-- 주소록 출력설정 시작-->
 					<button value="field">필드설정</button>
					&nbsp; <label>페이지 당 출력개수</label>
					<select class="perPage" name="perPage"  onchange="movePerPage(this)">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
					</select>
					<!-- 주소록 출력설정 끝 -->

					<br> <br>
					<!-- 주소록 색인 시작 -->
					<table class="indexTable">
						<tr>
							<td><a class="index" href="#">전체</a></td>
							<td><a class="index" href="#">ㄱ</a></td>
							<td><a class="index" href="#">ㄴ</a></td>
							<td><a class="index" href="#">ㄷ</a></td>
							<td><a class="index" href="#">ㄹ</a></td>
							<td><a class="index" href="#">ㅁ</a></td>
							<td><a class="index" href="#">ㅂ</a></td>
							<td><a class="index" href="#">ㅅ</a></td>
							<td><a class="index" href="#">ㅇ</a></td>
							<td><a class="index" href="#">ㅈ</a></td>
							<td><a class="index" href="#">ㅊ</a></td>
							<td><a class="index" href="#">ㅋ</a></td>
							<td><a class="index" href="#">ㅌ</a></td>
							<td><a class="index" href="#">ㅍ</a></td>
							<td><a class="index" href="#">ㅎ</a></td>
							<td><a class="index" href="#">etc</a></td>
						<tr>
					</table>
					<!-- 주소록 색인 끝 -->
					
					<!-- 주소록 테이블 시작 -->
					<table class="addressListTable">
						<tr>
							<th><input type="checkbox"></th>
				
							<!-- c:forEach -->
							<!-- 사용자 필드 설정에 따라 변경 -->
							<th>이름(표시명)<a href="#">▲</a><a href="#">▼</a></th>
							<th>휴대전화<a href="#">▲</a><a href="#">▼</a></th>
							<th>이메일<a href="#">▲</a><a href="#">▼</a></th>
							<th>회사명<a href="#">▲</a><a href="#">▼</a></th>
						</tr>
				
						<!-- 주소 리스트 시작 -->
				 		<c:forEach var="AddressInfo" items="${map.aList }">
							<tr>
								<td><input type="checkbox"></td>
								<td><img class="thumbnail" src="#">&nbsp;
									<c:out value="${AddressInfo.name }"/>	
								</td>
								<td><c:out value="${AddressInfo.tel }"/></td>
								<td><c:out value="${AddressInfo.email}"/></td>
								<td><c:out value="${AddressInfo.cmpName}"/></td>
							</tr>
						</c:forEach>
						<!-- 주소 리스트 끝 -->
				 
					</table>
					<!-- 주소록 테이블 끝 -->
					<br><br>
					
					<!-- 페이지 이동 목록 시작 -->					
					<div class="changeBtn">
						<c:if test="${map.pInfo.nowPage != 1 }">
							<span onclick="moveAll(${map.pINfo.nowPage-1},${map.pInfo.perPage}, ${name }, ${email }, ${tel });">
								<i class='fas fa-angle-left'></i>
							</span>			
						</c:if>
						
						<c:forEach var="page" begin="${map.pInfo.startPage }" end="${map.pInfo.endPage}">
							<c:choose>
								<c:when test="${ page eq map.pInfo.nowPage }">
									<span class="nowPageNum">${page}</span>
								</c:when>
								
								<c:when test="${ page != map.pInfo.nowPage }">
									<span onclick="moveAll(${page},${map.pInfo.perPage}, ${name }, ${email }, ${tel });">${page}</span>	
								</c:when>
							</c:choose>
						</c:forEach>		
				
						<c:if test="${map.pInfo.endPage != map.pInfo.maxPage}">
							<span onclick="moveAll(${map.pInfo.nowPage+1},${map.pInfo.perPage}, ${name }, ${email }, ${tel });">
								<i class='fas fa-angle-right'></i>
							</span>			
						</c:if>
					</div>
					<!-- 페이지 이동 목록 끝 -->	

				</form>
			</div>
		</div>
	</div>

	<script>
		<!-- 왼쪽바 고정 추가 옵션 시작-->
		$(function() {
			var leftBar = $(".leftBar").offset().top;
			$(window).scroll(function() {
				var window = $(this).scrollTop();
				if (leftBar <= window) {
					$(".leftBar").addClass("fixed");
				} else {
					$(".leftBar").removeClass("fixed");
				}
			})
			
			<!-- 페이지 당 출력 개수 선택 표시 -->
			switch(${map.pInfo.perPage}){
			case 10: 
				$(".perPage option:eq(0)").prop("selected",true); break;	
			case 20:
				$(".perPage option:eq(1)").prop("selected",true); break;	
			case 50:
				$(".perPage option:eq(2)").prop("selected",true); break;	
			}
			
			<!-- 현재 페이지 강조 -->
			$(".nowPageNum").css({"font-size":"large", "color":"#0072C6"});
		
		});
		
		
		function movePerPage(obj){
			location.href="${pageContext.request.contextPath}/addressBook/allEmp?perPage=" + obj.value;
		};
		
		function moveAll(nowPage, perPage, name, email, tel){
			var url = "nowPage=" + nowPage + "&perPage" + perPage;
			url.concat(nowPage, "&perPage=", perPage);
			
			if(name != null){
				url += "&name=" + name;
			}
			
			if(email != null){
				url += "&email=" + email;
			}
			
			if(tel != null){
				url += "&tel=" + tel;
			}
			
			console.log(url);
			
			location.href="${pageContext.request.contextPath}/addressBook/allEmp?" + url;
		}
		
	</script>
	
	
	
</body>
</html>