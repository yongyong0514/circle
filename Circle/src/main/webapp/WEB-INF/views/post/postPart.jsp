<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="postList?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>

<!-- 개수로 보기 -->
<div style="float: right;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div>

<!-- 전사 게시판 불러오기 -->

<table class="postParts">
	<tr>
		<th class="post_codes">글번호</th>
		<th class="post_types">분류</th>
		<th class="post_writers">작성자</th>
		<th class="post_dates">작성일</th>
		<th class="post_cvps">조회수</th>
	</tr>
	<c:forEach var="Post" items="${postParts}">
		<tr>
			<td>${Post.post_code}</td>
			<td><a href='<c:url value='/post/postView?post_code=${Post.post_code}'/>'>${Post.post_title}</a></td>
			<td>${Post.emp_info_name}</td>
			<td>${Post.post_wdat}</td>
			<td>${Post.post_cvp}</td>
		</tr>
	</c:forEach>

</table>

<!--  뷰페이징처리 -->

<div>
<c:set var="Post"/>
<c:if test="${postPaging.startPage != 1}">
<a href="${pageContext.request.contextPath}/post/postList/notice?nowPage=${postPaging.startPage - 1}&cntPerPage${postPaging.cntPerPage}">&lt;</a>
	<a href="/postList?nowPage=${postPaging.startPage - 1}&cntPerPage${postPaging.cntPerPage}/">&lt;</a>

</c:if>
<c:forEach begin="${postPaging.startPage }" end="${postPaging.endPage}" var="p">
<c:choose>
<c:when test="${p == postPaing.nowPage }">
<b>${p}</b>
</c:when>
<c:when test="${ p != postPaging.nowPage }">
<a href="/postList?nowPage=${p}&cntPerPage=${postPaging.cntPerPage}/">${p}</a>
</c:when>

</c:choose>
</c:forEach>
<c:if test="${postPaging.endPage != postPaging.lastPage }">
	<a href="/postList?nowPage=${postPaging.endPage+1}&cntPerPage=${postPaging.cntPerPage}/">&gt;</a>
</c:if>

</div>