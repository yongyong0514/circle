<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/schedule/fullcalendar/main.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src='http://fullcalendar.io/js/fullcalendar-2.3.2/lib/moment.min.js'></script>
<script src='http://fullcalendar.io/js/fullcalendar-2.3.2/lib/jquery.min.js'></script>
<script src="http://fullcalendar.io/js/fullcalendar-2.3.2/lib/jquery-ui.custom.min.js"></script>
<script src='http://fullcalendar.io/js/fullcalendar-2.3.2/fullcalendar.min.js'></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>       
<script src="${pageContext.request.contextPath}/resources/js/schedule/ko.js"></script>

      <script>
            $(function() {
            	var base = "${pageContext.request.contextPath}";
            	
            	//목록 불러오기
            	$.ajax({
            		url:base+"/schedule/schMain",
            		async:false,//blocking처리
            		type:"get",
            		dataType:"json",
            		success:function(result){
            			list = result;
            			console.log("list");
            		}
            	});
            	
            	//풀캘린더 로드
                $("#calendar").fullCalendar({
                	defaultView			: 'month',	//기본 뷰 설정
               	    header				: {
               	    						left	: 'today', // month/week뷰 변환 버튼
               	    						center	: 'prev, title, next',
               	    						right  	: 'month,agendaWeek,agendaDay'
               							    
               							  },
                	defaultDate			: moment(),//현재를 기준으로 생성
                	editable			: true,
                	eventLimit			: true,//이벤트 개수가 표시칸을 벗어나면 더보기 버튼 생성
            	 	dayClick			: function(date, jsEvent, view) {//날짜 클릭 기능 설정
            		   						 alert(date);
            		   						 alert(jsEvent);
            		   						 alert(view);
        								  },
    				                	
                	eventCilck			: function(info, e) {//클릭시 실행코드
					                		window.alert(info);
					                		
					                		//url클릭시 이동방지
					                		e.preventDefault();
					                		if(info.url){
					                			lovation.href = info.url;
					                	  }
                	},
                	events				: [
					                		{
					                			title:"프로젝트",
					                			start:"2020-11-03",
					                			end:"2020-12-15",
					                			backgroundColor:"skyblue"
					                		},
					                		{
					                			title:"통합 구현 평가",
					                			start:"2020-11-03",
					                			backgroundColor:"#FE9A2E"
					                		},
					                		{
					                			title:"프로젝트 피드백",
					                			start:"2020-11-12T09:10:00",
					                			allDay:false
					                		},
					                		{
					                			title:"프로젝트 피드백",
					                			start:"2020-11-12T09:10:00",
					                			allDay:false
					                		},
					                		{
					                			title:"프로젝트 피드백",
					                			start:"2020-11-12T09:10:00",
					                			allDay:false
					                		},
					                		{
					                			title:"프로젝트 피드백",
					                			start:"2020-11-12T09:10:00",
					                			allDay:false
					                		},
					                		{
					                			title:"프로젝트 피드백",
					                			start:"2020-11-12T09:10:00",
					                			allDay:false
					                		},
					                		{
					                			title:"프로젝트 피드백",
					                			start:"2020-11-12T09:10:00",
					                			allDay:false
					                		},
					                		{
					                			title:"취업상담",
					                			start:"2020-11-16T14:30:00",
					                			end	 :"2020-11-16T13:20:00",
					                			allDay:false
					                		}
					                	 ],

                });
            });
            
        </script>


        
</head>
<body>
		
	<div id="calendar"></div>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
	  <div class="modal-dialog">
	  
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">Modal Header</h4>
	      </div>
	      <div class="modal-body">
	        <p>This is Modal
	        </p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	    
	  </div>
	</div>

</body>
</html>