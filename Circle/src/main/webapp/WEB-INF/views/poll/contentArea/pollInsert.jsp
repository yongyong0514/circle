<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollPost.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollQuestionInsert.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollInsert.css">

<title>새 설문 작성</title>
</head>
<script>
	$(document).ready(function(){
		//topBar title 변경
		$('.pollHomeTitle').text('설문 작성');
	});

</script>
<body>
	<header>
		<jsp:include page="../contentTopBar/pollPostBar.jsp"></jsp:include>
	</header>
	<div class="content-container poll-insert-form">
		<form id="poll-form" name="poll-form" method="post">
			<fieldset>
				<table class="form-table">
					<tbody>
						<tr>
							<th>
								<span class="title">설문 제목</span>
							</th>
							<td>
								<div class="txt-wrap">
									<input class="txt w-max" type="text" name="title">
									<span class="alert-wrap desc-top-wrap warn-error">
										<span class="desc caution"><span class="alert_wrap wrap_desc_top go_error go_renew"><span class="desc caution">설문 제목은 필수 입력항목 입니다.</span></span></span>
									</span>
								</div>
							</td>
						</tr>
						<tr>
							<th>
								<span class="title">설문 기간</span>
							</th>
							<td>
								<span class="date-wrap">
									<input id="start-date" class="txt wfix_small datepicker" type="date" name="startDate" value="2020-11-30">
									<span class="icon icon-calendaer"></span>
								</span>
								~
								<span class="date-wrap">
									<input id="end-date" class="txt wfix_small datepicker" type="date" name="endDate" value="2020-12-30">
									<span class="icon icon-calendaer"></span>
								</span>
							</td>
						</tr>
						<tr>
							<th>
								<span class="title">설문 대상자</span>
							</th>
							<td>
								<div id="join-member-container">
									<span class="option-wrap">
										<input id="radio-dept" type="radio" name="joinMember" checked="checked" value="userDept">
										<label for="radio-dept">영업부</label>
									</span>
									(
									<span class="option-wrap">
										<input id="checkbox-dept-child" name="subDept"type="checkbox" value="Y">
										<label for="radio-dept-child">하위부서</label>
									</span>
									)
									<br>
									<span class="option-wrap">
										<input id="radio-my" type="radio" name="joinMember" value="handMade">
										<label for="radio-my">직접 선택</label>
									</span>
									<div id="organ-view" class="option-name-tag-wrap addOrRefer">
										<ul class="name-tag">
											<li class="create add-btn">
												<span class="btn-wrap">
													<span class="icon-form icon-addlist"></span>
													<span class="txt">추가</span>
												</span>
												<a class="remove-all-tag rest-btn">
													<span class="icon16 remove-all"></span>
													<span class="txt">전체삭제</span>
												</a>
											</li>
										</ul>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>
								<span class="title">참조자</span>
							</th>
							<td>
								<div id="referer-list" class="name-tag-wrap addOrRefer">
									<ul class="name-tag">
										<li class="create add-btn">
											<span class="btn-wrap">
												<span class="icon-form icon-addlist"></span>
												<span class="txt">추가</span>
											</span>
											<a class="remove-all-tag rest-btn">
												<span class="icon16 remove-all"></span>
												<span class="txt">전체 삭제</span>
											</a>
										</li>
									</ul>
								</div>
								<span class="desc-wrap">
									<span class="desc">
										※ 설문 결과를 공개로 설정하면, 그래프 결과가 공개됩니다.
										<br>
										 ※ 결과 문서는 설문결과 공개 여부과 관계없이 다운로드 받을 수 있습니다.
										 <br>
										 ※ 설문대상자 및 참조자로 설정한 사용자는 설문을 복사할 수 있습니다.
									</span>
								</span>
							</td>
						</tr>
						<tr>
							<th>
								<span class="title">설문 결과 공개</span>
							</th>
							<td>
								<span class="option-wrap">
									<input id="radio-public-y" type="radio" name="open" value="Y" checked="checked">
									<label for="radio-public-y">공개</label>
								</span>
								<span class="spacing"></span>
								<span class="option-wrap">
									<input id="radio-public-n" type="radio" name="open" value="N">
									<label for="radio-public-n">비공개</label>
								</span>
								<span class="desc-wrap">
									<span class="desc">
										※ 설문 결과 공개 여부를 설정합니다.
									</span>
								</span>
							</td>
						</tr>
						<tr>
							<th>
								<span class="title">댓글 작성</span>
							</th>
							<td>
								<span class="option-wrap">
									<input id="radio-reply-y" type="radio" name="reply" value="Y" checked="checked">
									<label for="radio-reply-y">사용</label>
								</span>
								<span class="spacing"></span>
								<span class="option-wrap">
									<input id="radio-reply-n" type="radio" name="reply" value="N">
									<label for="radio-reply-n">사용안함</label>
								</span>
							</td>
						</tr>
						<tr>
							<th>
								<span class="title">참여 후 수정 허용</span>
							</th>
							<td>
								<span class="option-wrap">
									<input id="radio-editable-y" type="radio" name="editable" value="Y" checked="checked">
									<label for="radio-editable-y">허용</label>
								</span>
								<span class="spacing"></span>
								<span class="option-wrap">
									<input id="radio-editable-n" type="radio" name="editable" value="N">
									<label for="radio-editable-n">허용안함</label>
								</span>
							</td>
						</tr>
					</tbody>
				</table>
			</fieldset>
		</form>
		<div class="form-action-wrap">
			<a id="next-btn" class="main-btn">
				<span class="txt">다음</span>
			</a>
			<a id="cancle-btn" class="sub-btn">
				<span class="txt">취소</span>
			</a>
		</div>
	</div>
	<div class="insertMemberOrganChart">
		<c:import url="/organChart/getInsertInfo"/>
	</div>

</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/circle/resources/js/poll/jquery.tmpl.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.min.js"></script>

<script>
	$(document).ready(function(){
		
		/* 조직도 드래그 기능 */
		$('#insert-organ-panel').draggable();
		
		/************************
		** 설문 대상 추가 기능 ** 
		************************/		
			//설문대상자 직접선택 라디오 버튼 숨기기
			$("#organ-view").hide();
			//설문대상자 직접선택 라디오 버튼 변경 인식
			$("input:radio[name=joinMember]").on("change", function(){
					if($("#radio-my").prop("checked")){
						$("#organ-view").show();
					} else {
						$("#organ-view").hide();
					}
			});
			
			//인원추가 버튼 클릭 인식/ 조직도 위치조정 후 오픈
			$(".icon-addlist").closest(".btn-wrap").on("click", organOpen);
			
			//전체삭제 버튼 기능
			$('.remove-all-tag').on('click', function(){
				var location = $(this).closest('.addOrRefer').prop('id');
				switch(location){
				case 'referer-list' : referFormFlush();break;
				default : attendFormFlush();break;
				}
			});
			//참가/참여자 개별 삭제 아이콘 클릭시
			$(document).on('click','.icon-del', function(){
				var iconLocation = $(this).closest('li.name-icon');
				iconLocation.remove();
			});
		
		/************************
		** 다음/취소 버튼 기능 ** 
		************************/		
			$(document).on("click","#next-btn", function(){
				if(titleInputCheck() && dateCheck() && memberCheck()){
					$('#poll-form').prop('action',"${pageContext.request.contextPath}/poll/questionInsert").submit();
				}				
				
			})
		/* ******************* */
		
		/* 조직도 확인버튼 클릭시 */				
		$('#insert-organ-confirm').on('click', organConfirm);
		
	});
	
	/*********************************************************** 함수 정의 부분 *******************************************************/
	
	/* 참가자 입력창 확인(직접선택인 경우) */
	function memberCheck(){
		if($('#radio-my').prop('checked')){
			console.log('radio checked');
			
			if($('#organ-view').find("li.name-icon").length > 0){
				return true;
			} else {
				alert('참가인원을 추가 해주세요');
				return false;
			}
			
		} else {
			return true;
		}
	}
	
	/* 날짜 입력창 확인 */
	function dateCheck(){
		var startDate = $('#start-date').val();
        var startDateArr = startDate.split('-');
         
        var endDate = $('#end-date').val();
        var endDateArr = endDate.split('-');
                 
        var startDateCompare = new Date(startDateArr[0], startDateArr[1], startDateArr[2]);
        var endDateCompare = new Date(endDateArr[0], endDateArr[1], endDateArr[2]);
         
        if(startDateCompare.getTime() > endDateCompare.getTime()) {
             
            alert("시작날짜와 종료날짜를 확인해 주세요.");
             
            return false;
        } else {
        	return true;
        }
	}
	
	/* 제목 입력창 확인 */
	function titleInputCheck(){
		if($("input[name=title]").val() == ''){
			$(".desc-top-wrap").css("display","block"),$("input[name=question]").css({"border-color": "red","color": "red"});
			return false;
		}else {
			return true;
		}
	}
	
	/************************
	** 설문 대상 추가 기능 ** 
	************************/	
		/* 변수 선언 */
		checkedReferId = [];
		checkedReferName = [];
		checkedReferInfo = [];
		
		checkedAttendId = [];
		checkedAttendName = [];
		checkedAttendInfo = [];
			
		//인원추가용 조직도 오픈 기능
		function organOpen(){
			var p = $(this).offset();
			$(".insert-organPanel").css({"position":"absolute","top":p.top,"left":p.left}).show();
			/* 참조/참여 확인 */
			addOrRefer = $(event.target).closest('div.addOrRefer').attr('id');
			console.log(addOrRefer);
		}	
		//조직도 확인버튼 기능
		function organConfirm(){
			switch(addOrRefer){
			case 'referer-list' : referInput();break;
			default : attendInput();break;
			}
		}
		/* 참조자에 변수에 이름넣기 */
		function referInput(){
			/* 변수 비우기 */
			checkedReferInfo = [];
			checkedReferId = [];
			checkedReferName = [];
			$('ul.tree .empBtn input[type=checkbox]:checked').each(function(){
				checkedReferId.push($(this).data('name'));
				checkedReferName.push($(this).parent().text().trim());
			});
			checkedReferInfo.push(checkedReferId);
			checkedReferInfo.push(checkedReferName);
			console.log(checkedReferInfo);
			inputNameToReferForm();
		}
		/* 참가자 변수에 이름넣기 */
		function attendInput(){
			/* 변수 비우기 */
			checkedAttendInfo = [];
			checkedAttendId = [];
			checkedAttendName = [];
			$('ul.tree .empBtn input[type=checkbox]:checked').each(function(){
				checkedAttendId.push($(this).data('name'));
				checkedAttendName.push($(this).parent().text().trim());
			});
			checkedAttendInfo.push(checkedAttendId);
			checkedAttendInfo.push(checkedAttendName);
			console.log(checkedAttendInfo);
			inputNameToAttendForm();		
		}
		//조직도에 체크된 이름 <참조자> 폼에 넣기
		function inputNameToReferForm(){
			/* 참조자 폼에 있는 이름 제거 */
			referFormFlush();
			/* 폼에 이름 넣기 */
			$.each(checkedReferInfo[1], function (index, item){
				console.log(item);
				var overlap = false;
				/* 참가자와 중복 검사 */
				if(checkedAttendInfo != null){
					$.each(checkedAttendInfo[0], function(innerIndex, innerItem){
						if(checkedReferInfo[0][index] == checkedAttendInfo[0][innerIndex]){
							overlap = true;
							return false;
						}		
					});
				} 
				/* 변수화 */
				var tempIdName = {"name" : checkedReferName[index], "id" : checkedReferId[index], "type" : "refer"};
				/* 중복이 없을 시 이름 넣기 */
				if(overlap == false){
					$('#add-name-template').tmpl(tempIdName).insertBefore('#referer-list ul.name-tag .create');
				}
			})
			/* 체크박스 비우기 */
			$('ul.tree input[type=checkbox]').prop("checked",false);
		};
		//조직도에 체크된 이름 <참가자> 폼에 넣기
		function inputNameToAttendForm(){
			/* 참여자 폼에 있는 이름 제거 */
			attendFormFlush();
			/* 폼에 이름 넣기 */
			$.each(checkedAttendInfo[1], function (index, item){
				console.log(item);
				var overlap = false;
				/* 참조자와 중복 검사 */
				if(checkedReferInfo != null){
					$.each(checkedReferInfo[0], function(innerIndex, innerItem){
						if(checkedAttendInfo[0][index] == checkedReferInfo[0][innerIndex]){
							overlap = true;
							return false;
						}				
					});
				} 
				/* 변수화 */
				var tempIdName = {"name" : checkedAttendName[index], "id" : checkedAttendId[index], "type" : "attend"};
				/* 중복이 없을 시 이름 넣기 */
				if(overlap == false){
					$('#add-name-template').tmpl(tempIdName).insertBefore('#organ-view ul.name-tag .create');
				}
			})
			/* 체크박스 비우기 */
			$('ul.tree input[type=checkbox]').prop("checked",false);
		};
		/* 참가자 폼 비우기 */
		function attendFormFlush(){
			$('#organ-view ul.name-tag li.name-icon').remove();
		}
		/* 참조자 폼에 있는 이름 제거 */
		function referFormFlush(){
			$('#referer-list ul.name-tag li.name-icon').remove();
		}
</script>

<!-- 참여/참조자 이름 추가 템플릿 -->
<script type="text/html" id="add-name-template">
<li class="name-icon">
	<span class="name">\${name}</span>
	<span class="btn-wrap">
		<span class="icon-classic icon-del" title="삭제"></span>
	</span>
	<input name=\${type} type="hidden" value="\${id}">
</li>
</script>

</html>