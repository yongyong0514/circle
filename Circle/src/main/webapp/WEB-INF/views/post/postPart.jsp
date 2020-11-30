<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 전사 게시판 불러오기 -->

<table class="postParts">
<tr>
<th class="post_codes">글번호</th>
<th class="post_types">분류</th>
<th class="post_writers">작성자</th>
<th class="post_dates">작성일</th>
<th class="post_cvps">조회수</th>
</tr>
<c:forEach var="postParts" items="${postParts}">
<tr>
<td>${postParts.post_code}</td>
<td>${postParts.post_type_title}</td>
<td>${postParts.post_title}</td>
<td>${postParts.post_emp}</td>
<td>${postParts.post_wdat}</td>
<td>${postParts.post_cvp}</td>
</tr>
</c:forEach>

</table>

</body>
</html>