<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollProgress.css">
<title>Insert title here</title>
</head>
<script>
	$(document).ready(function(){
		//메뉴바 마감설문 부분 색상 변경
		$('#poll-finished').css('color','black');
		
		//topBar title 변경
		$('.pollHomeTitle').text('마감된 설문');
	});

</script>

<body>
	<div class="poll-content-container">
		<div class="poll-content-bar">
			<jsp:include page="../contentTopBar/pollHomeBar.jsp"/>
		</div>
		<div class="progress-poll-list-container">
			<div class="poll-list-bar">
				<h1>마감된 설문</h1>
			</div>
			<div class="data-wrap">
				<div class="table-wrap">
					<table class="poll-list">
							<tr>
								<th>번호</th>
								<th><p>상태</p></th>
								<th>설문제목</th>
								<th>설문기간</th>
								<th>작성자</th>
							</tr>
							<tr>
								<td>1</td>
								<td class="poll-state-td">
									<span class="poll-state-span-no-attendance">미참여</span>
								</td>
								<td class="poll-title-td">설문제목 적는 공간</td>
								<td class="poll-term-td">xxxx/xx/xx ~ xxxx/xx/xx</td>
								<td class="poll-writer-td">작성자 이름 직책</td>
							</tr>
							<tr>
								<td>2</td>
								<td class="poll-state-td">
									<span class="poll-state-span-attendance">참여 완료</span>
								</td>
								<td class="poll-title-td">설문제목 적는 공간</td>
								<td class="poll-term-td">xxxx/xx/xx ~ xxxx/xx/xx</td>
								<td class="poll-writer-td">작성자 이름 직책</td>
							</tr>
					</table>	
					<div class="paging-bar">
						<div class="data-page-bar">
							<a class="first page-button page-button-disabled"></a>
							<a class="previous page-button page-button-disabled"></a>
							<span>
								<a class="page-active">1</a>
								<a class="page-button">2</a>
							</span>
							<a class="next page-button"></a>
							<a class="last page-button"></a>						
						</div>
					</div>
				</div>
				<div class="search-bar">
					<select name="search-type">
						<option value="title">설문제목</option>
						<option value="writer">작성자</option>
					</select>
					<section class="search-box">
						<div class="search-wrap">
							<input class="search-box" type="text" name="keyword" placeholder="검색">
							<span class="search-btn" title="search"></span>
						</div>
					</section>
				</div>
			</div>
		</div>

	</div>

</body>
</html>