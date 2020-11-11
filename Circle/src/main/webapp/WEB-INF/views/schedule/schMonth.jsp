<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/schedule/fullcalendar/main.min.css">
<script src='http://fullcalendar.io/js/fullcalendar-2.3.2/lib/moment.min.js'></script>
<script src='http://fullcalendar.io/js/fullcalendar-2.3.2/lib/jquery.min.js'></script>
<script src="http://fullcalendar.io/js/fullcalendar-2.3.2/lib/jquery-ui.custom.min.js"></script>
<script src='http://fullcalendar.io/js/fullcalendar-2.3.2/fullcalendar.min.js'></script>

        <script>
            $(function() {
                $("#calendar").fullCalendar({
                	defaultDate:moment(),
                	events:[
                		{
                			title:"프로젝트",
                			start:"2020-11-03",
                			end:"2020-12-15"
                		},
                		{
                			title:"통합 구현 평가",
                			start:"2020-11-03"
                		}
                	],
                });
            });
        </script>
</head>
<body>
	<div id="calendar"></div>
</body>
</html>