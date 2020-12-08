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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/part/toolBar.css">
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
					<div class="poll-toolbar">
						<div class="poll-post-list">
							<label>
								<select name="poll-table-length">
									<option value="1" <c:if test="${pageInfo.cntPerPage eq '1'}">selected</c:if>>1</option>
									<option value="2" <c:if test="${pageInfo.cntPerPage eq '2'}">selected</c:if>>2</option>
									<option value="3" <c:if test="${pageInfo.cntPerPage eq '3'}">selected</c:if>>3</option>
									<option value="5" <c:if test="${pageInfo.cntPerPage eq '5'}">selected</c:if>>5</option>
									<option value="10" <c:if test="${pageInfo.cntPerPage eq '10'}">selected</c:if>>10</option>
									<option value="20" <c:if test="${pageInfo.cntPerPage eq '20'}">selected</c:if>>20</option>
									<option value="40" <c:if test="${pageInfo.cntPerPage eq '40'}">selected</c:if>>40</option>
									<option value="60" <c:if test="${pageInfo.cntPerPage eq '60'}">selected</c:if>>60</option>
									<option value="80" <c:if test="${pageInfo.cntPerPage eq '80'}">selected</c:if>>80</option>
								</select>
							</label>
						</div>
					</div>
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
										<c:out value="${pageInfo.total - ((pageInfo.nowPage - 1) * cntPerPage + number.index)}"/>
									</td>
									<!-- 참여 미참여 상태 컬럼 -->
									<td class="poll-state-td">
										<c:choose>
											<c:when test="${item.POLL_POST_QUST_ANSW_JOIN_EMP eq 0}">
												<span class="poll-state-span-no-attendance">
													<c:out value="미참여"></c:out>
												</span>
											</c:when>
											<c:otherwise>
												<span class="poll-state-span-attendance">
													<c:out value="참여 완료"></c:out>
												</span>
											</c:otherwise>
										</c:choose>
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
									<c:choose>
										<c:when test="${not empty pageInfo.searchTitle }">
											<a class="first page-button" href="<c:out value="${pageContext.request.contextPath}/poll/progress?nowPage=${pageInfo.startPage}&cntPerPage=${pageInfo.cntPerPage}&searchTitle=${pageInfo.searchTitle}"/>"></a>
										</c:when>
										<c:when test="${not empty pageInfo.searchWriter }">
											<a class="first page-button" href="<c:out value="${pageContext.request.contextPath}/poll/progress?nowPage=${pageInfo.startPage}&cntPerPage=${pageInfo.cntPerPage}%searchWriter=${pageInfo.searchWriter}"/>"></a>
										</c:when>
										<c:otherwise>
											<a class="first page-button" href="<c:out value="${pageContext.request.contextPath}/poll/progress?nowPage=${pageInfo.startPage}&cntPerPage=${pageInfo.cntPerPage}"/>"></a>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<a class="first page-button page-button-disabled"></a>
								</c:otherwise>
							</c:choose>
							
							<!-- 이전페이지로 가는 버튼 -->
							<c:choose>
								<c:when test="${pageInfo.startPage ne 1 }">
									<c:choose>
										<c:when test="${not empty pageInfo.searchTitle }">
											<a class="previous page-button " href="${pageContext.request.contextPath}/poll/progress?nowPage=${pageInfo.startPage - 1 }&cntPerPage=${pageInfo.cntPerPage}&searchTitle=${pageInfo.searchTitle}"></a>
										</c:when>
										<c:when test="${not empty pageInfo.searchWriter }">
											<a class="previous page-button " href="${pageContext.request.contextPath}/poll/progress?nowPage=${pageInfo.startPage - 1 }&cntPerPage=${pageInfo.cntPerPage}%searchWriter=${pageInfo.searchWriter}"></a>
										</c:when>
										<c:otherwise>
											<a class="previous page-button " href="${pageContext.request.contextPath}/poll/progress?nowPage=${pageInfo.startPage - 1 }&cntPerPage=${pageInfo.cntPerPage}"></a>
										</c:otherwise>
									</c:choose>
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
											<c:choose>
												<c:when test="${not empty pageInfo.searchTitle }">
													<a class="page-button" href="<c:out value="${pageContext.request.contextPath}/poll/progress?nowPage=${p}&cntPerPage=${pageInfo.cntPerPage}&searchTitle=${pageInfo.searchTitle}"/>">${p}</a>						
												</c:when>
												<c:when test="${not empty pageInfo.searchWriter }">
													<a class="page-button" href="<c:out value="${pageContext.request.contextPath}/poll/progress?nowPage=${p}&cntPerPage=${pageInfo.cntPerPage}%searchWriter=${pageInfo.searchWriter}"/>">${p}</a>						
												</c:when>
												<c:otherwise>
													<a class="page-button" href="<c:out value="${pageContext.request.contextPath}/poll/progress?nowPage=${p}&cntPerPage=${pageInfo.cntPerPage}"/>">${p}</a>						
												</c:otherwise>
											</c:choose>
										</c:when>
									</c:choose>
								</c:forEach>
							</span>
							
							<!-- 다음 페이지 버튼 -->
							<c:choose>
								<c:when test="${pageInfo.endPage ne pageInfo.lastPage}">
									<c:choose>
										<c:when test="${not empty pageInfo.searchTitle }">
											<a class="next page-button" href="${pageContext.request.contextPath}/poll/progress?nowPage=${pageInfo.endPage + 1}&cntPerPage=${pageInfo.cntPerPage}&searchTitle=${pageInfo.searchTitle}"></a>
										</c:when>
										<c:when test="${not empty pageInfo.searchWriter }">
											<a class="next page-button" href="${pageContext.request.contextPath}/poll/progress?nowPage=${pageInfo.endPage + 1}&cntPerPage=${pageInfo.cntPerPage}%searchWriter=${pageInfo.searchWriter}"></a>
										</c:when>
										<c:otherwise>
											<a class="next page-button" href="${pageContext.request.contextPath}/poll/progress?nowPage=${pageInfo.endPage + 1}&cntPerPage=${pageInfo.cntPerPage}"></a>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<a class="next page-button page-button-disabled"></a>
								</c:otherwise>
							</c:choose>
							
							<!-- 마지막 페이지 버튼 조건 -->
							<c:choose>
								<c:when test="${pageInfo.lastPage ne pageInfo.nowPage}">
									<c:choose>
										<c:when test="${not empty pageInfo.searchTitle }">
											<a class="last page-button" href="${pageContext.request.contextPath}/poll/progress?nowPage=${pageInfo.lastPage}&cntPerPage=${pageInfo.cntPerPage}&searchTitle=${pageInfo.searchTitle}"></a>						
										</c:when>
										<c:when test="${not empty pageInfo.searchWriter }">
											<a class="last page-button" href="${pageContext.request.contextPath}/poll/progress?nowPage=${pageInfo.lastPage}&cntPerPage=${pageInfo.cntPerPage}%searchWriter=${pageInfo.searchWriter}"></a>						
										</c:when>
										<c:otherwise>
											<a class="last page-button" href="${pageContext.request.contextPath}/poll/progress?nowPage=${pageInfo.lastPage}&cntPerPage=${pageInfo.cntPerPage}"></a>						
										</c:otherwise>
									</c:choose>
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
							<c:choose>
								<c:when test="${not empty pageInfo.searchTitle}">
									<input class="search-box" type="text" name="keyword" placeholder="검색" value="${pageInfo.searchTitle}">
								</c:when>
								<c:when test="${not empty pageInfo.searchWriter}">
									<input class="search-box" type="text" name="keyword" placeholder="검색" value="${pageInfo.searchWriter}">
								</c:when>
								<c:otherwise>
									<input class="search-box" type="text" name="keyword" placeholder="검색">
								</c:otherwise>
							</c:choose>
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
			
			//페이지당 post출력 개수 변경
			$('.poll-toolbar .poll-post-list select[name=poll-table-length]').on('change', function(){
				var i = $(this).val();
				location.href = "${pageContext.request.contextPath}/poll/progress?cntPerPage=" + i;
			});
			
			//설문 post 클릭시
			$('table.poll-list tbody tr td.poll-title-td a').on('click', function(){
				/* 설문코드 추출 */
				var code = $(this).parent().parent().find('.post-code').text();
				
				/* 참여 여부 확인 */
				var attend = $(this).parent().parent().find('.poll-state-td span').prop("class");
				
				/* 참여 -> 결과창, 불참 -> 참여창 */
				switch(attend) {
				case 'poll-state-span-no-attendance' : location.href = "${pageContext.request.contextPath}/poll/post?postCode=" + code;
				default : location.href = "${pageContext.request.contextPath}/poll/result?postCode=" + code;
				}
			});
			
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
			
			//검색타입에 맞춰 검색어 전송 주소 생성
		 	switch(searchType){ 
		 	case 'title' : 	searchKeyword = "searchTitle=" + keyword; break;
		 	case 'writer' : searchKeyword = "searchWriter=" + keyword; break;
		 	}
		}
		
	</script>
</body>
</html>