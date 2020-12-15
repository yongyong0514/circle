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
			case 'referer-list' : removeAllReferFormFlush();
									console.log('참조 삭제');
									console.log(realReferInfo);
									break;
			default : removeAllAttendFormFlush();
						console.log('참가 삭제');
						console.log(realAttendInfo);
						break;
			}
		});
		//참가/참여자 개별 삭제 아이콘 클릭시
		$(document).on('click','.icon-del', function(){
			//사번 추출
			var empNo =$(this).siblings('input').val();
			//현재 위치 확인
			var addOrRefer = $(this).closest('addOrRefer').attr('id');
			if(addOrRefer == 'referer-list'){
				//참조자 리스트인 경우
				//서버 전송용 변수에서 참조자 사번 삭제
				realReferInfo.splice(realReferInfo.indexOf(empNo),1);
				console.log(realReferInfo);
			} else {
				realAttendInfo.splice(realAttendInfo.indexOf(empNo),1);
				console.log(realAttendInfo);
			}
			
			var iconLocation = $(this).closest('li.name-icon');
			iconLocation.remove();
		});
	
	/************************
	** 다음/취소 버튼 기능 ** 
	************************/		
		$(document).on("click","#next-btn", function(){
			if(titleInputCheck() && dateCheck() && memberCheck()){
				
				console.log("참가자 정보");
				console.log(realAttendInfo);
				
				console.log("참조자 정보");
				console.log(realReferInfo);
				$('#poll-form').prop('action',"${pageContext.request.contextPath}/poll/questionInsert").submit();
			}				
			
		})
	/* ******************* */
	
	/* 조직도 확인버튼 클릭시 */				
	$('#insert-organ-confirm').on('click', organConfirm);
	
});

/*********************************************************** 함수 정의 부분 *******************************************************/

/* 참가자 전체삭제 버튼 기능 */
function removeAllAttendFormFlush(){
	attendFormFlush();
	checkedAttendId = [];
	checkedAttendName = [];
	checkedAttendInfo = [];
	realAttendInfo = [];
}
/* 참조자 전체삭제 버튼 기능 */
function removeAllReferFormFlush(){
	referFormFlush();
	checkedReferId = [];
	checkedReferName = [];
	checkedReferInfo = [];
	realReferInfo = [];
}

/* 참가자 입력창 확인(직접선택인 경우) */
function memberCheck(){
	if($('#radio-my').prop('checked')){
		console.log('radio checked');
		
		if($('#organ-view').find("li.name-icon").length > 0){
			return true;
		} else {
			alert('참가인원을 추가 해주세요');
			console.log("참가자 정보");
			console.log(realAttendInfo);
			
			console.log("참조자 정보");
			console.log(realReferInfo);
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
	realReferInfo = [];
	
	checkedAttendId = [];
	checkedAttendName = [];
	checkedAttendInfo = [];
	realAttendInfo = [];
		
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
		
		/* 체크박스 비우기 */
		$('ul.tree input[type=checkbox]').prop("checked",false);
		
		checkedReferInfo.push(checkedReferId);
		checkedReferInfo.push(checkedReferName);
		inputNameToReferForm(checkedReferInfo);
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
		
		/* 체크박스 비우기 */
		$('ul.tree input[type=checkbox]').prop("checked",false);
		
		checkedAttendInfo.push(checkedAttendId);
		checkedAttendInfo.push(checkedAttendName);
		inputNameToAttendForm(checkedAttendInfo);		
	}
	//조직도에 체크된 이름 <참조자> 폼에 넣기
	function inputNameToReferForm(checkedReferInfo){
		/* 참조자 폼에 있는 이름 제거 */
		referFormFlush();
		/* 서버 전송용 참조자 데이터 비우기 */
		realReferInfo = [];
		/* 폼에 이름 넣기 */
		$.each(checkedReferInfo[0], function (index, item){
			
			var overlap = false;
			/* 참가자와 중복 검사 */
			if(realAttendInfo != null){
				$.each(realAttendInfo, function(innerIndex, innerItem){
					if(item == innerItem){
						console.log('중복 발견')
						console.log(item);
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
				/* 서버 전송용 변수에 추가 */
				realReferInfo.push(item);
			}
		})
		/* 체크박스 비우기 */
		$('ul.tree input[type=checkbox]').prop("checked",false);
		checkedReferId = [];
		checkedReferName = [];
		checkedReferInfo = [];
		
		console.log(realReferInfo);
	};
	//조직도에 체크된 이름 <참가자> 폼에 넣기
	function inputNameToAttendForm(checkedAttendInfo){
		/* 참여자 폼에 있는 이름 제거 */
		attendFormFlush();
		/* 서버 전송용 참가자 데이터 비우기 */
		realAttendInfo = [];
		/* 폼에 이름 넣기 */
		$.each(checkedAttendInfo[0], function (index, item){
			var overlap = false;
			/* 참조자와 중복 검사 */
			if(realReferInfo != null){
				$.each(realReferInfo, function(innerIndex, innerItem){
					if(item == innerItem){
						console.log('중복 발견')
						console.log(item);
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
				/* 서버 전송용 변수에도 추가 */
				realAttendInfo.push(item);
			}
			
		})
		/* 체크박스 비우기 */
		$('ul.tree input[type=checkbox]').prop("checked",false);
		checkedAttendId = [];
		checkedAttendName = [];
		checkedAttendInfo = [];
		
		console.log(realAttendInfo);
	};
	/* 참가자 폼 비우기 */
	function attendFormFlush(){
		$('#organ-view ul.name-tag li.name-icon').remove();
	}
	/* 참조자 폼에 있는 이름 제거 */
	function referFormFlush(){
		$('#referer-list ul.name-tag li.name-icon').remove();
	}