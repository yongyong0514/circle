<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 검색 -->

<!-- 검색 -->

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
<input type="text" name="keyword" value="${postSearch.keyword}">
<input type="hidden" name="keyword" value="${postSearch.keyword}">
<input type="hidden" name="keyword" value="${postSearch.keyword}">
</form>
</div>
</div>

	<form action="postList/${url}}" method="get">
	<label for="opt">검색조건</label>
	<select name="opt" id="opt">
	<option value="post_emp" <c:if test="${opt eq 'post_emp'}"> selected</c:if>>글쓴이</option>
	<option value="post_title" <c:if test="${opt eq 'post_title'}"> selected</c:if>>제목</option>
	<option value="post_titlecomt" <c:if test="${opt eq 'post_titlecomt'}"> selected</c:if>>제목+내용</option>
	<option value="post_comt" <c:if test="${opt eq 'post_comt'}"> selected</c:if>>내용</option>
	</select>
	<input type="text" size="20" name="keyword" id="keyword" value="${keyword }" />&nbsp;
	<input type="submit" value="검색하기"/>
	</form>