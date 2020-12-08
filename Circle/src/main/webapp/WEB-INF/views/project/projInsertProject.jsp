<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="form" id="project" >

	<div class="title">프로젝트 생성</div>
<form name="projInsertProject"  id="postInsert"  action="${pageContext.request.contextPath}/project/projInsertProject"  method="POST" >
		<div class="inputfield">
			<label for="pro_title">프로젝트 명</label>
			
			 <input type="text" class="input" id="post_title" name="post_title" placeholder="이름을 입력하세요">
		
		<div class="inputfield">
			<label for="post_file">파일</label> 
			<input name="post_file" id="post_file" type="file" class="input" accept="*.*" multiple="multiple">
		</div>
		<div class="inputfield">
			<label for="pro_intro">본문</label>
			<textarea class="textarea" id="pro_intro" name="pro_intro"></textarea>
		</div>
			<div class="inputfield">
			<label for="post_type">시작일 </label>
			
		</div>

		<div class="inputfield">
			<label for="post_sec">종료일</label>
			<div class="post_select">
				<label><input type="radio" id="post_sec" name="post_sec" value="Y" checked>공개</label>
				<label><input type="radio" id="post_sec" name="post_sec" value="N">비공개</label>
			</div>
		</div>

		<div class="inputfield">
			<input type="submit" value="글쓰기" class="btn" name="submit" id="submit">
			<input	type="reset" value="초기화" class="btn" name="reset" id="reset">
			<input type="button" value="돌아가기" class="btn" name="return" id="return">

		</div>
	</form>
</div>
