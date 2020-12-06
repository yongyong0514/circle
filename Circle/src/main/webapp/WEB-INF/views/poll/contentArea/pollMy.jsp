<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollMy.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/part/toolBar.css">
<title>Insert title here</title>
</head>
<script>
	$(document).ready(function(){
		//메뉴바 내설문 부분 색상 변경
		$('#poll-my').css('color','black');
		
		//topBar title 변경
		$('.pollHomeTitle').text('내 설문');
	});

</script>

<body>
	<!-- 오늘날짜 변수화 -->
	<jsp:useBean id="now" class="java.util.Date" scope="request"/>
	<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowNum" scope="request"/>

	<div class="poll-content-container">
		<div class="poll-content-bar">
			<jsp:include page="../contentTopBar/pollHomeBar.jsp"/>
		</div>
		<div class="progress-poll-list-container">
			<div class="poll-list-bar">
				<h1>내 설문</h1>
			</div>
			<div class="data-wrap">
				<div class="table-wrap">
					<div class="poll-toolbar">
						<div class="poll-manage">
							<a class="toolbar-btn-wrap">
								<span class="toolbar-icon doc"></span>
								<span class="poll-post-toolbar-progress-btn-txt">진행</span>
							</a>
							<a class="toolbar-btn-wrap">
								<span class="toolbar-icon del"></span>
								<span class="poll-post-toolbar-progress-btn-txt">중지</span>
							</a>
							<a class="toolbar-btn-wrap">
								<span class="toolbar-icon end"></span>
								<span class="poll-post-toolbar-progress-btn-txt">마감</span>
							</a>
							<a class="toolbar-btn-wrap">
								<span class="toolbar-icon del"></span>
								<span class="poll-post-toolbar-delete-btn-txt">삭제</span>
							</a>
						</div>
						<div class="poll-post-list">
							<label>
								<select name="poll-table-length">
									<option value="20" selected="selected">20</option>
									<option value="40">40</option>
									<option value="60">60</option>
									<option value="80">80</option>
								</select>
							</label>
						</div>
					</div>
					<table class="poll-list">
						<thead>
							<tr>
								<th>
									<input type="checkbox" id="checkedAll">
								</th>
								<th>번호</th>
								<th><p>상태</p></th>
								<th>설문제목</th>
								<th>설문기간</th>
								<th>참여율</th>
							</tr>
						</thead>
						<tbody>
							
							
							<c:forEach var="item" items="${post}" varStatus="number">
								<tr>
									<td class="check">
										<input type="checkbox" name="code" value="${number.count }">
									</td>
									<!-- 행 숫자 컬럼 -->
									<td>
										<c:out value="${pageInfo.total - ((pageInfo.nowPage - 1) * cntPerPage + number.index)}"/>
									</td>
										
										<!-- 날짜 계산용 변수 초기화 -->
										<c:set var="sdat" value="${item.POLL_POST_SDAT }"></c:set>
										<c:set var="edat" value="${item.POLL_POST_EDAT }"></c:set>
										<fmt:parseDate var="sdat" value="${sdat}" pattern="yyyy-MM-dd" />
										<fmt:parseDate var="edat" value="${edat}" pattern="yyyy-MM-dd" />
										<fmt:parseNumber value="${sdat.time / (1000*60*60*24)}" integerOnly="true" var="sdatNum" scope="request"/>
										<fmt:parseNumber value="${edat.time / (1000*60*60*24)}" integerOnly="true" var="edatNum" scope="request"/>
										
									<!-- 진행/완료 등 상태 컬럼 -->
									<td class="poll-state-td">
										<c:choose>
											<c:when test="${nowNum < sdatNum}">
												<span class="poll-state temp">준비중</span>
											</c:when>
											<c:when test="${nowNum > edatNum}">
												<span class="poll-state complete">완료</span>
											</c:when>
											<c:when test="${item.POLL_POST_CLOSING eq 'Y'}">
												<span class="poll-state pause">중지</span>
											</c:when>
											<c:otherwise>
												<span class="poll-state progress">진행중</span>
											</c:otherwise>
										</c:choose>
										</span>
									</td>
									<td class="poll-title-td">
										<a>
										 	<span class="txt"><c:out value="${item.POLL_POST_NAME}"/></span>
										</a>									
									</td>
									<td class="poll-term-td"><c:out value="${item.POLL_POST_SDAT} ~ ${item.POLL_POST_EDAT}"></c:out></td>
									<td class="poll-rate-td">
										<span class="txt">
											0/5
											<strong> (20.00%)</strong>
										</span>
									</td>
									<td class="post-code" hidden="true"><c:out value="${item.POLL_POST_CODE}"></c:out></td>
									<td class="post-join" hidden="true"><c:out value="${item.item.POLL_POST_QUST_ANSW_JOIN_EMP}"></c:out></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>	
					<div class="paging-bar">
						<div class="data-page-bar">
							<a class="first page-button page-button-disabled"></a>
							<a class="previous page-button page-button-disabled"></a>
							<span>
								<a class="page-active">1</a>
								<a class="page-button">2</a>
							</span>
							<a class="next page-button"></a>
							<a class="last page-button"></a>						
						</div>
					</div>
				</div>
				<div class="search-bar poll-toolbar">
					<select name="search-type">
						<option value="title">설문제목</option>
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

</body>
</html>