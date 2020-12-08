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
			<label for="pro_sdate">시작일 </label>
			<label>날짜 선택
			<!-- 만약 체크가 되어있다면 -->
			<input type="date" id="pro_sdate" name="pro_sdate" ></label>
			
		</div>

		<div class="inputfield">
<label for="pro_edate">종료일 </label>
			<!-- 만약 체크가 되어있다면 --><label for="pro_edate">날짜 선택
			<input type="date" id="pro_edate" name="pro_edate" ></label>
			</div>
		</div>
	<div class="inputfield">
<label for="pro_manager">담당자 </label>
		
<select id="pro_manager" name="pro_manager">
<option>담당자 선택</option>

<option id="pro_manager"  value="${empNo}">작성자</option>
<c:forEach var="projMember" items="${projMember }">
<option id="pro_manager"  value="${projMember.emp_info_emp_no }">${projMember.dept_info_name}  ${projMember.emp_info_name }</option>
</c:forEach>
</select>		
			</div>
	
		<div class="inputfield">
			<input type="submit" value="글쓰기" class="btn" name="submit" id="submit">
			<input	type="reset" value="초기화" class="btn" name="reset" id="reset">
			<input type="button" value="돌아가기" class="btn" name="return" id="return">

		</div>
	</form>
</div>
