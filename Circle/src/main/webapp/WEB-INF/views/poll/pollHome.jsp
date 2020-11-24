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
		$('.poll-title-td').on('click', function(){
			console.log($(this) + ": clicked");
			console.log("it's working");
			location.replace("${pageContext.request.contextPath}/poll/pollPost");
		});		
	});

</script>

<body>
	<div class="poll-content-container">
		<div class="poll-content-bar">
			<jsp:include page="pollHomeBar.jsp"/>
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