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

<!-- 게시판 불러오기 -->
<table class="postParts">
	<tr>
		<th class="post_codes">글번호</th>
		<th class="post_types">분류</th>
		<th class="post_writers">작성자</th>
		<th class="post_dates">작성일</th>
		<th class="post_cvps">조회수</th>
	</tr>
	<c:forEach var="postSelect" items="${postSelect}">
		<tr>
			<td>${postSelect.post_code}</td>
			<td><a href='<c:url value='/post/postView?post_code=${postSelect.post_code}'/>'>${postSelect.post_title}</a></td>
			<td>${postSelect.emp_info_name}</td>
			<td>${postSelect.post_wdat}</td>
			<td>${postSelect.post_cvp}</td>
		</tr>
	</c:forEach>

</table>

<!--  뷰페이징처리 -->
<div>
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

<!--  검색 -->
<div>
<div>
<form id="postSearch" action="/postList/${url}" method="get">
<select name="searchType">
<option value="">전체보기</option>
<option value="T">제목</option>
<option value="C">내용</option>
<option value="W">작성자</option>
<option value="TC">제목과 내용</option>
</select>
<input type="text" name="keyword" value="${paging.keyword}">
<input type="hidden" name="keyword" value="${paging.nowPage}">
<input type="hidden" name="keyword" value="${paging.cntPage}">
<input type="hidden" name="keyword" value="${paging.type}">
<input type="hidden" name="keyword" value="${paging.keyword}">
</form>
</div>
</div>



<script>
var searchForm = ${"#searchForm"};


$("#searchForm button").on("click",function(e) {
    // 화면에서 키워드가 없다면 검색을 하지 않도록 제어
	if (!searchForm.find("option:selected").val()) {
		alert("검색종류를 선택하세요");
		return false;
	}

	if (!searchForm.find("input[name='keyword']").val()) {
		alert("키워드를 입력하세요");
		return false;
	}

    // 페이지 번호를 1로 처리
	searchForm.find("input[name='nowPage']").val("1");

    // 폼 태그의 전송을 막음
	e.preventDefault();

	searchForm.submit();

});

</script>