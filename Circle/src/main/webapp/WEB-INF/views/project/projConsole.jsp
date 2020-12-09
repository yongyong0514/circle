<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<div>
		<div>
			<div><button class="buttonSize" onclick="location='${pageContext.request.contextPath}/project/projInsertProject'">신규 프로젝트 생성</button></div>
			<div><button class="buttonSize" onclick="location='${pageContext.request.contextPath}/project/projInsertIss'">신규 업무 생성</button></div>
			<select name="proj_type" onchange="location.href=this.value">
			<option>프로젝트로 가기</option>
				<option >프로젝트 메인</option>
	
			</select>
			<div> 업무로 가기</div>
			<div> 칸반보드</div>
			<div> TO-DO</div>
			
			
		</div>

</div>