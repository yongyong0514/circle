<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollHome.css">
<title>Insert title here</title>
</head>
<script>
	$(document).ready(function(){
		
		//미참여 설문 클릭
		$('.poll-state-span-no-attendance').parent().parent().on('click', function(){
			location.replace("${pageContext.request.contextPath}/poll/pollMain/post")			
		});	
		
		//참여한 설문 클릭
		$('.poll-state-span-attendance').parent().parent().on('click', function(){
			location.replace("${pageContext.request.contextPath}/poll/pollMain/result")			
		});	
		
		
		/* 상세보기 기능 */
		
		/* 행 클릭시 기능 */ 
		$('tbody tr').on('click', function(){
			/* 게시글 postCode 추출 */
			postCode = $(this).find('.post-code').text();
			
			/* 게시글 참여여부 추출 */
			var joinOrNot = $(this).find('.poll-state-td span').prop('class');
			
			/* 설문 만료날짜 추출 */
			var endDate = Date.parse($(this).find('.poll-term-td').text().substr(13,10));
			
			/* 설문 마감여부 추출 */
			var closing = $(this).find('.post-closing').text();
			console.log(closing);
			
			/* 현재날짜 변수화 */
			var sysdate = Date.parse(nowDate());
			
			
			/* 조건 비교후 컨트롤러로 postCode 전송 */
/*  			if(joinOrNot == 'poll-state-span-no-attendance' && sysdate < endDate && closiong != 'Y'){
				location.href = "${pageContext.request.contextPath}/poll/post?postCode=" + postCode;
			} else {
				location.href = "${pageContext.request.contextPath}/poll/result?postCode=" + postCode;
			} */
		});
		 
	});

	/************************ 함수 정의 *************************/
	/* 현재날짜 구하기 */
	function nowDate(){
		var Now = new Date();
		var NowTime = Now.getFullYear();
		NowTime += '-' + (Now.getMonth() + 1) ;
		NowTime += '-' + Now.getDate();
		
		return NowTime;
	}
	
</script>

<body>
	<div class="poll-content-container">
		<div class="poll-content-bar">
			<jsp:include page="../contentTopBar/pollHomeBar.jsp"/>
		</div>
		<div class="my-poll-list-container">
			<div class="poll-list-bar">
				<h1>나의 설문(제목 바)</h1>
			</div>
			<table class="poll-list">
				<thead>
					<tr>
						<th><p>상태</p></th>
						<th>설문제목</th>
						<th>설문기간</th>
						<th>작성자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${post}" begin="0" end="1">
						<tr>
							<td class="poll-state-td">
								<c:choose>
									<c:when test="${item.POLL_POST_QUST_ANSW_JOIN_EMP eq 0}">
										<span class="poll-state-span-no-attendance">
									</c:when>
									<c:when test="${item.POLL_POST_QUST_ANSW_JOIN_EMP ne 0}">
										<span class="poll-state-span-attendance">
									</c:when>
								</c:choose>
									<c:choose>
										<c:when test="${item.POLL_POST_QUST_ANSW_JOIN_EMP eq 0}">
											<c:out value="미참여"></c:out>
										</c:when>
										<c:when test="${item.POLL_POST_QUST_ANSW_JOIN_EMP ne 0}">
											<c:out value="참여 완료"></c:out>
										</c:when>
									</c:choose>
								</span>
							</td>
							<td class="poll-title-td">
								<a>
									<span class="txt"><c:out value="${item.POLL_POST_NAME}"/></span>
								</a>
							</td>
							<td class="poll-term-td"><c:out value="${item.POLL_POST_SDAT} ~ ${item.POLL_POST_EDAT}"></c:out></td>
							<td class="poll-writer-td"><c:out value="${item.EMP_INFO_NAME}  ${item.JOB_INFO_NAME}"></c:out></td>
							<td class="post-code" hidden="true"><c:out value="${item.POLL_POST_CODE}"></c:out></td>
							<td class="post-closing" hidden="true"><c:out value="${item.POLL_POST_CLOSING}"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>	
			</div>
		<div class="recent-poll-list-container">
			<div class="poll-list-bar">
				<h1>최근 생성된 설문(제목 바)</h1>
			</div>
			<table class="poll-list">
				<thead>
					<tr>
						<th>상태</th>
						<th>설문제목</th>
						<th>설문기간</th>
						<th>작성자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${post}">
						<tr>
							<td class="poll-state-td">
								<c:choose>
									<c:when test="${item.POLL_POST_QUST_ANSW_JOIN_EMP eq 0}">
										<span class="poll-state-span-no-attendance">
									</c:when>
									<c:when test="${item.POLL_POST_QUST_ANSW_JOIN_EMP ne 0}">
										<span class="poll-state-span-attendance">
									</c:when>
								</c:choose>
									<c:choose>
										<c:when test="${item.POLL_POST_QUST_ANSW_JOIN_EMP eq 0}">
											<c:out value="미참여"></c:out>
										</c:when>
										<c:when test="${item.POLL_POST_QUST_ANSW_JOIN_EMP ne 0}">
											<c:out value="참여 완료"></c:out>
										</c:when>
									</c:choose>
								</span>
							</td>
							<td class="poll-title-td">
								<a>
									<span class="txt"><c:out value="${item.POLL_POST_NAME}"/></span>
								</a>
							</td>
							<td class="poll-term-td"><c:out value="${item.POLL_POST_SDAT} ~ ${item.POLL_POST_EDAT}"></c:out></td>
							<td class="poll-writer-td"><c:out value="${item.EMP_INFO_NAME}  ${item.JOB_INFO_NAME}"></c:out></td>
							<td class="post-code" hidden="true"><c:out value="${item.POLL_POST_CODE}"></c:out></td>
							<td class="post-closing" hidden="true"><c:out value="${item.POLL_POST_CLOSING}"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>	
		</div>

	</div>

</body>
</html>