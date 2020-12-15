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
		
		//상단 카드 클릭시
		$('.lead-btn').on('click', function(){
			/* 설문코드 */
			var code = $(this).next().text();
			/* 참여여부 */
			var attend = $(this).closest('.card-wrapper').find('.number').next().attr('class');
			
			/* 참여 -> 결과창, 불참 -> 참여창 */
			if(attend == 'poll-state-span-no-attendance'){
				location.href = "${pageContext.request.contextPath}/poll/post?postCode=" + code;
			} else {	
				location.href = "${pageContext.request.contextPath}/poll/result?postCode=" + code;
			}
		})
		
		//설문 post 클릭시
		$('table.poll-list tbody tr td.poll-title-td a').on('click', function(){
			/* 설문코드 추출 */
			var code = $(this).parent().parent().find('.post-code').text();
			
			/* 참여 여부 확인 */
			var attend = $(this).parent().parent().find('.poll-state-td span').prop("class");
			
			/* 참여 -> 결과창, 불참 -> 참여창 */
			if(attend == 'poll-state-span-no-attendance'){
				location.href = "${pageContext.request.contextPath}/poll/post?postCode=" + code;
			} else {	
				location.href = "${pageContext.request.contextPath}/poll/result?postCode=" + code;
			}
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
				<h1></h1>
			</div>
			<div class="dr-wrapper">
				<div class="dashboard-box">
					<c:forEach var="item" items="${post}" begin="0" end="2" varStatus="number">
						<div class="card-item-wrapper">
							<section class="card-item poll-home-card">
								<div class="h-border"></div>
								<div class="card-wrapper">
									<header>
										<span class="number">${number.count}</span>
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
									</header>
									<div class="card-subject">
										<span class="title">${item.POLL_POST_NAME}</span>
										<span class="date"><c:out value="${item.POLL_POST_SDAT} ~ ${item.POLL_POST_EDAT}"/></span>
									</div>
									<div class="card-content">
										<table class="form-b">
											<tbody>
												<tr>
													<th>작성자</th>
													<td><c:out value="${item.EMP_INFO_NAME}  ${item.JOB_INFO_NAME}"/></td>
												</tr>
												<tr>
													<th>설문 결과</th>
													<td>
														<c:choose>
															<c:when test="${item.POLL_POST_SEC == 'N'}">
																<c:out value="비공개"></c:out>
															</c:when>
															<c:otherwise>
																<c:out value="공개"></c:out>
															</c:otherwise>
														</c:choose>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="card-action">
										<a class="lead-btn">
											<span class="icon"></span>
											<span class="txt">설문 참여</span>
										</a>
										<span class="post-code" hidden="true"><c:out value="${item.POLL_POST_CODE}"></c:out></span>
										<span class="post-closing" hidden="true"><c:out value="${item.POLL_POST_CLOSING}"></c:out></span>
									</div>
								</div>
							</section>
						</div>
					</c:forEach>
				</div>
			</div>
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
					<c:forEach var="item" items="${post}" begin="0" end="4">
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