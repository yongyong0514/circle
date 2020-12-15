<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollResult.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/circle/resources/js/poll/jquery.tmpl.min.js"></script>
<script src='${pageContext.request.contextPath}/resources/js/poll/echarts-en.min.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/poll/echarts.min.js'></script>

<title>설문 결과보기</title>
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
							<a class="toolbar-btn-wrap" onclick="deleteModalOpen();">
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
													<c:set var="qustType" value="${item.POLL_POST_QUST_TYPE}"/>
												</c:when>
												<c:when test="${qustCode ne item.POLL_POST_QUST_CODE}">	
												<!-- 첫문항이 아닌 두번째문항부터 첫머리 -->
													<c:set var="seq" value="${seq + 1 }"/>
													<c:set var="qustCode" value="${item.POLL_POST_QUST_CODE }"/>
													<c:set var="qustType" value="${item.POLL_POST_QUST_TYPE}"/>
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
												<div class=result-chart-wrap>
													<dl class=result-chart-info>
															<!-- 참여인원 숫자 변수에 저장 -->
															<c:set var="qra" value="0"/>
															<c:forEach var='inner' items="${qustRealAttend }" varStatus="number">
																<c:if test="${inner.POLL_POST_QUST_CODE eq item.POLL_POST_QUST_CODE }">
																	<c:set var="qra" value="${inner.QUSTREALATTEND }"></c:set>
																</c:if>
															</c:forEach>
															
															<!-- 총인원 숫자로 형변환 -->
															<fmt:parseNumber value = "${totalAttend }" pattern = "0"  var="totalAttendNum"/>
															<!-- 참여인원 숫자로 형변환 -->
															<fmt:parseNumber value = "${qra}" pattern = "0"  var="qraNum"/>
															<!-- 참여율 계산 -->
															<fmt:formatNumber value="${ qraNum / totalAttendNum }" pattern="#,###.00%" var="percent"/>
															
															
														<dt>
															<span class="txt">전체 참여자 : </span>
														</dt>
														<dd>
															<span class="number">
																<c:out value="${totalAttendNum }"/>
															</span>
															<span class="txt">명</span>
														</dd>
														<dt>
															<span class="txt">참여율 : </span>
														</dt>
														<dd>
															
															
															<span class="number">
																<c:out value="${qraNum}"/>
															</span>
															<span class="txt">명</span>
											<c:choose>
												<c:when test="${ qustType eq 'select' || qustType eq 'text'}">
												<!-- 선택형이거나 텍스트형인 경우 -->
															
												
															<span class="gage-wrap">
																<span class="gage" style="width:<c:out value='${percent }'/>"></span>
															</span>
															<span class="number">
																<c:out value="${percent }"/>
															</span>
														</dd>
													</dl>										
													<c:if test="${ qustType eq 'select'}">
													<!-- 선택형 문항 -->
													
														<!-- 차트 그리기용 배열 -->
														<table id="${item.POLL_POST_QUST_CONT}" class="drawTable">
															<c:forEach var="i" items="${post }">
																<c:if test="${item.POLL_POST_QUST_CONT eq i.POLL_POST_QUST_CONT}">
																	<tr id="${i.POLL_POST_QUST_NAME }" class="drawTr">
																		<td id="${i.POLL_POST_QUST_ANSW_CONT }"/>
																		<td id="${i.ANSWERATTEND }"/>
																	</tr>
																</c:if>
															</c:forEach>
														</table>
													
													
													
														
														<div id="result-chart"class="chart-class" style="width:600px;height:250px;"></div> 
													</c:if>
												</div>
											</li>
												</c:when>
												<c:when test="${ qustType eq 'score'}">
												<!-- 점수형 문항 -->
												
														<!-- 점수변환 -->
														<c:set var="total" value="0"/>
														<c:set var="qustCode" value="${item.POLL_POST_QUST_CODE }"/>
														<c:forEach var="i" items="${post}">
															<c:if test="${i.POLL_POST_QUST_CODE eq qustCode}">
																<fmt:parseNumber value = "${i.POLL_POST_QUST_ANSW_CONT }" pattern = "0"  var="answerScore"/>
																<fmt:parseNumber value = "${i.ANSWERATTEND }" pattern = "0"  var="answerPeople"/>
																<c:set var="total" value="${total + answerScore * answerPeople  }"></c:set>
															</c:if>
														</c:forEach>
														<fmt:formatNumber value="${total / qraNum}" pattern="0.00" var="avrScore"/>
														
																
														</dd>
														<dt>
															<span class="txt">평균 점수 : </span>
														</dt>
														<dd>
															<span class="average-txt number"><c:out value="${avrScore}"/></span>
														</dd>
													</dl>										
												</div>					
											</li>
											
												</c:when>
											</c:choose>
														
										</c:if>
										<c:if test="${status.last eq true}">
										<!-- 배열 마지막일 경우 -->
												</ul>
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</div>
							<div class="question-submit-button">
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
										<a data="id">
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
										<a data="id">
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
							<a class="toolbar-btn-wrap" onclick="deleteModalOpen();">
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
			<input type="hidden" id="postCode" value="${postCode }"/>
		<div>
			<jsp:include page="../modalBody.jsp"></jsp:include>
		</div>

	</div>
	
	<script type="text/html" id="chart-template">
	</script>
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 
	
    <script type="text/javascript">
	/******************************************************* 함수 부분 *****************************************************/
	
	/* 모달 동작 구분용 변수 */
	ModalAction = "";
	
	/* 모달 내용 초기화 */
	function modalInit(){
		$('#alertModal').find('.modal-title').text("");
		$('#alertModal').find('.modal-body').children().text("");
	}
	/* 모달 제목 입력 */
	function modalTitleInput(title){
		$('#alertModal').find('.modal-title').text(title);
	}
	/* 모달 내용 입력 */
	function modalContentInput(content){
		$('#alertModal').find('.modal-body').children().text(content);
	}
	
	/* 삭제확인 모달 팝업 */
	function deleteModalOpen(){
		modalInit();
		modalActiondivide('delete');
		modalTitleInput("설문을 삭제 하시겠습니까?");
		modalContentInput("삭제된 설문은 복구할 수 없습니다.");
		$('#alertModal').modal();
		
		console.log($('#alertModal').find('#modal-action-divide').val());
		
	}
	/* 모달 기능 구분용 데이터 입력 */
	function modalActiondivide(input){
		
		console.log(input);
		
		$('#alertModal').find('#modal-action-divide').val(input);
		
		console.log($('#alertModal').find('#modal-action-divide').val());
	}
	
	
	/*************************************************************** 실행 영역 **************************************************/
	
    	$(document).ready(function(){
    		
    		/* 모달 확인 버튼 클릭시 */
    		$('#modal-confirm').on('click', function(){
    			var z = $('#modal-action-divide').val();
    			
    			switch(z){
    				case 'delete' : var code = $('#postCode').val();
    								location.href = "${pageContext.request.contextPath}/poll/deleteOne?postCode=" + code;
    								break;
    				case 'submit' : var convertedData =  formDataConvert(); dataSubmit(convertedData);break;
    				default : break;
    			}
    		})
    		
    		
    		/* 챠트 그리기 */
    		$('.drawTable').each(function(index, item){
    			
    			//챠트제목 추출
   				qid = $(this).find('tr').prop('id');
				
    			//데이터 입력용 변수 생성
				var chartMap = new Array();
					chartMap = [];
	    		var value;
	    		var name;
	    		var qid;
					
	    		//반복문으로 데이터 배열 생성
    			$(this).children().children('.drawTr').each(function(innerIndex, innerItem){
    				
    				name = $(this).children(':eq(0)').prop('id');
    				value = $(this).children(':eq(1)').prop('id');
					chartMap.push({"name" : name, "value" : value}); 
    			});
	    			//챠트 생성/ 옵션 설정
					var myChart = [];
					myChart[index] = echarts.init($('.chart-class')[index]);
			        myChart[index].setOption({
			    		    title: false,
			    		    tooltip: {
			    		        trigger: 'item',
			    		        formatter: '{a} <br/>{b} : {c} ({d}%)'
			    		    },
			    		    series: [
			    		        {
			    		            name: qid,
			    		            type: 'pie',
			    		            left:'10',
			    		            height:'auto',
			    		            alignTo:'default',
			    		            radius : '60%',
			    		            center: ['50%', '55%'],
			    		            label: {
			    		                position: 'outer',
			    	                	formatter: '{b}：{c}명  ({d}%)  '
			    		            },
			    		            data:chartMap,
			    		            itemStyle: {
			    		                emphasis: {
			    		                    shadowBlur: 0,
			    		                    shadowOffsetX: 0,
			    		                    shadowColor: 'rgba(0, 0, 0, 0)'
			    		                }
			    		            }
			    		        }
			    		    ]
			        	});		
    		});
    		
    		
    		
    		
    		
    		
    		
    		
    		
    		
    	});
    
        
    </script>

</body>
</html>