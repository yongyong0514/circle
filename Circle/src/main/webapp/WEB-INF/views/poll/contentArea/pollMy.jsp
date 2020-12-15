<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollMy.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/part/toolBar.css">
<title>Insert title here</title>
</head>


<body>
	<!-- 오늘날짜 변수화 -->
	<jsp:useBean id="now" class="java.util.Date" scope="request"/>
	<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowNum" scope="request"/>

	<div class="poll-content-container">
		<div class="poll-content-bar">
			<jsp:include page="../contentTopBar/pollHomeBar.jsp"/>
		</div>
		<div class="progress-poll-list-container">
			<div class="poll-list-bar">
				<h1>내 설문</h1>
			</div>
			<div class="data-wrap">
				<div class="table-wrap">
					<div class="poll-toolbar">
						<div class="poll-manage">
							<a class="toolbar-btn-wrap">
								<span class="toolbar-icon doc"></span>
								<span class="poll-post-toolbar-progress-btn-txt">진행</span>
							</a>
							<a class="toolbar-btn-wrap">
								<span class="toolbar-icon del"></span>
								<span class="poll-post-toolbar-progress-btn-txt">중지</span>
							</a>
							<a class="toolbar-btn-wrap">
								<span class="toolbar-icon end"></span>
								<span class="poll-post-toolbar-progress-btn-txt">마감</span>
							</a>
							<a class="toolbar-btn-wrap" onclick="deleteCheck();">
								<span class="toolbar-icon del"></span>
								<span class="poll-post-toolbar-delete-btn-txt">삭제</span>
							</a>
						</div>
						<div class="poll-post-list">
							<label>
								<select name="poll-table-length">
									<option value="1" <c:if test="${pageInfo.cntPerPage eq '1'}">selected</c:if>>1</option>
									<option value="2" <c:if test="${pageInfo.cntPerPage eq '2'}">selected</c:if>>2</option>
									<option value="3" <c:if test="${pageInfo.cntPerPage eq '3'}">selected</c:if>>3</option>
									<option value="5" <c:if test="${pageInfo.cntPerPage eq '5'}">selected</c:if>>5</option>
									<option value="10" <c:if test="${pageInfo.cntPerPage eq '10'}">selected</c:if>>10</option>
									<option value="20" <c:if test="${pageInfo.cntPerPage eq '20'}">selected</c:if>>20</option>
									<option value="40" <c:if test="${pageInfo.cntPerPage eq '40'}">selected</c:if>>40</option>
									<option value="60" <c:if test="${pageInfo.cntPerPage eq '60'}">selected</c:if>>60</option>
									<option value="80" <c:if test="${pageInfo.cntPerPage eq '80'}">selected</c:if>>80</option>
								</select>
						</div>
					</div>
					<table class="poll-list">
						<thead>
							<tr>
								<th>
									<input type="checkbox" id="checkedAll" onclick="checkAll();">
								</th>
								<th>번호</th>
								<th><p>상태</p></th>
								<th>설문제목</th>
								<th>설문기간</th>
								<th>참여율</th>
							</tr>
						</thead>
						<tbody>
							
							
							<c:forEach var="item" items="${post}" varStatus="number">
								<tr>
									<td class="check">
										<input type="checkbox" name="code" value="${number.count }">
									</td>
									<!-- 행 숫자 컬럼 -->
									<td>
										<c:out value="${pageInfo.total - ((pageInfo.nowPage - 1) * cntPerPage + number.index)}"/>
									</td>
										
										<!-- 날짜 계산용 변수 초기화 -->
										<c:set var="sdat" value="${item.POLL_POST_SDAT }"></c:set>
										<c:set var="edat" value="${item.POLL_POST_EDAT }"></c:set>
										<fmt:parseDate var="sdat" value="${sdat}" pattern="yyyy-MM-dd" />
										<fmt:parseDate var="edat" value="${edat}" pattern="yyyy-MM-dd" />
										<fmt:parseNumber value="${sdat.time / (1000*60*60*24)}" integerOnly="true" var="sdatNum" scope="request"/>
										<fmt:parseNumber value="${edat.time / (1000*60*60*24)}" integerOnly="true" var="edatNum" scope="request"/>
										
									<!-- 진행/완료 등 상태 컬럼 -->
									<td class="poll-state-td">
										<c:choose>
											<c:when test="${nowNum < sdatNum}">
												<span class="poll-state temp">준비중</span>
											</c:when>
											<c:when test="${nowNum > edatNum}">
												<span class="poll-state complete">완료</span>
											</c:when>
											<c:when test="${item.POLL_POST_CLOSING eq 'Y'}">
												<span class="poll-state pause">중지</span>
											</c:when>
											<c:otherwise>
												<span class="poll-state progress">진행중</span>
											</c:otherwise>
										</c:choose>
										</span>
									</td>
									<td class="poll-title-td">
										<a>
										 	<span class="txt"><c:out value="${item.POLL_POST_NAME}"/></span>
										</a>									
									</td>
									<td class="poll-term-td">
										<fmt:formatDate value="${item.POLL_POST_SDAT}" pattern="yyyy-MM-dd" />
										<c:out value=" ~ "/>
										<fmt:formatDate value="${item.POLL_POST_EDAT}" pattern="yyyy-MM-dd" />
									</td>
									<td class="poll-rate-td">
										<span class="txt">
											<c:out value="${item.ACTUALATTENDMEMBER}"/>/<c:out value="${item.TOTALATTENDABLEMEMBER}"/>
											
											<fmt:parseNumber value="${item.ACTUALATTENDMEMBER}" var="ACTUALATTENDMEMBER"/>
											<fmt:parseNumber value="${item.TOTALATTENDABLEMEMBER}" var="TOTALATTENDABLEMEMBER"/>
											<strong> (<fmt:formatNumber value="${ACTUALATTENDMEMBER/TOTALATTENDABLEMEMBER}" pattern="#,###.00%"/>)</strong>
										</span>
									</td>
									<td class="post-code" hidden="true"><c:out value="${item.POLL_POST_CODE}"></c:out></td>
									<td class="post-joinable" hidden="true"><c:out value="${item.MYVOTERIGHT}"></c:out></td>
									<td class="post-realjoin" hidden="true"><c:out value="${item.MYVOTECONDITION}"></c:out></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>	
					<div class="pageInfo-bar">
						<div class="data-page-bar">
							<!-- 처음페이지로 가는 버튼 -->
							<c:choose>
								<c:when test="${pageInfo.startPage ne pageInfo.nowPage}">
									<c:choose>
										<c:when test="${not empty pageInfo.searchTitle }">
											<a class="first page-button" href="<c:out value="${pageContext.request.contextPath}/poll/my?nowPage=${pageInfo.startPage}&cntPerPage=${pageInfo.cntPerPage}&searchTitle=${pageInfo.searchTitle}"/>"></a>
										</c:when>
										<c:when test="${not empty pageInfo.searchWriter }">
											<a class="first page-button" href="<c:out value="${pageContext.request.contextPath}/poll/my?nowPage=${pageInfo.startPage}&cntPerPage=${pageInfo.cntPerPage}%searchWriter=${pageInfo.searchWriter}"/>"></a>
										</c:when>
										<c:otherwise>
											<a class="first page-button" href="<c:out value="${pageContext.request.contextPath}/poll/my?nowPage=${pageInfo.startPage}&cntPerPage=${pageInfo.cntPerPage}"/>"></a>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<a class="first page-button page-button-disabled"></a>
								</c:otherwise>
							</c:choose>
							
							<!-- 이전페이지로 가는 버튼 -->
							<c:choose>
								<c:when test="${pageInfo.startPage ne 1 }">
									<c:choose>
										<c:when test="${not empty pageInfo.searchTitle }">
											<a class="previous page-button " href="${pageContext.request.contextPath}/poll/my?nowPage=${pageInfo.startPage - 1 }&cntPerPage=${pageInfo.cntPerPage}&searchTitle=${pageInfo.searchTitle}"></a>
										</c:when>
										<c:when test="${not empty pageInfo.searchWriter }">
											<a class="previous page-button " href="${pageContext.request.contextPath}/poll/my?nowPage=${pageInfo.startPage - 1 }&cntPerPage=${pageInfo.cntPerPage}%searchWriter=${pageInfo.searchWriter}"></a>
										</c:when>
										<c:otherwise>
											<a class="previous page-button " href="${pageContext.request.contextPath}/poll/my?nowPage=${pageInfo.startPage - 1 }&cntPerPage=${pageInfo.cntPerPage}"></a>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<a class="previous page-button page-button-disabled"></a>
								</c:otherwise>
							</c:choose>
							
							<!-- 페이지 버튼 숫자 -->
							<span>
								<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="p">
									<c:choose>
										<c:when test="${p eq pageInfo.nowPage }">
											<a class="page-active">${p}</a>
										</c:when>
										<c:when test="${p ne pageInfo.nowPage }">
											<c:choose>
												<c:when test="${not empty pageInfo.searchTitle }">
													<a class="page-button" href="<c:out value="${pageContext.request.contextPath}/poll/my?nowPage=${p}&cntPerPage=${pageInfo.cntPerPage}&searchTitle=${pageInfo.searchTitle}"/>">${p}</a>						
												</c:when>
												<c:when test="${not empty pageInfo.searchWriter }">
													<a class="page-button" href="<c:out value="${pageContext.request.contextPath}/poll/my?nowPage=${p}&cntPerPage=${pageInfo.cntPerPage}%searchWriter=${pageInfo.searchWriter}"/>">${p}</a>						
												</c:when>
												<c:otherwise>
													<a class="page-button" href="<c:out value="${pageContext.request.contextPath}/poll/my?nowPage=${p}&cntPerPage=${pageInfo.cntPerPage}"/>">${p}</a>						
												</c:otherwise>
											</c:choose>
										</c:when>
									</c:choose>
								</c:forEach>
							</span>
							
							<!-- 다음 페이지 버튼 -->
							<c:choose>
								<c:when test="${pageInfo.endPage ne pageInfo.lastPage}">
									<c:choose>
										<c:when test="${not empty pageInfo.searchTitle }">
											<a class="next page-button" href="${pageContext.request.contextPath}/poll/my?nowPage=${pageInfo.endPage + 1}&cntPerPage=${pageInfo.cntPerPage}&searchTitle=${pageInfo.searchTitle}"></a>
										</c:when>
										<c:when test="${not empty pageInfo.searchWriter }">
											<a class="next page-button" href="${pageContext.request.contextPath}/poll/my?nowPage=${pageInfo.endPage + 1}&cntPerPage=${pageInfo.cntPerPage}%searchWriter=${pageInfo.searchWriter}"></a>
										</c:when>
										<c:otherwise>
											<a class="next page-button" href="${pageContext.request.contextPath}/poll/my?nowPage=${pageInfo.endPage + 1}&cntPerPage=${pageInfo.cntPerPage}"></a>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<a class="next page-button page-button-disabled"></a>
								</c:otherwise>
							</c:choose>
							
							<!-- 마지막 페이지 버튼 조건 -->
							<c:choose>
								<c:when test="${pageInfo.lastPage ne pageInfo.nowPage}">
									<c:choose>
										<c:when test="${not empty pageInfo.searchTitle }">
											<a class="last page-button" href="${pageContext.request.contextPath}/poll/my?nowPage=${pageInfo.lastPage}&cntPerPage=${pageInfo.cntPerPage}&searchTitle=${pageInfo.searchTitle}"></a>						
										</c:when>
										<c:when test="${not empty pageInfo.searchWriter }">
											<a class="last page-button" href="${pageContext.request.contextPath}/poll/my?nowPage=${pageInfo.lastPage}&cntPerPage=${pageInfo.cntPerPage}%searchWriter=${pageInfo.searchWriter}"></a>						
										</c:when>
										<c:otherwise>
											<a class="last page-button" href="${pageContext.request.contextPath}/poll/my?nowPage=${pageInfo.lastPage}&cntPerPage=${pageInfo.cntPerPage}"></a>						
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<a class="last page-button page-button-disabled"></a>						
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<div class="search-bar poll-toolbar">
					<select name="search-type">
						<option value="title">설문제목</option>
					</select>
					<section class="search-box">
						<div class="search-wrap">
							<c:choose>
								<c:when test="${not empty pageInfo.searchTitle}">
									<input class="search-box" type="text" name="keyword" placeholder="검색" value="${pageInfo.searchTitle}">
								</c:when>
								<c:otherwise>
									<input class="search-box" type="text" name="keyword" placeholder="검색">
								</c:otherwise>
							</c:choose>
							<span class="search-btn" title="search"></span>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>
	
	<form id="deleteForm"  method="post">
	</form>
	
	
	<script src="/circle/resources/js/poll/jquery.min.js"></script>
	<script>
	/************************************************** 함수 부분 **************************************************/
	
	/* 삭제확인 */
	function deleteCheck(){
		alert("설문을 삭제 하시겠습니까?");
		
		var postCode = new Array();
		
		$('input:checkbox[name="code"]:checked').each(function(index, item){
			var code = $(item).parent().siblings('.post-code').text();
			postCode.push(code);
		})
		
		console.log(postCode);
		
		$.ajax({
			url		:	"${pageContext.request.contextPath}/pollAjax/deleteAll",
			type	:	"post",
			traditional : true,
			data	:	JSON.stringify(postCode),
			dataType 	: "text",
        	contentType	:"application/json; charset=utf-8;",
        	error		: function(request,status,error){
        		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        	},
			success	: setTimeout(function(){location.href = "${pageContext.request.contextPath}/poll/my"} , 1000)   
			, beforeSend: function () {
	              var width = 0;
	              var height = 0;
	              var left = 0;
	              var top = 0;

	              width = 50;
	              height = 50;


	              top = ( $(window).height() - height ) / 2 + $(window).scrollTop();
	              left = ( $(window).width() - width ) / 2 + $(window).scrollLeft();

	 

	              if($("#div_ajax_load_image").length != 0) {
	                     $("#div_ajax_load_image").css({
	                            "top": top+"px",
	                            "left": left+"px"
	                     });
	                     $("#div_ajax_load_image").show();
	              }
	              else {
	                     $('body').append('<div id="div_ajax_load_image" style="position:absolute; top:' + top + 'px; left:' + left + 'px; width:' + width + 'px; height:' + height + 'px; z-index:9999; background:#f0f0f0; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; "><img src="${pageContext.request.contextPath}/resources/img/poll/loading.gif" style="width:auto; height:auto;"></div>');
	              }

	       }
	       , complete: function () {
	                     $("#div_ajax_load_image").hide();
	       }

		})
		
		
	}
	
	/* 일괄 체크 */
	function checkAll(){
		var now = $('#checkedAll').prop('checked');
		
		if(now){
			$('input[name=code]').prop('checked',true);		
		} else {
			$('input[name=code]').prop('checked',false);		
			
		}
	}
	//검색버튼 클릭시 기능
	$('.search-bar .search-btn').on('click', function(){
		
		//검색어 가공후 전역변수에 저장(searchKeyword)
		var searchKeyword = $('section.search-box input.search-box').val();
						
		//주소 리턴
	 	location.href="${pageContext.request.contextPath}/poll/my?searchTitle=" + searchKeyword;
	})
	
	//페이지당 post출력 개수 변경
	$('.poll-toolbar .poll-post-list select[name=poll-table-length]').on('change', function(){
		var i = $(this).val();
		location.href = "${pageContext.request.contextPath}/poll/my?cntPerPage=" + i;
	});
	
	//설문 post 클릭시
	$('table.poll-list tbody tr td.poll-title-td a').on('click', function(){
		/* 설문코드 추출 */
		var code = $(this).parent().parent().find('.post-code').text();
		
		/* 참여여부 추출 */
		var joinable = $(this).parent().parent().find('.post-joinable').text();
		var realjoin = $(this).parent().parent().find('.post-realjoin').text();
		
		/* 마감여부 추출 */
		var complete = $(this).parent().parent().find('.poll-state-td span').prop("class");
		
		if(complete == 'poll-state complete' || joinable == 0 || (joinable > 0 && realjoin > 0)) {
			location.href = "${pageContext.request.contextPath}/poll/result?postCode=" + code;
		} else {
			location.href = "${pageContext.request.contextPath}/poll/post?postCode=" + code;
		}
		
	});
	
	/************************************************** 실행부분 **************************************************/
	
	$(document).ready(function(){
		//메뉴바 내설문 부분 색상 변경
		$('#poll-my').css('color','black');
		
		//topBar title 변경
		$('.pollHomeTitle').text('내 설문');
		
		
		
	});

	</script>

</body>
</html>