<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!--  본문 -->

<!-- 헤드 -->
		<div>
	<c:forEach var="projDetail" items="${projDetail}">
			<div>
			<label>제목</label><h2>${projDetail.pro_title}</h2>
			<label>담당자</label><h5>${projDetail.emp_info_name}</h5>
			<label>제작기간 </label>
<label>	시작일 : 			<fmt:formatDate value="${projDetail.pro_sdate}" pattern="yyyy.MM.dd" /></label>
				<label> 종료일 : <fmt:formatDate value="${projDetail.pro_edate}" pattern="yyyy.MM.dd" /></label><div>변경하기</div>
			</div>
		<div><label>프로젝트 설명 :</label>${projDetail.pro_intro}</div><div>수정하기</div>
	</c:forEach>
		</div>
		<div>
		<label>프로젝트 맴버 리스트 : </label><div>추가 하기</div>
		<c:forEach var="projMemberlist" items="${projMemberlist}">
		${projMemberlist.emp_info_name } ,
		</c:forEach>
		</div>
		
		<div>
		<label>프로젝트 업무</label>
			<table class="projParts">
					<tr>
						<th class="iss_title"> 참여 업무명</th>
						<th class="emp_info_name">담당자</th>
						<th class="prog_title">업무 진행단계</th>
						<th class="situ_title">업무 상황</th>
						
					</tr>

		<c:forEach var="projDetail2" items="${projDetail2}">
			<tr>

				<td><a
					href='<c:url value='/project/projIssMain?iss_code=${projDetail2.iss_code}'/>'>${projDetail2.iss_title}</a></td>
				<td>${projDetail2.emp_info_name}</td>
				<td>${projDetail2.prog_title}</td>
				<td>${projDetail2.situ_title}</td>
			</tr>
		</c:forEach>


	</table>
		</div>
	
	<!-- 바디 -->
	<div>
	
		<label>프로젝트 파일</label>
			<table class="projParts">
					<tr>
						<th class="iss_title">관련 업무명</th>
						<th class="pro_title">작성자</th>
						<th class="prog_title">파일명</th>
						<th class="situ_title">다운로드</th>
					</tr>
	<c:forEach var="projDetail3" items="${projDetail3}">
						<tr>
							<td><a
								href='<c:url value='/project/projIssMain?iss_code=${projDetail3.iss_code}'/>'>${projDetail3.iss_title}</a></td>
							<td>
							<td>
							${projDetail3.emp_info_name }
							</td>
							<td>${projDetail3.files_oname}</td>
							<td><a href="/project/projdownload?no=${projDetail3.files_code}">다운로드</a></td>
						</tr>
	</c:forEach>
				</table>
		
	</div>

<!-- 버튼 부분 -->

<div>
	<c:if test="${empNo eq viewEmpNo }">
		<c:forEach var="projDetail2" items="${projDetail2}">
			<div>
				<a
					href='<c:url value='/project/projUpdate?pro_code=${projDetail2.pro_code}'/>'>수정하기</a>
			</div>
			<div>
				<a
					href='<c:url value='/project/projDelete?pro_code=${projDetail2.pro_code}'/>'>삭제하기</a>
			</div>
		</c:forEach>
	</c:if>
	<div>
		<a
			href="${pageContext.request.contextPath}/post/postMain?nowPage=${paging.startPage}&cntPerPage=${paging.cntPerPage}">돌아가기</a>
	</div>
</div>





