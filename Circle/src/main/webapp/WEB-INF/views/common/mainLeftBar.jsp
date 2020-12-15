<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/mainLeftBar.css">
<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js'></script>

</head>
<body>
	<div>
		<div class="menuLeftBar">
			<div>&nbsp;</div>
			<div class="menuLeftListTop">
				<div class="menuPhoto">
					<img src="" onerror="this.src='https://conservation-innovations.org/wp-content/uploads/2019/09/Dummy-Person.png'" class="imgSize1">
				</div>
				<div>${empInfo.emp_info_name}</div>
				<br>
				<div class="clock"></div>
				<div>
					<span class="smallFont">출근시간: </span>&nbsp;
					<input type="hidden" class="checkStime" value="${sessionScope.sTime }">
					<span class="startWork smallFont">
					
					</span>
				</div>
			</div>
<!-- 			<div class="menuLeftListTitle">4</div>
			<div class="menuLeftList">5</div>
			<div class="menuLeftList">6</div>					
			<div class="menuLeftList">7</div>
			<div class="menuLeftList">8</div>
			<div class="menuLeftList">9</div>
			<div class="menuLeftListTitle">10</div>						
			<div class="menuLeftList">11</div>
			<div class="menuLeftList">12</div>	 -->														
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

</script>


</html>