<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="form" id="post" >

	<div class="title">게시글 작성</div>

<%
String emp_id = null;

if(session.getAttribute("emp_id_emp_no") != null){
	emp_id = (String) session.getAttribute("emp_id_emp_no");
}

%>
	<form name="postInsert"  id="postInsert"  method="post" action="{path}/post/postMain">
		<div class="inputfield">
			<label for="post_title">제목</label>
			
			 <input type="text" class="input" id="post_title" name="post_title" placeholder="제목을 작성해주세요">
		</div>
		<!-- <div class="inputfield">
			<label for="post_file">파일</label> 
			<input name="post_file" id="post_file" type="file" class="input" accept="*.*" multiple="multiple">
		</div> -->
		<div class="inputfield">
			<label for="post_comt">본문</label>
			<textarea class="textarea" id="post_comt" name="post_comt"></textarea>
		</div>

		<div class="inputfield">
			<label for="post_sec">공개</label>
			<div class="post_select">
				<label><input type="radio" id="post_sec" name="post_sec" value="Y" checked>공개</label>
				<label><input type="radio" id="post_sec" name="post_sec" value="N">비공개</label>
			</div>

		</div>

		<div class="inputfield">
			<input type="submit" value="글쓰기" class="btn" name="submit" id="btnSubmit" onclick="submit(); return false;">
			<input	type="reset" value="초기화" class="btn" name="reset" id="reset">
			<input type="button" value="돌아가기" class="btn" name="return" id="return">

		</div>
	</form>
</div>
