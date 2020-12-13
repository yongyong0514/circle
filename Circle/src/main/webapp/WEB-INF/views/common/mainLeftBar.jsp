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
					<img src="https://i.pravatar.cc/128" onerror="this.src='https://conservation-innovations.org/wp-content/uploads/2019/09/Dummy-Person.png'" class="imgSize1">
				</div>
				<div class="clock"></div>
				<div class="startWork">
					<span>출근시간: </span>
					<span>
						<c:out value = "${session.sTime }"/>
					</span>
				</div>
			</div>
			<div class="menuLeftListTitle">4</div>
			<div class="menuLeftList">5</div>
			<div class="menuLeftList">6</div>					
			<div class="menuLeftList">7</div>
			<div class="menuLeftList">8</div>
			<div class="menuLeftList">9</div>
			<div class="menuLeftListTitle">10</div>						
			<div class="menuLeftList">11</div>
			<div class="menuLeftList">12</div>															
		</div>
	</div>
</body>

<script>
	$(function(){
	    displayTime();
	});
	
	//시계 표시
	function displayTime() {
	    var time = moment().format('YYYY년 MM월 D일<br>HH시 mm분');
	    $('.clock').html(time);
	    setTimeout(displayTime, 1000);
	}

</script>


</html>