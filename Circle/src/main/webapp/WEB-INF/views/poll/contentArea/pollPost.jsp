<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollPost.css">
<link rel="shortcut icon" href="#"><!-- favicon 에러 제거용 -->

<script src="/circle/resources/js/poll/jquery.min.js"></script>
<script src="/circle/resources/js/poll/jquery.tmpl.min.js"></script>
<title>설문 참여하기</title>
</head>
<body>
	<div class="poll-post-content-container">
		<header>
			<jsp:include page="../contentTopBar/pollPostBar.jsp"></jsp:include>
		</header>
		<div class="poll-post-inner-content-container">
			<section class="poll-post-toolbar">
				<c:if test="${sessionScope.empInfo.emp_info_emp_no eq post[0].POLL_POST_EMP}">
					<ul class="poll-post-manage">
						<li> 
							<a class="toolbar-btn-wrap">
								<span class="toolbar-icon modify"></span>
								<span class="poll-post-toolbar-modify-btn-txt">수정</span>
							</a>
						</li>
						<c:choose>
							<c:when test="${post[0].POLL_POST_CLOSING eq 'Y'}">
								<li>
									<a class="toolbar-btn-wrap">
										<span class="toolbar-icon play"></span>
										<span class="poll-post-toolbar-progress-btn-txt">진행</span>
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<a class="toolbar-btn-wrap">
										<span class="toolbar-icon stop"></span>
										<span class="poll-post-toolbar-stop-btn-txt">중지</span>
									</a>
								</li>
								
									<!-- 오늘날짜 변수화 -->
									<jsp:useBean id="now" class="java.util.Date" scope="request"/>
									<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowNum" scope="request"/>
									<!-- 날짜 계산용 변수 초기화 -->
									<c:set var="sdat" value="${item.POLL_POST_SDAT }"></c:set>
									<c:set var="edat" value="${item.POLL_POST_EDAT }"></c:set>
									<fmt:parseDate var="sdat" value="${sdat}" pattern="yyyy-MM-dd" />
									<fmt:parseDate var="edat" value="${edat}" pattern="yyyy-MM-dd" />
									<fmt:parseNumber value="${sdat.time / (1000*60*60*24)}" integerOnly="true" var="sdatNum" scope="request"/>
									<fmt:parseNumber value="${edat.time / (1000*60*60*24)}" integerOnly="true" var="edatNum" scope="request"/>
								
								<c:if test="${sdatNum <= nowNum && edatNum >= nowNum}">
									<li>
										<a class="toolbar-btn-wrap">
											<span class="toolbar-icon end"></span>
											<span class="poll-post-toolbar-end-btn-txt">마감</span>
										</a>
									</li>
								</c:if>
							</c:otherwise>
						</c:choose>
						
						<li>
							<a class="toolbar-btn-wrap">
								<span class="toolbar-icon del"></span>
								<span class="poll-post-toolbar-delete-btn-txt">삭제</span>
							</a>
						</li>
					</ul>
				</c:if>
				<ul class="poll-post-list">
					<li>
						<a class="toolbar-btn-wrap toolbar-list-btn">
							<span class="toolbar-icon list" title="목록"></span>
							<span class="txt">목록</span>
						</a>
					</li>
				</ul>
			</section>
			<div class="poll-post-article-main-container">
				<div class="poll-post-article-wrap">
					<header class="poll-post-article-header">
						<h1><c:out value="${post[0].POLL_POST_NAME}"></c:out></h1>
						<table class="poll-post-info-list">
							<tbody>
								<tr>
									<th>
										<div class="normal-info">
											<span class="span-toggle">
												<span class="toggle-icon">
												</span>
											</span>
											<span class="title">작성자 : </span>
										</div>
									</th>
									<td>
										<span class="photo">
											<a class="writer-info" data-userid="200101090031">
												<img alt='사진' title="김정훈 본부장" src="${pageContext.request.contextPath}/resources/img/test/user.png" style="width:20px;height:20px;">								
											</a>
										</span>
										<span class="writer-info txt" data-userid="200101090031">
											<c:out value="${post[0].EMP_INFO_NAME}"></c:out>
											<c:out value=" "></c:out>
											<c:out value="${post[0].JOB_INFO_NAME}"></c:out>
										</span>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="sub-info" style="display:block;">
							<table class="poll-post-info-list">
								<tbody>
									<tr>
										<th>
											<span class="title">작성일 :</span>
										</th>
										<td>
											<span class="date"><fmt:formatDate value="${post[0].POLL_POST_WDAT }" pattern="yyyy-MM-dd"/></span>
										</td>
									</tr>
									<tr>
										<th>
											<span class="title">설문기간 :</span>
										</th>
										<td>
											<span class="date">
												<fmt:formatDate value="${post[0].POLL_POST_SDAT }" pattern="yyyy-MM-dd"/>
												<c:out value=" ~ "></c:out>
												<fmt:formatDate value="${post[0].POLL_POST_EDAT }" pattern="yyyy-MM-dd"/>
											</span>
										</td>
									</tr>
									<tr>
										<th>
											<span class="title">참여 후 수정 :</span>
										</th>
										<td>
											<span class="date">
												<c:choose>
													<c:when test="${post[0].POLL_POST_MOD_ADMT eq 'Y' }">
														<c:out value="허용"></c:out>
													</c:when>
													<c:otherwise>
														<c:out value="불허"></c:out>
													</c:otherwise>
												</c:choose>
											</span>
										</td>
									</tr>
									<tr>
										<th>
											<span class="title">설문결과 :</span>
										</th>
										<td>
											<span class="date">
												<c:choose>
													<c:when test="${post[0].POLL_POST_SEC eq 'Y'}">
														<c:out value="공개"></c:out>
													</c:when>
													<c:otherwise>
														<c:out value="공개"></c:out>
													</c:otherwise>
												</c:choose>
											</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</header>
					<div class="poll-post-join-info">
						<div class="poll-post-join-info-wrap">
							<span class="txt">
								전체 참여자
								<strong><c:out value="${totalAttend }"/></strong>
							</span>
							<span class="inline-space"></span>
							<span class="txt">
								참여 완료
								<strong><c:out value="${realAttend }"/></strong>
							</span>
							<span class="inline-space"></span>
							<span class="txt">
								미참여
								<strong><c:out value="${totalAttend - realAttend }"/></strong>
							</span>
						</div>
					</div>
					<article class="poll-post-question-container">
						<div class="question-guide">
							<c:out value="${post[0].POLL_POST_CONT }"></c:out>
						</div>
						<div id=poll-response-form>
							<div class="question-list-container">
								<ul class="question-list">
									<c:forEach var="item" items="${post}" varStatus="status">
										<c:if test="${status.count eq 1 || qustCode ne item.POLL_POST_QUST_CODE}">
										<!-- 첫문항이거나 문항 첫머리인 경우 -->
											<c:choose>
												<c:when test="${status.count eq 1}">
												<!-- 첫 문항 -->
													<c:set var="seq" value="${status.count }"/>
													<c:set var="qustCode" value="${item.POLL_POST_QUST_CODE }"/>
												</c:when>
												<c:when test="${qustCode ne item.POLL_POST_QUST_CODE}">	
												<!-- 문항 첫머리 -->
													<c:set var="seq" value="${seq + 1 }"/>
													<c:set var="qustCode" value="${item.POLL_POST_QUST_CODE }"/>
														</ul>
													</li>
												</c:when>
											</c:choose>
											<li class=question-response>
												<span class="question">
													<span class="seq">
														<c:out value="${seq}"></c:out>
													</span>
													.
													<c:if test="${item.POLL_POST_QUST_NECESS eq 'Y'}">
													<!-- 필수 체크된 경우 -->
														<span class="necessary">
														<c:out value="[필수]"/>
														</span>
													</c:if>
													<c:out value="${item.POLL_POST_QUST_CONT }"></c:out>
												</span>
											<c:choose>
												<c:when test="${item.POLL_POST_QUST_TYPE eq 'score' }">
												<!-- 점수형일 경우 클래스 추가 -->
													<ul class="answer-wrap rank">
												</c:when>
												<c:otherwise>
													<ul class="answer-wrap">
												</c:otherwise>
											</c:choose>
										</c:if>
										<!-- 첫문항 아님 / 문항 첫머리 아님 -->
										<c:choose>
											<c:when test="${item.POLL_POST_QUST_TYPE eq 'select'}">
											<!-- 선택형 질문 -->	
												<c:choose>
													<c:when test="${item.POLL_POST_QUST_ANSW_TYPE ne 'etc'}">
													<!-- 기타 선택지 아님 -->
														<c:choose>
															<c:when test="${item.POLL_POST_QUST_LOWTYPE eq 'single'}">
															<!-- radio 선택지 -->
																<li>
																	<span class="answer-option-wrap">
																<input id="${item.POLL_POST_QUST_ANSW_CODE }" type="${item.POLL_POST_QUST_ANSW_TYPE }" name="${item.POLL_POST_QUST_CODE}">
															</c:when>
															<c:when test="${item.POLL_POST_QUST_LOWTYPE eq 'plural'}">
															<!-- checkbox 선택지 -->
																<li>
																	<span class="answer-option-wrap">
																		<p class="data" hidden="true"><c:out value="${item.POLL_POST_QUST_LIMIT}"/></p>
																		<input id="${item.POLL_POST_QUST_ANSW_CODE }" type="${item.POLL_POST_QUST_ANSW_TYPE }" name="${item.POLL_POST_QUST_CODE}" onClick="checkLimit(this);">
															</c:when>
														</c:choose>
															<label for="${item.POLL_POST_QUST_ANSW_CODE }">
																<c:out value="${item.POLL_POST_QUST_ANSW_CONT }"></c:out>
															</label>
														</span>
														</li>
													</c:when>
													<c:otherwise>
													<!-- 기타 선택지 -->
														<c:choose>
															<c:when test="${item.POLL_POST_QUST_LOWTYPE eq 'single'}">
																<li class="etc">
																	<span class="txt-wrap">
																<input id="${item.POLL_POST_QUST_ANSW_CODE }" type="radio" name="${item.POLL_POST_QUST_CODE}">
															</c:when>
															<c:when test="${item.POLL_POST_QUST_LOWTYPE eq 'plural'}">
																<li class="etc">
																	<span class="txt-wrap">
																		<p class="data" hidden="true"><c:out value="checkbox"/></p>
																		<input id="${item.POLL_POST_QUST_ANSW_CODE }" type="${item.POLL_POST_QUST_ANSW_TYPE }" name="${item.POLL_POST_QUST_CODE}" onClick="checkLimit(this);">
															</c:when>
														</c:choose>
															<label for="${item.POLL_POST_QUST_ANSW_CODE } txt">
																<c:out value="${item.POLL_POST_QUST_ANSW_CONT }"></c:out>
															</label>
															<input class="txt w-fix-max" type="text">
														</span>
														</li>
													</c:otherwise>
												</c:choose>
											</c:when>	
											<c:when test="${item.POLL_POST_QUST_TYPE eq 'text'}">
											<!-- 텍스트형 -->
												<c:choose>
													<c:when test="${item.POLL_POST_QUST_LOWTYPE eq 'long' }">
													<!-- 장문 선택 -->
														<li>
															<div class="text-area-wrap">
																<textarea id="${item.POLL_POST_QUST_ANSW_CODE }" class="textarea w-max" rows="5">
																</textarea>
															</div>
														</li>
													</c:when>
													<c:when test="${item.POLL_POST_QUST_LOWTYPE eq 'short' }">
													<!-- 단문 선택 -->
														<li>
															<div class="text-wrap">
																<input id="${item.POLL_POST_QUST_ANSW_CODE }" class="text w-max" type="text">
															</div>
														</li>
													</c:when>
												</c:choose>
											</c:when>														
											<c:when test="${item.POLL_POST_QUST_TYPE eq 'score'}">
											<!-- 점수형일 경우 -->
												<li>
													<span class="answer-option-wrap">
														<input id="${item.POLL_POST_QUST_ANSW_CODE }" type="radio" name="${item.POLL_POST_QUST_CODE}">
														<label for="${item.POLL_POST_QUST_ANSW_CODE }">
															<c:out value="${item.POLL_POST_QUST_ANSW_CONT }"></c:out>
														</label>
													</span>
												</li>
											</c:when>														
										</c:choose>
										<c:if test="${status.last eq true}">
										<!-- 배열 마지막일 경우 -->
												</ul>
											</li>
										</c:if>
									</c:forEach>
	
								</ul>
							</div>
							<div class="question-submit-button">
								<a href="#" class="poll-submit-btn main-btn">
									<span class="txt">설문 제출</span>
								</a>
								<a href="#" class="poll-temp-save-btn sub-btn">
									<span class="txt">임시 저장</span>
								</a>
							</div>
						</div>				
					</article>
				</div>
				<div class="poll-reply-container">
					<div class="poll-reply-wrap">
						<ul class="reply-wrap count">
							<li class="reply-count-view">
								<span class="reply-count-icon"></span>
								<span class="reply-count-txt">
									"댓글"
									<span class="reply-count-num">2</span>
								</span>
							</li>					
						</ul>
					</div>
					<div class="poll-reply-wrap">
						<ul class="reply-wrap">
							<li>
								<div>
									<span class="photo">
										<a>
											<img src="${pageContext.request.contextPath}/resources/img/test/user.png" alt="사진" title="김정훈 본부장">
										</a>
									</span>
									<div>
										<div class="reply-msg-wrap">
											<div class="reply-msg-info">
												<span class="name">김정훈 본부장</span>
												<span class="reply-date">방금전</span>
											</div>
											<p>
												<span id="reply-content">댓글내용1</span>
											</p>
										</div>
									</div>
									<div class="reply-update-wrap" style="display:inline-block;">
										<span class="reply-update-btn" id="edit">
											<span class="reply-edit-btn-icon"></span>
										</span>
										<span class="reply-update-btn" id="delete">
											<span class="reply-delete-btn-icon"></span>
										</span>
									</div>
								</div>
							</li>
							<li>
								<div>
									<span class="photo">
										<a>
											<img src="${pageContext.request.contextPath}/resources/img/test/user.png" alt="사진" title="김정훈 본부장">
										</a>
									</span>
									<div>
										<div class="reply-msg-wrap">
											<div class="reply-msg-info">
												<span class="name">김정훈 본부장</span>
												<span class="reply-date">방금전</span>
											</div>
											<p>
												<span id="reply-content">댓글내용2</span>
											</p>
										</div>
									</div>
									<div class="reply-update-wrap" style="display:">
										<span class="reply-update-btn" id="edit">
											<span class="reply-edit-btn-icon"></span>
										</span>
										<span class="reply-update-btn" id="delete">
											<span class="reply-delete-btn-icon"></span>
										</span>
									</div>
								</div>
							</li>
						</ul>
						<div class="reply-input-wrap">
							<span class="photo">
								<img alt="사진" src="${pageContext.request.contextPath}/resources/img/test/user.png" style="width:32px;height:32px;">
							</span>
							<div class="reply-msg-wrap">
								<div class="reply-input-component-wrap">
									<p class="reply-input-form-wrap">
										<span class="reply-input-form-textarea">
											<textarea class="reply-input-textarea w-max" rows="1"></textarea>
										</span>
									</p>
									<span class="reply-insert-btn-wrap sub-btn">
										<span class="txt">댓글 작성</span>
									</span>
								</div>
								<div></div>
								<div></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<section class="poll-post-toolbar">
				<c:if test="${sessionScope.empInfo.emp_info_emp_no eq post[0].POLL_POST_EMP}">
					<ul class="poll-post-manage">
						<li> 
							<a class="toolbar-btn-wrap">
								<span class="toolbar-icon modify"></span>
								<span class="poll-post-toolbar-modify-btn-txt">수정</span>
							</a>
						</li>
						<c:choose>
							<c:when test="${post[0].POLL_POST_CLOSING eq 'Y'}">
								<li>
									<a class="toolbar-btn-wrap">
										<span class="toolbar-icon play"></span>
										<span class="poll-post-toolbar-progress-btn-txt">진행</span>
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<a class="toolbar-btn-wrap">
										<span class="toolbar-icon stop"></span>
										<span class="poll-post-toolbar-stop-btn-txt">중지</span>
									</a>
								</li>
								<c:if test="${sdatNum <= nowNum && edatNum >= nowNum}">
									<li>
										<a class="toolbar-btn-wrap">
											<span class="toolbar-icon end"></span>
											<span class="poll-post-toolbar-end-btn-txt">마감</span>
										</a>
									</li>
								</c:if>
							</c:otherwise>
						</c:choose>
						
						<li>
							<a class="toolbar-btn-wrap">
								<span class="toolbar-icon del"></span>
								<span class="poll-post-toolbar-delete-btn-txt">삭제</span>
							</a>
						</li>
					</ul>
				</c:if>
				<ul class="poll-post-list">
					<li>
						<a class="toolbar-btn-wrap toolbar-list-btn">
							<span class="toolbar-icon list" title="목록"></span>
							<span class="txt">목록</span>
						</a>
					</li>
				</ul>
			</section>
		</div>

	</div>
	
	<script>
		/* 클릭한 체크박스에서 최대개수 제한 추출/방지 */
		function checkLimit(e){
			
			/* 추출된 아이디로 선택자 조립 */			
			var selector = '#' + $(e).prop('id');
			
			/* 개수제한 추출 */
			var limit = $(selector).siblings('p').text();
			
			
			/* 체크박스 변수화 */
			var name = "input[name=" + $(e).prop('name') + "]";
			var checkbox = $(name)
			
			/* 카운트 변수 초기화 */
			var count = 0;
			
			/* 반복문으로 체크상태 확인 */
			for(var i = 0; i < checkbox.length; i++	){
				if(checkbox[i].checked){
					count ++;
				}
			}
			
			/* 무제한(0) 일때 카운트 설정 */
			limit == 0 ? limit = count : limit = limit;
					
			/* 최대개수 초과시 경고/체크해제 */
			if(count > limit){
				alert("해당질문은 " + limit + "개 까지 선택이 가능합니다");
				$(selector).prop('checked', false);
			}
		}
	</script>

</body>
</html>