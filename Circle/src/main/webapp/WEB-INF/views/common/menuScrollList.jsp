<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/menu/menuScrollList.css">

</head>
<body>
	<div class="menuBox">
		<div class="arrow">
			<div><img src="${pageContext.request.contextPath}/resources/img/common/menu/arrow.png" style="margin-top:9px"></div>
			<div></div>
		</div>
		<div class="buttonArea">
			<div><button class="buttonSize" onclick="location='${pageContext.request.contextPath}/alert/alertList'"><img src="${pageContext.request.contextPath}/resources/img/common/menu/159-email.png" class="menuIcon"><br>알림</button></div>
			<div><button class="buttonSize" onclick='location.href="${pageContext.request.contextPath}/post/postMain?nowPage=${paging.startPage}&cntPerPage${paging.cntPerPage}"'><img src="${pageContext.request.contextPath}/resources/img/common/menu/049-copy.png" class="menuIcon"><br>게시판</button></div>
			<div><button class="buttonSize" onclick="location='${pageContext.request.contextPath}/community/comuList'"><img src="${pageContext.request.contextPath}/resources/img/common/menu/077-menu-1.png" class="menuIcon"><br>커뮤니티</button></div>
			<div><button class="buttonSize" onclick="location='${pageContext.request.contextPath}/sign/signList'"><img src="${pageContext.request.contextPath}/resources/img/common/menu/068-pencil.png" class="menuIcon"><br>전자결재</button></div>
			<div><button class="buttonSize" onclick="location='${pageContext.request.contextPath}/storage/storageList'"><img src="${pageContext.request.contextPath}/resources/img/common/menu/120-diskette.png" class="menuIcon"><br>자료실</button></div>
			<div><button class="buttonSize" onclick="location='${pageContext.request.contextPath}/document/docuList'"><img src="${pageContext.request.contextPath}/resources/img/common/menu/041-folder.png" class="menuIcon"><br>문서관리</button></div>
			<div><button class="buttonSize"  onclick='location.href="${pageContext.request.contextPath }/project/projTodo"'>><img src="${pageContext.request.contextPath}/resources/img/common/menu/165-menu.png" class="menuIcon"><br>프로젝트</button></div>
			<div><button class="buttonSize" onclick="location='${pageContext.request.contextPath}/schedule/schMain'"><img src="${pageContext.request.contextPath}/resources/img/common/menu/163-calendar.png" class="menuIcon"><br>일정</button></div>
			<div><button class="buttonSize" disabled><img src="${pageContext.request.contextPath}/resources/img/common/menu/167-wall-clock.png" class="menuIcon"><br>예약</button></div>
			<div><button class="buttonSize" onclick="location='${pageContext.request.contextPath}/poll/pollMain'"><img src="${pageContext.request.contextPath}/resources/img/common/menu/121-paste.png" class="menuIcon"><br>설문</button></div>
			<div><button class="buttonSize" onclick="location.href='${pageContext.request.contextPath}/addressBook/allEmp'"><img src="${pageContext.request.contextPath}/resources/img/common/menu/109-smartphone.png" class="menuIcon"><br>주소록</button></div>
			<div><button class="buttonSize" onclick='location.href="${pageContext.request.contextPath }/attendance/myAttendance"'><img src="${pageContext.request.contextPath}/resources/img/common/menu/032-briefcase.png" class="menuIcon"><br>근태관리</button></div>
			<div><button class="buttonSize1"><img src="${pageContext.request.contextPath}/resources/img/common/menu/152-followers.png" class="menuIcon"><br>관리자</button></div>
		</div>
		<div class="changePlan">
		</div>
	</div>
</body>
</html>