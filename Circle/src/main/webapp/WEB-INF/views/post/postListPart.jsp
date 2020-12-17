<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/post/postTable.css">
	<div class="tableHearder">
					<h1>전체보기 게시판</h1>
				</div>


<!-- 개수로 보기 -->
				<div style="float: right; text-align: right;" class="select">
					<select id="cntPerPage" name="sel" onchange="selChange()">
						<option value="5" selected
							<c:if test="${postCount.cntPerPage == 5}">selected</c:if>>5줄
							보기</option>
						<option value="10"
							<c:if test="${postCount.cntPerPage == 10}">selected</c:if>>10줄
							보기</option>
						<option value="15"
							<c:if test="${postCount.cntPerPage == 15}">selected</c:if>>15줄
							보기</option>
						<option value="20"
							<c:if test="${postCount.cntPerPage == 20}">selected</c:if>>20줄
							보기</option>
					</select>
				</div>

<!-- 게시판 불러오기 -->


<table class="post" >
<thead>
		<tr>
			<th class="post_codes" scope="cols" style="width: 10%;">글번호</th>
			<th class="post_types" scope="cols" style="width: 50%;">제 목</th>
			<th class="post_writers" scope="cols" style="width: 10%;">작성자</th>
			<th class="post_dates" scope="cols" style="width: 20%;">작성일</th>
			<th class="post_cvps" scope="cols" style="width: 10%;">조회수</th>
		</tr>
		</thead>
	<c:forEach var="postSelect2" items="${postSelect2}">
	<tbody>
		<tr>
			<td scope="row">${postSelect2.post_code}</td>
			<td><a href='<c:url value='/post/postView?post_code=${postSelect2.post_code}'/>'>${postSelect2.post_title}</a></td>
			<td>${postSelect2.emp_info_name}</td>
			<td>${postSelect2.post_wdat}</td>
			<td>${postSelect2.post_cvp}</td>
		</tr>
		</tbody>
	</c:forEach>
	</table>
<!-- 뷰 페이징 처리 -->		
		<div style="text-align: center;" class="pagination">

<c:set var="Post"/>
<c:if test="${paging.startPage != 1}">
<a href="${pageContext.request.contextPath}/post/postList/${url}?nowPage=${paging.startPage - 1}&cntPerPage${paging.cntPerPage}">&lt;</a>
	<a href="post/postList/${url}?nowPage=${paging.startPage - 1}&cntPerPage${paging.cntPerPage}">&lt;</a>

</c:if>
<c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p">
<c:choose>
<c:when test="${p == paging.nowPage }">
<b>${p}</b>
</c:when>
<c:when test="${ p != paging.nowPage }">
<a href="${pageContext.request.contextPath}/post/postList/${url}?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
</c:when>

</c:choose>
</c:forEach>
<c:if test="${paging.endPage != paging.lastPage }">
	<a href="${pageContext.request.contextPath}/post/postList/${url}?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
</c:if>

</div>
<br><!-- 검색 -->

				<div id="postSearch" style="text-align: center;">
					<form id="searchForm" method="get"
						action="${pageContext.request.contextPath}/post/postSearch">
						<div class="postSearch">
							<select name="type">
								<option value="" selected>선택하기</option>
								<option value="post_title">제목</option>
								<option value="post_comt">내용</option>
								<option value="emp_info_name">작성자</option>

							</select>
						</div>
						<div class="wrapper">
							<div class="container">
								<input type="search" class="input" name="keyword"
									placeholder="Search"> <input type="submit"
									id="searchBtn btn" class="close-btn" value="검색">
							</div>
						</div>

					</form>

				</div>

