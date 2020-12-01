<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
			<td>${Post.post_title}</td>
			<td>${Post.emp_info_name}</td>
			<td>${Post.post_wdat}</td>
			<td>${Post.post_cvp}</td>
		</tr>
	</c:forEach>

</table>
