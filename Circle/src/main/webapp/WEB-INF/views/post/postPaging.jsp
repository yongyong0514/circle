<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="paginate">
<c:if test="${param.currentPageNo ne param.firstPageNo }">
	<a href="javasctipt:goPage('${servletPath}', ${param.prevPageNo }, ${param.recordsPerPage })" class="prev">이전</a>
</c:if>

<span>
<c:forEach var="i" begin="#{param.startPageNo }" end="${param.endPageNo }" step="1">
	<c:choose>
		<c:when test="{i eq param.currentPageNo}">
			<b><font size=+1>
			<a href="javascript:goPage('$servletPath}', ${i}, ${param.recordsPerPage})" class="choice">${i}</a>
			</font></b>
		
		</c:when>
		<c:otherwise>
			<a href="javascript:goPage('$servletPath}', ${i}, ${param.recordsPerPage})">${i}</a>
			
		</c:otherwise>
	</c:choose>
	
	</c:forEach>
</span>


<c:if test="${param.currentPageNo ne param.finalPageno }">
			<a href="javascript:goPage('$servletPath}', ${param.nextPageNo}, ${param.recordsPerPage})">다음</a>

</c:if>

</div>


<script>
	function goPage(url, pages, lines) {
		url += '?' + "pages=" + pages + "&lines=" lines;
		
		location.href = url;
	}
</script>
</body>
</html>