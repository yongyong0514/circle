<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/menuBar/menuTopBar.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/menu/menuScrollList.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/menu/menuRightList.css">
</head>
<body>
	<c:if test="${ empty empInfo}">
		<script>
			location.replace("${pageContext.request.contextPath}/login");
		</script>
	</c:if>
	<c:if test="${ !empty empInfo}">
<nav>
	<div class="menuTopBar">
		<ul>
			<li><img src="${pageContext.request.contextPath}/resources/img/common/menuTopBar/grid50x50.png" class="menuBtnLeft" id="menuBtnLeft" onclick="">
				<div class="menuBox">
					<div class="arrow1">
						<div><img src="${pageContext.request.contextPath}/resources/img/common/menu/arrow.png" style="margin-top:9px"></div>
						<div></div>
					</div>
					<div class="buttonArea">
						<div><button class="buttonSize" onclick="location='${pageContext.request.contextPath}/alert/alertList'"><img src="${pageContext.request.contextPath}/resources/img/common/menu/159-email.png" class="menuIcon"><br>알림</button></div>
						<div><button class="buttonSize" onclick='location.href="${pageContext.request.contextPath}/post/postMain"'><img src="${pageContext.request.contextPath}/resources/img/common/menu/049-copy.png" class="menuIcon"><br>게시판</button></div>
						<div><button class="buttonSize" onclick="location='${pageContext.request.contextPath}/community/comuList'"><img src="${pageContext.request.contextPath}/resources/img/common/menu/077-menu-1.png" class="menuIcon"><br>커뮤니티</button></div>
						<div><button class="buttonSize" onclick="location='${pageContext.request.contextPath}/sign/signList'"><img src="${pageContext.request.contextPath}/resources/img/common/menu/068-pencil.png" class="menuIcon"><br>전자결재</button></div>
						<div><button class="buttonSize" onclick="location='${pageContext.request.contextPath}/storage/storageList'"><img src="${pageContext.request.contextPath}/resources/img/common/menu/120-diskette.png" class="menuIcon"><br>자료실</button></div>
						<div><button class="buttonSize" onclick="location='${pageContext.request.contextPath}/docu/docuList'"><img src="${pageContext.request.contextPath}/resources/img/common/menu/041-folder.png" class="menuIcon"><br>문서관리</button></div>
						<div><button class="buttonSize" onclick='location.href="${pageContext.request.contextPath}/project/projMain"'>><img src="${pageContext.request.contextPath}/resources/img/common/menu/165-menu.png" class="menuIcon"><br>프로젝트</button></div>
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
			</li>
			<li><button class="menuBtn" onclick="location.href='${pageContext.request.contextPath}/common/mainPage'">페이퍼컴퍼니</button></li>
			<li><button class="menuBtn2">My Page</button></li>
			<li><button class="menuBtn2">My Profile</button></li>
			
			<li>
				<div class="menuBtn3">${empInfo.emp_info_name} ${empInfo.job_info_name} 님</div>
			</li>
			
			<li><img src="${pageContext.request.contextPath}/resources/img/common/menuTopBar/hamburger50x50.png" class="menuBtnRight" id="menuBtnRight" onclick="">
				<div class="menuBox1">
					<div class="buttonArea1">
						<div><button class="buttonSize2 sTimeBtn" onclick="sTimeCheck();">&nbsp;출근 기록</button></div>
						<div><button class="buttonSize2 eTimeBtn" onclick="eTimeCheck();">&nbsp;퇴근 기록</button></div>
						<div><button class="buttonSize2"></button></div>
						<form name="logout" action="${pageContext.request.contextPath}/empInfo/logout" method="GET">
						<div><button class="buttonSize3" onclick="logout();">&nbsp;로그 아웃</button></div>
						</form>
					</div>
				</div>
			</li>
			<li><input type="text" class="menuAlert" id="menuAlert" value="" placeholder ="0" readonly></li>
			<li><input type="text" class="menuSearchBox" id="menuSearchBox" placeholder="검색" onfocus="this.placeholder = ''" onblur="this.placeholder='검색'"></li>	
		</ul>
	</div>
<%-- 	<div class="menuScroll">
		<jsp:include page="../common/menuScrollList.jsp" />
	</div> --%>
</nav>
	</c:if>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(".menuBtnLeft").mouseenter(function(){
		$(".menuBox").fadeIn(150);
	});
	
	$(".menuBox").mouseleave(function(){
		$(".menuBox").fadeOut(100);
	});
	$(".menuBtnRight").mouseenter(function(){
		$(".menuBox1").fadeIn(150);
	});
	
	$(".menuBox1").mouseleave(function(){
		$(".menuBox1").fadeOut(100);
	});
</script>
<script>
	function logout(){
		location.href = "logout";
	}
</script>
<script>
	function mainPage(){
		location.href = "${pageContext.request.contextPath}/mainPage";
	}
</script>
</body>


<script>
	$(function(){
		if(isNull("${sessionScope.sTime}")){
			$(".eTimeBtn").prop("disabled", true);
		} else{
			$(".sTimeBtn").prop("disabled", true);
		}
	});

	function sTimeCheck(){
		var today = getFormatDate(new Date());
		var sTime = getFormatDateAndTime(new Date());
		location.reload();
		
		$.ajax({
			url: "${pageContext.request.contextPath}/attendance/sTimeCheck",
			type: "post",
			dataType: "text",
			data: {"today": today,
				   "sTime": sTime},
			success: function(data){
				$(".sTimeBtn").prop("disabled", true);
				$(".eTimeBtn").prop("disabled", false);
			}, error: function(err){
				console.table(err);
			}
		});
	};
	
	function eTimeCheck(){
		var eTime = getFormatDateAndTime(new Date());
		location.reload();
		
		$.ajax({
			url: "${pageContext.request.contextPath}/attendance/eTimeCheck",
			type: "post",
			dataType: "text",
			data: {"eTime": eTime},
			success: function(data){
				$(".eTimeBtn").prop("disabled", true);
				$(".sTimeBtn").prop("disabled", false);
			}, error: function(err){
				console.table(err);
			}
		});
	}
	
	/* 날짜포맷 변경 */
	function getFormatDate(date){
	    var year = date.getFullYear();				//yyyy
	    var month = (1 + date.getMonth());			//M
	    month = month >= 10 ? month : '0' + month;	//month 두자리로 저장
	    var day = date.getDate();					//d
	    day = day >= 10 ? day : '0' + day;			//day 두자리로 저장
	    return  year + '-' + month + '-' + day;		//형태 생성
	}
	
	
	function getFormatDateAndTime(date){
	    var year = date.getFullYear();				//yyyy
	    var month = (1 + date.getMonth());			//M
	    month = month >= 10 ? month : '0' + month;	//month 두자리로 저장
	    var day = date.getDate();					//d
	    day = day >= 10 ? day : '0' + day;			//day 두자리로 저장
	    var hour = date.getHours();
	    hour = hour >= 10 ? hour : '0' + hour;		//hour 두자리로 저장
	    var minute = date.getMinutes();
	    minute = minute >= 10 ? minute : '0' + minute;	//minute 두자리로 저장
	    var second = date.getSeconds();
	    second = second >= 10 ? second : '0' + second;	//second 두자리로 저장
	    return  (year + '-' + month + '-' + day + " " + hour + ":" + minute + ":" + second);		//형태 생성
	}

	function isNull(data){
		return ( data == undefined || data == null || data == "" );
	}


</script>


</html>