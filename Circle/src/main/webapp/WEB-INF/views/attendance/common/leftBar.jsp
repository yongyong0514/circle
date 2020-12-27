<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/attendance/common/leftBar.css">
<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js'></script>
</head>
<body>
	<div>
		<div class="menuLeftBar">
			<!-- 현재 근태현황 상태표시 시작 -->
			<div class="attendanceStatus">
				<table class="attendanceStatusTable">
					<tr>
						<th class="clock" colspan="2"></th>
					</tr>
					<tr><td><td></tr>
					<tr>
						<td>출근시간</td>
						<td class="startWork"></td>
					</tr>
				</table>
			</div>
			<!-- 현재 근태현황 상태표시 끝 -->

			<!-- 메뉴 시작 -->
			<div class="menuLeftListTitle">인사/근태관리</div>
			<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/attendance/myAttendance'">내 근태이력</div>
			<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/empInfo/myInfo'">내 인사정보</div>
			<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/vacation/myVacation'">내 연차이력</div>
			
			<!--
				근태/인사관리 메뉴 시작
				- 인사 담당자 확인 후 출력
			 -->
			<c:if test="${empInfo.emp_info_dept_code eq 'D0201' 
							or empInfo.emp_info_dept_code eq 'D0000'}">
				<div class="menuLeftListTitle">전사관리</div>
	<!-- 
	 				<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/attendance/allAttendanceList'">전사 근태현황</div>
					<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/attendance/allAttendanceStatistic'">전사 근태통계</div>
	 -->
						<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/empInfo/allInfoList'">전사 인사정보</div>
	<%-- 							
					<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/attendance/allVacationList'">전사 연차현황</div>
					<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/attendance/allVacationHistory'">전사 연차 사용내역</div>
	 --%>
			</c:if> 	
				<!-- 근태/인사관리 메뉴 끝 -->

			<div class="menuLeftListTitle">전사근태관리</div>
 				<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/attendance/myAttendance'">전사 근태현황</div>
				<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/attendance/myAttendance'">전사 근태통계</div>
				<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/empInfo/allInfoList'">전사 인사정보</div>
				<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/attendance/myAttendance'">전사 연차현황</div>
				<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/attendance/myAttendance'">전사 연차 사용내역</div>
			<!-- 근태/인사관리 메뉴 끝 -->
					
			<!-- 메뉴 끝 -->
		</div>
		
	</div>
</body>

<script>
	$(function(){
	    displayTime();
	    
		var sTime = "${sessionScope.sTime}";
		var time = new Date(sTime);
		var text = "";
		
	    if(isNull(sTime)){
	    	text = "출근 전";
		} else{
			text = transformDateFormat(time, "time");
		}
	    	$(".startWork").text(text);
	});

	//시계 표시
	function displayTime() {
	    var time = moment().format('YYYY년 MM월 D일<br>HH시 mm분');
	    $('.clock').html(time);
	    setTimeout(displayTime, 1000);
	}

	//날짜 포맷 변경
	function transformDateFormat(date, type){
		if(type=="date"){
		    var year = date.getFullYear();				//yyyy
		    var month = (1 + date.getMonth());			//M
		    month = month >= 10 ? month : '0' + month;	//month 두자리로 저장
		    var day = date.getDate();					//d
		    day = day >= 10 ? day : '0' + day;			//day 두자리로 저장
		    
		    return  year + '-' + month + '-' + day;		//형태 생성
		} else if(type=="time"){
			var hour = date.getHours();
		    hour = hour >= 10 ? hour : '0' + hour;		//hour 두자리로 저장
		    var minute = date.getMinutes();
		    minute = minute >= 10 ? minute : '0' + minute;	//minute 두자리로 저장
		    
		    return  (hour + ":" + minute);		//형태 생성
		}
		
	}
	
	// null여부 확인
	function isNull(data){
		return (data == undefined || data == null || data == "") ? true : false;
	}
	
</script>

</html>