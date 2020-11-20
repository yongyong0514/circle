<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/schedule/schLeftBar.css">
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/schedule/schLeftBar_docu.css"> --%>
</head>
<body>
	<div>
		<div class="menuLeftBar">
			<div class="menuLeftListTop">일정 관리</div>
			<div class="menuLeftListBtn"><button class="menuLeftBtn">일정 추가</button></div>
			<div class="menuLeftList0"></div>
			<div class="menuLeftListTitle">내 일정</div>
			<div class="menuLeftList">
				<input type='checkbox' id='myCalendar' value='myCalendar' checked/>
				<label for='myCalendar'>
					<span class="txt" title="내 캘린더">내 캘린더</span>
				</label>
			</div>
			<div class="menuLeftListTitle">공유 일정</div>
			<div class="menuLeftList">
				<input type='checkbox' id='vacation' value='vacation'/>
				<label for='vacation'>
					<span class='txt' title='휴가'>휴가</span>
				</label>
			</div>
			<div class="menuLeftList">
				<input type='checkbox' id='poll' value='poll'/>
				<label for='poll'>
					<span class='txt' title='설문'>설문</span>
				</label>
			</div>
			<div class="menuLeftList">
				<input type='checkbox' id='project' value='project'/>
				<label for='project'>
					<span class='txt' title='프로젝트'>프로젝트</span>
				</label>
			</div>
			<div class="menuLeftList">
				<input type='checkbox' id='community' value='community'/>
				<label for='comunity'>
					<span class='txt' title='동호회'>동호회</span>
				</label>
			</div>
		</div>
	</div>
</body>
</html>