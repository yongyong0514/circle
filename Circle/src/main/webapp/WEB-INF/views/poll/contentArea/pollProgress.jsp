<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollHome.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollProgress.css">
<title>Insert title here</title>
</head>


<body>
	<div class="poll-content-container">
		<div class="poll-content-bar">
			<jsp:include page="../contentTopBar/pollHomeBar.jsp"/>
		</div>
		<div class="progress-poll-list-container">
			<div class="poll-list-bar">
				<h1>진행중인 설문</h1>
			</div>
			<div class="data-wrap">
				<div class="table-wrap">
					<table class="poll-list">
						<thead>
							<tr>
								<th>번호</th>
								<th><p>상태</p></th>
								<th>설문제목</th>
								<th>설문기간</th>
								<th>작성자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${post}" varStatus="number">
								<tr>
									<!-- 행 숫자 컬럼 -->
									<td>
										<c:out value="${number.count}"/>
									</td>
									<!-- 참여 미참여 상태 컬럼 -->
									<td class="poll-state-td">
										<c:choose>
											<c:when test="${item.POLL_POST_QUST_ANSW_JOIN_EMP eq 0}">
												<span class="poll-state-span-no-attendance">
											</c:when>
											<c:when test="${item.POLL_POST_QUST_ANSW_JOIN_EMP ne 0}">
												<span class="poll-state-span-attendance">
											</c:when>
										</c:choose>
											<c:choose>
												<c:when test="${item.POLL_POST_QUST_ANSW_JOIN_EMP eq 0}">
													<c:out value="미참여"></c:out>
												</c:when>
												<c:when test="${item.POLL_POST_QUST_ANSW_JOIN_EMP ne 0}">
													<c:out value="참여 완료"></c:out>
												</c:when>
											</c:choose>
										</span>
									</td>
									<td class="poll-title-td">
										<a>
											<span class="txt"><c:out value="${item.POLL_POST_NAME}"/></span>
										</a>									
									</td>
									<td class="poll-term-td"><c:out value="${item.POLL_POST_SDAT} ~ ${item.POLL_POST_EDAT}"></c:out></td>
									<td class="poll-writer-td"><c:out value="${item.EMP_INFO_NAME}  ${item.JOB_INFO_NAME}"></c:out></td>
									<td class="post-code" hidden="true"><c:out value="${item.POLL_POST_CODE}"></c:out></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>	
					<div class="pageInfo-bar">
						<div class="data-page-bar">
							<!-- 처음페이지로 가는 버튼 -->
							<c:choose>
								<c:when test="${pageInfo.startPage ne pageInfo.nowPage}">
									<a class="first page-button" href="<c:out value="${pageContext.request.contextPath}/poll/progress?nowPage=${pageInfo.startPage}&cntPerPage=${pageInfo.cntPerPage}&searchTitle=${pageInfo.searchTitle}%searchWriter=${pageInfo.searchWriter}"/>"></a>
								</c:when>
								<c:otherwise>
									<a class="first page-button page-button-disabled"></a>
								</c:otherwise>
							</c:choose>
							
							<!-- 이전페이지로 가는 버튼 -->
							<c:choose>
								<c:when test="${pageInfo.startPage ne 1 }">
									<a class="previous page-button " href="${pageContext.request.contextPath}/poll/progress?nowPage=${pageInfo.startPage - 1 }&cntPerPage=${pageInfo.cntPerPage}&searchTitle=${pageInfo.searchTitle}%searchWriter=${pageInfo.searchWriter}"></a>
								</c:when>
								<c:otherwise>
									<a class="previous page-button page-button-disabled"></a>
								</c:otherwise>
							</c:choose>
							
							<!-- 페이지 버튼 숫자 -->
							<span>
								<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="p">
									<c:choose>
										<c:when test="${p eq pageInfo.nowPage }">
											<a class="page-active">${p}</a>
										</c:when>
										<c:when test="${p ne pageInfo.nowPage }">
											<a class="page-button" href="<c:out value="${pageContext.request.contextPath}/poll/progress?nowPage=${p}&cntPerPage=${pageInfo.cntPerPage}&searchTitle=${pageInfo.searchTitle}%searchWriter=${pageInfo.searchWriter}"/>">${p}</a>						
										</c:when>
									</c:choose>
								</c:forEach>
							</span>
							
							<!-- 다음 페이지 버튼 -->
							<c:choose>
								<c:when test="${pageInfo.endPage ne pageInfo.lastPage}">
									<a class="next page-button" href="${pageContext.request.contextPath}/poll/progress?nowPage=${pageInfo.endPage+1}&cntPerPage=${pageInfo.cntPerPage}&searchTitle=${pageInfo.searchTitle}%searchWriter=${pageInfo.searchWriter}"></a>
								</c:when>
								<c:otherwise>
									<a class="next page-button page-button-disabled"></a>
								</c:otherwise>
							</c:choose>
							
							<!-- 마지막 페이지 버튼 조건 -->
							<c:choose>
								<c:when test="${pageInfo.lastPage ne pageInfo.nowPage}">
									<a class="last page-button" href="${pageContext.request.contextPath}/poll/progress?nowPage=${pageInfo.lastPage}&cntPerPage=${pageInfo.cntPerPage}&searchTitle=${pageInfo.searchTitle}%searchWriter=${pageInfo.searchWriter}"></a>						
								</c:when>
								<c:otherwise>
									<a class="last page-button page-button-disabled"></a>						
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				
				<div class="search-bar">
					<select name="search-type">
						<option value="title">설문제목</option>
						<option value="writer">작성자</option>
					</select>
					<section class="search-box">
						<div class="search-wrap">
							<input class="search-box" type="text" name="keyword" placeholder="검색">
							<span class="search-btn" title="search"></span>
						</div>
					</section>
				</div>
			</div>
		</div>

	</div>
	
	<script>
		$(document).ready(function(){
			//메뉴바 진행설문 부분 색상 변경
			$('#poll-progress').css('color','black');
			
			//topBar title 변경
			$('.pollHomeTitle').text('진행중인 설문');
			
			//검색버튼 클릭시 기능
			$('.search-bar .search-btn').on('click', function(){
				
				//검색어 가공후 전역변수에 저장(searchKeyword)
				keywordProcessing();
				
				//주소 리턴
			 	location.href="${pageContext.request.contextPath}/poll/progress?" + searchKeyword;
				
			})
		});
		
		/************************ 함수 부분 ***************************/
		
		//검색타입에 맞게 가공된 검색어 전역변수화("type=keyword")
		var searchKeyword;
		
		//검색 옵션 리턴(title/writer)
		function extractSearchType(){
			return $('.search-bar select[name=search-type]').val();
		}
		
		//검색어 리턴
		function extractKeyword(){
			return $('section.search-box input.search-box').val();
		}
		
		//검색어 추출/ 타입에맞게 가공
		function keywordProcessing(){
			//검색 타입 추출
			var searchType = extractSearchType();
			
			//검색어 추출
			var keyword = extractKeyword();
			
			console.log(searchType);
			console.log(keyword);
			
			//검색타입에 맞춰 검색어 전송 주소 생성
		 	switch(searchType){ 
		 	case 'title' : 	searchKeyword = "searchTitle=" + keyword; break;
		 	case 'writer' : searchKeyword = "searchWriter=" + keyword; break;
		 	}
		}
		
		/* 
		
		//첫페이지로 가는 버튼 클릭시 기능
		function firshPageButton(){
			var searchKeyword = keywordProcessing();
			console.log(searchKeyword);
			var url = "${pageContext.request.contextPath}/poll/progress?nowPage=" + ${pageInfo.startPage} + "&cntPerPage=" + ${pageInfo.cntPerPage} + "&" + searchKeyword;
			location.href = url;
		}
		//이전페이지로 가는 버튼 클릭
		function pervPageButton(){
			var searchKeyword = keywordProcessing();
			location.href = "${pageContext.request.contextPath}/poll/progress?nowPage=" + ${pageInfo.startPage - 1 } + "&cntPerPage=" + ${pageInfo.cntPerPage} + "&" + searchKeyword;
		}
		//다음페이지 버튼 클릭
		function nextPageButton(){
			var searchKeyword = keywordProcessing();
			location.href = "${pageContext.request.contextPath}/poll/progress?nowPage=" + ${pageInfo.endPage + 1 } + "&cntPerPage=" + ${pageInfo.cntPerPage} + "&" + searchKeyword;
		}
		//마지막 페이지 버튼 클릭
		function lastPageButton(){
			var searchKeyword = keywordProcessing();
			location.href = "${pageContext.request.contextPath}/poll/progress?nowPage=" + ${pageInfo.lastPage} + "&cntPerPage=" + ${pageInfo.cntPerPage} + "&" + searchKeyword;
		}
		//페이지 숫자 버튼 클릭
		function pageNumButton(){
			var searchKeyword = keywordProcessing();
			location.href = "${pageContext.request.contextPath}/poll/progress?nowPage=" + ${p} + "&cntPerPage=" + ${pageInfo.cntPerPage} + "&" + searchKeyword;
		}
		 */
	</script>
</body>
</html>