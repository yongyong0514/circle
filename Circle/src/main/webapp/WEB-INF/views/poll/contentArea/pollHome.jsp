<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

/* 		
		ajax 용 스크립트
		
		console.log(history);
		state = 'home';
		history.push
		
		//미참여 설문 클릭
		$('.poll-state-span-no-attendance').parent().parent().on('click', function(){
			var url = "${pageContext.request.contextPath}/poll/pollPost";
			history.pushState(state, null, url);
			$('#content-box').load(url);
			
		});	
		
		//참여한 설문 클릭
		$('.poll-state-span-attendance').parent().parent().on('click', function(){
			var url = "${pageContext.request.contextPath}/poll/pollResult";
			history.pushState(state, null, url);
			$('#content-box').load(url);
		});	
		
 */
		
	});

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
					<tr>
						<th><p>상태</p></th>
						<th>설문제목</th>
						<th>설문기간</th>
						<th>작성자</th>
					</tr>
					<tr>
						<td class="poll-state-td">
							<span class="poll-state-span-no-attendance">미참여</span>
						</td>
						<td class="poll-title-td">설문제목 적는 공간</td>
						<td class="poll-term-td">xxxx/xx/xx ~ xxxx/xx/xx</td>
						<td class="poll-writer-td">작성자 이름 직책</td>
					</tr>
					<tr>
						<td class="poll-state-td">
							<span class="poll-state-span-attendance">참여 완료</span>
						</td>
						<td class="poll-title-td">설문제목 적는 공간</td>
						<td class="poll-term-td">xxxx/xx/xx ~ xxxx/xx/xx</td>
						<td class="poll-writer-td">작성자 이름 직책</td>
					</tr>
			</table>	
			</div>
		<div class="recent-poll-list-container">
			<div class="poll-list-bar">
				<h1>최근 생성된 설문(제목 바)</h1>
			</div>
			<table class="poll-list">
				<tbody>
					<tr>
						<th>상태</th>
						<th>설문제목</th>
						<th>설문기간</th>
						<th>작성자</th>
					</tr>
					<tr>
						<td class="poll-state-td">
							<span class="poll-state-span-no-attendance">미참여</span>
						</td>
						<td class="poll-title-td">설문제목 적는 공간</td>
						<td class="poll-term-td">xxxx/xx/xx ~ xxxx/xx/xx</td>
						<td class="poll-writer-td">작성자 이름 직책</td>
					</tr>
					<tr>
						<td class="poll-state-td">
							<span class="poll-state-span-attendance">참여 완료</span>
						</td>
						<td class="poll-title-td">설문제목 적는 공간</td>
						<td class="poll-term-td">xxxx/xx/xx ~ xxxx/xx/xx</td>
						<td class="poll-writer-td">작성자 이름 직책</td>
					</tr>
					<tr>
						<td class="poll-state-td">
							<span class="poll-state-span-attendance">참여 완료</span>
						</td>
						<td class="poll-title-td">설문제목 적는 공간</td>
						<td class="poll-term-td">xxxx/xx/xx ~ xxxx/xx/xx</td>
						<td class="poll-writer-td">작성자 이름 직책</td>
					</tr>
					<tr>
						<td class="poll-state-td">
							<span class="poll-state-span-attendance">참여 완료</span>
						</td>
						<td class="poll-title-td">설문제목 적는 공간</td>
						<td class="poll-term-td">xxxx/xx/xx ~ xxxx/xx/xx</td>
						<td class="poll-writer-td">작성자 이름 직책</td>
					</tr>
					<tr>
						<td class="poll-state-td">
							<span class="poll-state-span-no-attendance">미참여</span>
						</td>
						<td class="poll-title-td">설문제목 적는 공간</td>
						<td class="poll-term-td">xxxx/xx/xx ~ xxxx/xx/xx</td>
						<td class="poll-writer-td">작성자 이름 직책</td>
					</tr>
				</tbody>
			</table>	
		</div>

	</div>

</body>
</html>