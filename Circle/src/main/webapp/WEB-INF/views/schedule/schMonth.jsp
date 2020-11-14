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
            	 							$('#edit-title').empty();
            	 							$('#edit-start').val(date.format());
            	 							$('#edit-end').val(date.format());
            	 							$('.modalBtnContainer-modifyEvent').hide();
            	 							$('#eventModal').modal();
       				},
       				//event 클릭시 실행코드
                	eventClick			: function(event, jsEvent, view) {
                							$('#edit-title').empty();
                							$('#edit-title').val(event.title);
                							$('#edit-start').val(event.start.format('YYYY-MM-DD HH:mm'));
                							$('#edit-end').val(event.end);
                							$('#eventModal').modal();
           			},
                	//이벤트 목록 불러오기
                 	events				: function(start, end, timezone, callback) {
                 								
						                    	$.ajax({
						                    		url			:base+"/schAjax/id",
						                    		type		:"get",
						                    		traditional : true,
						                    		data: {id 		: "200101090031"
						                    			  ,start	: start.format()
						                    			  ,end		: end.format() 
						                    		},
						                    		dataType:"json",
						                    		success:function(json){
						                    			
						        						events = [];
						        						$(json).each(function() {
						        							
						        							//true false 를 boolean 타입으로 변환
						        							var yn = true;
						        							
						        							if($(this).attr('allDay') == "false"){
						        								yn = false
						        							}
						        							
						        							//events 객체에 주입
						        							events.push({
						        								id	  	: $(this).attr('id'),
						        								title 	: $(this).attr('title'),
						        								start 	: $(this).attr('start'),
						        								end	  	: $(this).attr('end'),
						        								allDay	: yn
						        							});
						        						});
						        						
						        						//월, 년 변경되었거나 자료 변경에 따라 다시 불러오기
														callback(events);
														console.log(events)
						                    		}
                 							});
                 	},
                		
                });
            });
            
        </script>


        
</head>
<body>
		
	<div id="calendar"></div>
	
        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">
                        	<i class="icon modal-title-planner"></i>
                        	일정
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                                <select class="inputModal select time" name="start-time" id="start-time">
                                	<option>시작시간</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                    <option value="카테고리1">카테고리1</option>
                                    <option value="카테고리2">카테고리2</option>
                                    <option value="카테고리3">카테고리3</option>
                                    <option value="카테고리4">카테고리4</option>
                                </select>
                            </div>


                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">설명</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

</body>
</html>