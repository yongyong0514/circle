<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/cupertino/jquery-ui.css">
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.4.0/main.css"> -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/schedule/fullcalendar/fullcalendar.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/schedule/miniCalendar.css">

</head>
<body>
	<div id="calendar"></div>
	<input id="empNo" type="hidden" value="${empInfo.emp_info_emp_no}">	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
<script src="https://code.jquery.com/jquery-2.1.3.min.js" integrity="sha256-ivk71nXhz9nsyFDoYoGf2sbjrR9ddh+XDkCcfZxjvcM=" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>       
<script src='${pageContext.request.contextPath}/resources/js/schedule/fullcalendar.min.js'></script>
<script src="${pageContext.request.contextPath}/resources/js/schedule/ko.js"></script>

<script>

$(document).ready(function(){
	
})
	var loginId = $('#empNo').val();
	
	$('#calendar').fullCalendar({
		height: parent,
		contentHeight: parent,
		locale: 'kr',
		events				: function(start, end, timezone, callback) {
						      	$.ajax({
						      		url			:"${pageContext.request.contextPath}/schAjax/id",
						      		type		:"get",
						      		async		: false,
						      		traditional : true,
						      		data: {id 		: loginId
						      			  ,start	: start.format()
						      			  ,end		: end.format() 
						      			  ,myCalendarCheck : "true"
		                      			  ,vacationCheck : "true"
						      		},
						      		dataType:"json",
						      		success:function(json){
						      			
											events = [];
											$(json).each(function() {
												
												//이벤트 값 변수화
												var groupCode = $(this).prop('id').substr(0,4);
												var allDay = $(this).attr('allDay');
												var title = $(this).attr('title');
												var groupName = $(this).attr('groupName');
												var jobName = $(this).attr('jobName');
												var backgroundColor = $(this).attr('backgroundColor')
												
												//일정 종류에 따라 값 변형
												var randomNumber = Math.floor(Math.random() * 100); //컬러코드용 랜덤값 - 레드
												var randomNumber2 = Math.floor(Math.random() * 100); //컬러코드용 랜덤값 - 레드
												switch (groupCode) {
													case 'SCHN' :  break;
													default : allDay = 'on';
															   title = title + " " + jobName + " 휴가"; 
															   groupName = "휴가";
															   backgroundColor = "rgb(245,"+ randomNumber + "," + randomNumber2 + ")";
															   
															   break;
												}
												
												//allDay 데이터 가공
												var yn = false;
												var end = $(this).prop('end');
												var	start = $(this).prop('start');
												
												if(allDay == "on"){
													yn = true;
													if (start !== end) {
						              	              end = moment(end).add(1, 'days'); // 이틀 이상 AllDay 일정인 경우 달력에 표기시 하루를 더해야 정상출력
						              	        }
												}
												
												//events 객체에 주입
												events.push({
													id	  			: $(this).attr('id'),
													title 			: title,
													start 			: start,
													end	  			: end,
													allDay			: yn,
													repeat 			: $(this).attr('repeat'),
													endRepeat 		: $(this).attr('endRepeat'),
													content			: $(this).attr('content'),
													security		: $(this).attr('security'),
													stat			: $(this).attr('stat'),
													writer 			: $(this).attr('writer'),
													writeDate		: $(this).attr('writeDate'),
													modifyDate		: $(this).attr('modifyDate'),
													backgroundColor	: backgroundColor,
													writerName		: $(this).attr('writerName'),
													//캘린더에서 데이터를 받을때는 groupName으로 받고 서버로 보낼때는 groupCode로 보냄
													groupName		: groupName
												});
											});
											
											//월, 년 변경되었거나 자료 변경에 따라 다시 불러오기
											callback(events);
											console.log(events)
						      		}
								});
			},
			eventClick : function(){location='${pageContext.request.contextPath}/schedule/schMain';},
	});

</script>



</body>
</html>