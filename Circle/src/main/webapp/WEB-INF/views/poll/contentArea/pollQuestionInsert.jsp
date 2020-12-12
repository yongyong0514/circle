<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollPost.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollInsert.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollQuestionInsert.css">


<title>새 설문 작성</title>
</head>
<script>
	$(document).ready(function(){
		//topBar title 변경
		$('.pollHomeTitle').text('설문 문항 작성');
	});
</script>
<body>
	<header>
		<jsp:include page="../contentTopBar/pollPostBar.jsp"></jsp:include>
	</header>
	<div class="content-container poll-insert-form">
		<!-- 문항 입력 부분 시작 -->
		<ul class="poll-list ul-sort">
			<li>
				<form id="poll-form" name="poll-form">
					<fieldset>
						<table class="form-table">
							<colgroup>
								<col width="100px">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th>
										<span class="title">시작 안내 문구</span>
										<span class="help">
											<span class="tool-tip">
												시작 안내 문구는 설문 작성 전, 최상단에 보여지게 됩니다. 
												<br>
												설문에 대한 취지나 이미지 등을 삽입할 수 있습니다.
												<i class="tail_left"></i>
											</span>
										</span>
									</th>
									<td>
										<div class="txtarea-wrap">
											<textarea class="w-large"  name="poll-start-sentence" maxlength="1000">
											</textarea>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</form>
			</li>
			
			
			<!---------------------------------->
			<!------- 추가된 문항 위치 --------->
			<!---------------------------------->
			
			<!---------------------------------->
			<!-- 문항추가 입력 폼 추가될 위치 -->
			<!---------------------------------->
			
			<!-- 문항추가 버튼 시작 -->
			<li class="action">
				<div id="add-question-btn" class="add-poll-btn">
					<span class="icon"></span>
					<span class="txt">문항 추가</span>
				</div>
			</li>
			<!-- 문항추가 입력 폼 끝 -->
		</ul>
		<!-- 문항 입력 부분 끝 -->
		
		<!-- 문항 입력 완료 버튼 시작 -->
		<div class="form-action-wrap">
			<a id="finish-btn" class="main-btn">
				<span class="txt">작성 완료</span>
			</a>
			<a id="previous-btn" class="sub-btn">
				<span class="txt">이전</span>
			</a>
			<a id="temp-save-btn" class="sub-btn">
				<span class="txt">임시저장</span>
			</a>
		</div>
		<!-- 문항 입력 완료 버튼 끝 -->
	</div>

<script src="/circle/resources/js/poll/jquery.min.js"></script>
<script src="/circle/resources/js/poll/jquery.tmpl.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/poll/jquery.serializeObject.js"></script>

<!-- 문항추가 입력 폼 -->
<script type="text/html" id="question-form-template">
<li class="question-item question-item-edit">
<form class="question-form">
	<table class="poll-form form-table">
		<tbody>
			<tr>
				<th>
					<span class="title">질문</span>
				</th>
				<td>
					<div class="txt-wrap">
						<input class="txt w-large" type="text" name="question">
						<span class="alert-wrap desc-top-wrap warn-error">
							<span class="desc caution">2 ~ 255자 까지 입력할 수 있습니다.</span>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<th>
					<span class="title">설문 문항 타입</span>
				</th>
				<td>
					<div class="flex-info">
						<span class="select-wrap">
							<select name="question-type">
								<option value="select">선택형</option>
								<option value="text">텍스트형</option>
								<option value="score">점수형</option>
							</select>
						</span>
						<span class="select-wrap">
							<select name="question-sub-type">
								<option value="single">하나만 선택</option>
								<option value="plural">복수 선택</option>
							</select>
						</span>
						<span class="spacing1"></span>
						<span class="option-wrap">
							<input id="checkbox-required" type="checkbox" name="required" value="Y">
							<label for="checkbox-required">필수 답변</label>
						</span>
					</div>
				</td>
			</tr>
			<tr class="question-answer-row">
				<th>
					<span class="title">보기</span>
				</th>
				<td class="question-answer-container">
					<ul class="answer-wrap">
						<li>
							<span class="add-question-btn txt-wrap disable">
								<input type="radio" name="radio" value="-1" disabled="disabled">
								<input class="txt wfix-max" type="text" readonly="readonly" value="보기를 추가하려면 이곳을 클릭하세요.">
							</span>
						</li>
						<li class="create">
							<span class="add-etc-question-btn btn-wrap btn-create">
								<span class="icon-form icon-addlist"></span>
								<span class="txt">기타 추가</span>
							</span>
						</li>
					</ul>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="poll-action">
		<a class="submit-btn main-btn">
			<span class="txt">완료</span>
		</a>
		<a class="cancle-btn sub-btn">
			<span class="txt">취소</span>
		</a>
	</div>
</form>
</li>
</script>

<!-- 보기 추가 옵션 템플릿 radio -->
<script type="text/html" id="question-option-template-radio">
<li class="question-option-item">
	<span class="txt-wrap">
		<input type="radio" name="radio" value="1">
		<input class="txt wfix-max question-option-desc" type="text" name="option-2">
		<span class="alert-wrap desc-top-wrap warn-error">
			<span class="desc caution">1 ~ 64자 까지 입력할 수 있습니다.</span>
		</span>
	</span>
	<span class="m-btn-wrap del-question-option-btn">
		<span class="icon-classic icon-del"></span>
	</span>
</li>
</script>

<!-- 보기 추가 옵션 템플릿 checkbox -->
<script type="text/html" id="question-option-template-checkbox">
<li class="question-option-item">
	<span class="txt-wrap">
		<input type="checkbox" name="checkbox" value="1">
		<input class="txt wfix-max question-option-desc" type="text" name="option-2">
		<span class="alert-wrap desc-top-wrap warn-error">
			<span class="desc caution">1 ~ 64자 까지 입력할 수 있습니다.</span>
		</span>
	</span>
	<span class="m-btn-wrap del-question-option-btn">
		<span class="icon-classic icon-del"></span>
	</span>
</li>
</script>

<!-- 기타 추가 옵션 템플릿 radio -->
<script type="text/html" id="question-etc-option-template-radio">
<li class="question-option-item-etc etc">
	<span class="txt-wrap">
		<input type="radio" name="radio" value="1">
		<input class="txt wfix-max question-option-desc" type="text" name="option-2" value="기타">
		<span class="alert-wrap desc-top-wrap warn-error">
			<span class="desc caution">1 ~ 64자 까지 입력할 수 있습니다.</span>
		</span>
	</span>
	<span class="m-btn-wrap del-question-option-btn">
		<span class="icon-classic icon-del del-etc"></span>
	</span>
</li>
</script>
<!-- 기타 추가 옵션 템플릿 checkbox-->
<script type="text/html" id="question-etc-option-template-checkbox">
<li class="question-option-item-etc etc">
	<span class="txt-wrap">
		<input type="checkbox" name="checkbox" value="1">
		<input class="txt wfix-max question-option-desc" type="text" name="option-2" value="기타">
		<span class="alert-wrap desc-top-wrap warn-error">
			<span class="desc caution">1 ~ 64자 까지 입력할 수 있습니다.</span>
		</span>
	</span>
	<span class="m-btn-wrap del-question-option-btn">
		<span class="icon-classic icon-del del-etc"></span>
	</span>
</li>
</script>

<script type="text/html" id="question-option-plural-only">
<tr class="plural-only" style="display:table-row;">
	<th>
		<span class="title">최대 선택 개수</span>
	</th>
	<td>
		<select id="maxSelectCase" name="maxSelectCase">
			<option value="0"> 제한없음 </option>
		</select>
	</td>
</tr>
</script>

<!-- 선택형 추가완료 폼 샘플 -->
<script type="text/html" id="question-select-complete-form 샘플">
<li class="question-item sort">
	<div class="question-preview">
		<span class="question">
			<span class="seq">1</span>
			.
			<span class="necessary">[필수]</span>
			제목
		</span>
		<ul class="answer-wrap">
			<li>
				<span class="option-wrap">
					<input id="radio-question-1001-1" name="question-1001" type="radio">
					<label for="radio-question-1001-2">
						보기1 입력
					</label>
				</span>
			</li>
			<li class="etc">
				<span class="txt-wrap">
					<input type="radio" name="question-1001">
					<span class="label-wrap txt">기타입력</span>
					<input class="wfix-max txt" type="text" name="answer">
				</span>
			</li>
		</ul>
	</div>
	<div class="action-wrap">
		<a class="icon24-btn edit-question-btn" title="수정">
			<span class="toolbar-icon write"></span>
		</a>
		<a class="icon24-btn remove-question-btn" title="삭제">
			<span class="toolbar-icon del"></span>
		</a>
	</div>
</li>
</script>

<!-- 미리보기 생성 -->
<script type="text/html" id="optionable-preview">
<li class="question-item sort">
	<div class="question-preview">
		<span class="question">
			<span class="seq">\${seq}</span>
			.
			<span class="necessary">\${necessary}</span>
			\${title}
		</span>
		<ul class="answer-wrap">


		</ul>
	</div>
	<div class="action-wrap">
		<a class="icon24-btn edit-question-btn" title="수정">
			<span class="toolbar-icon write"></span>
		</a>
		<a class="icon24-btn remove-question-btn" title="삭제">
			<span class="toolbar-icon del"></span>
		</a>
	</div>
</li>
</script>
<!-- 미리보기 - 보기 생성 -선택형  -->
<script type="text/html" id="optionable-preview-content">
			<li>
				<span class="option-wrap">
					<input id="\${checkType}-question-\${seq}-\${subSeq}" name="question-\${seq}" type="\${checkType}">
					<label for="\${checkType}-question-\${seq}-\${subSeq}">
						\${content}
					</label>
				</span>
			</li>
</script>
<!-- 미리보기 - 기타 - 보기 생성 -선택형  -->
<script type="text/html" id="optionable-preview-etc-content">
			<li class="etc">
				<span class="txt-wrap">
					<input type="\${checkType}" name="question-\${seq}"

					<span class="label-wrap txt">\${content}</span>
					<input class="wfix-max txt" type="text" name="answer">
				</span>
			</li>
</script>
<!-- 미리보기 보기 생성 -텍스트형/단문  -->
<script type="text/html" id="text-short-type-preview">
			<li>
				<span class="txt-wrap">
					<input class="wfix-max txt" type="text" name="answer">
				</span>
			</li>
</script>
<!-- 미리보기 보기 생성 -텍스트형/장문  -->
<script type="text/html" id="text-long-type-preview">
			<li>
				<span class="txt-wrap">
					<textarea class="wfix-max textarea"  name="answer" rows="5">
					</textarea>
				</span>
			</li>
</script>

<!-- 미리보기 생성 - 점수형 -->
<script type="text/html" id="score-preview">
			<li>
				<span class="option-wrap">
					<input id="radio-question-\${seq}-\${subSeq}" name="question-\${seq}" type="radio">
					<label for="radio-question-\${seq}-\${subSeq}">
						\${subSeq}
					</label>
				</span>
			</li>
</script>

<script src="/circle/resources/js/poll/questionInsert.js"></script>
<script type="text/javascript">
/*********************************  함수 정의 영역  ****************************/

/* 문항 전역변수 초기화 */
questions = new Array();					//전체 문항 
oneQuestion = {};				//문항 하나
seq = 0;							//순번
title = "";								//제목
necessary = "";							//필수 체크
selectType = "";							//선택형
checkType = "";							//radio - checkbox 종류 선택
selectContents = new Array();//문항 내용
subSeq = 0;							//문항순번
etcContent = "";
score = 0;
pluralMaximum = 0;
checkLowerType = "";




/* 문항 완료 미리보기 통합 추가 */
function addPreview(){
	seq += 1;
	title = extractTitle();
	necessary = extractNecessary();
	
	//문항 공통데이터 변수화
	var data = {"seq":seq, "title":title, "necessary":necessary};
	
	//문항 공통데이터 출력
	$("#optionable-preview").tmpl(data).insertBefore('.action');
	
	switch(extractQuestionType()){
	case 'select'	: addPreviewSelectOptionable();break;
	case 'text'		: addPreviewTextType();break;
	case 'score'	: addPreviewScore();break;
	}
}



/*******************************
텍스트형 문항 추가 관련 함수 
********************************/
	/* 텍스트형 - 문항 완료 미리보기 - 추가 */
	function addPreviewTextType(){
		/* 단문 장문 확인 */
		switch(textLowerType()){
		case 'text': $('#text-short-type-preview').tmpl().appendTo(".question-item:last .answer-wrap");break;
		case 'textarea'	: $('#text-long-type-preview').tmpl().appendTo(".question-item:last .answer-wrap");break;
		}
		
		/* 결과 변수에 저장 */
		oneQuestion = {"seq":seq,"title":title,"necessary":necessary,"type":"text","checkLowerType":textLowerType()};
		
		console.log(oneQuestion);
		questions.push(oneQuestion);
		console.log(questions);
		
	}
	/* 텍스트형 - 서브타입 단문/장문 선택 - 확인 */
	function textLowerType(){
		return $('.question-form select[name=question-sub-type] option:selected').val();
	}
	
	
/*******************************
점수형 문항 추가 관련 함수 
********************************/
	/* 점수형 - 문항완료 미리보기 - 추가 */
	function addPreviewScore(){
		$('.question-item .answer-wrap:last').addClass('rank');//점수문항 css변경용 rank클래스 추가
		
		var score = checkScore();

		/* 점수 선택지 미리보기 추가 */
		var scoreContent =new Array();
		for(var i = 1; i <= score; i++){
			scoreContent.push({"seq":seq, "subSeq":i});
			/* 선택지 변수에 추가 */
			selectContents.push({"subSeq": i, "content" : i});
		}
		
		$('#score-preview').tmpl(scoreContent).appendTo(".question-item:last .answer-wrap");
		
		
		/* 결과 변수에 저장 */
		oneQuestion = {"seq":seq,"title":title,"necessary":necessary,"type":"score","pluralMaximum":0,"score":score, "selectContents":selectContents};
		
		console.log(oneQuestion);
		questions.push(oneQuestion);
		console.log(questions);
	}

	/* 점수형 - 점수선택 - 확인 */
	function checkScore(){
		return $('.question-form select[name=question-sub-type] option:selected').val();
	}

	
/*******************************
	선택형 문항 추가 관련 함수 
********************************/

	/* 문항 추가 폼 -선택형- 보기 존재 확인 */
	function confirmAddQuestionFromSelectExist(){
		if(selectionExist() || etcSelectionExist()){
			return true
		} else {
			return false
		}
	}

	/* 문항 완료 미리보기 - 선택형 - 추가 */
	function addPreviewSelectOptionable() {
		/* 일반 보기 존재 확인 */
		if(selectionExist()) {
			checkType = extractCheckType();
			selectContents = extractContent(seq, checkType);
			//선택형 보기(기타 제외) 출력
			$('#optionable-preview-content').tmpl(selectContents).appendTo(".question-item:last .answer-wrap");
		}
		/* 기타 보기 존재 확인 */
		if(etcSelectionExist()) {
			checkType = extractEtcCheckType();
			selectContents.push(extractEtcContent(seq, checkType));
			//선택형 보기(기타) 출력
			$('#optionable-preview-etc-content').tmpl(etcContent).appendTo(".question-item:last .answer-wrap");
		}
		/* 하나만/복수선택 확인 */
		if(checkType == 'checkbox'){
			pluralMaximum = extractMaximum();
		}
		
		/* 결과 변수에 저장 */
		oneQuestion = {"seq":seq,"title":title,"necessary":necessary,"type":"select","pluralMaximum":pluralMaximum,"checkLowerType":textLowerType(), "selectContents":selectContents };
		
		console.log(oneQuestion);
		questions.push(oneQuestion);
		console.log(questions);
	}
	
	/* 선택형에서 하나만, 복수형 선택시 radio <---> checkbox button 변경 */
	function buttonChange() {
		switch($("select[name=question-sub-type]").val()){
			case "single" :	$(".plural-only").css("display", "none");
							$(".question-form ul.answer-wrap li span input:checkbox").prop('type','radio');
							break;
			case "plural" :	$(".plural-only").css("display", "table-row");
							$(".question-form ul.answer-wrap li span input:radio").prop('type','checkbox');
							break;
		}
	}
	

	/* 일반 보기 radio-checkbox (하나만/복수형)선택 변수화 */
	function extractCheckType(){
		return $('.question-form .question-option-item .txt-wrap input:first').prop("type");
	}
	/* 기타 보기 radio-checkbox (하나만/복수형)선택 변수화 */
	function extractEtcCheckType(){
		return $('.question-form .question-option-item-etc .txt-wrap input:first').prop("type");
	}
	/* 복수형 선택시 최대갯수 리턴 */
	function extractMaximum(){
		return $('.question-form .plural-only option:selected').val();
	}
	
	/* 선택 보기 내용 변수화(기타 제외) */
	function extractContent(seq, checkType){
		var contents = new Array();
		subSeq = 1;
		$(".question-form").find(".question-option-item input[name=option-2]").each(function(index,item) {
			var content ={"seq":seq, "checkType":checkType, "subSeq": subSeq, "content":$(item).val()};
			subSeq+=1;
			
			/* 전체 결과에 입력*/
			/* questions.push(selectContent); */
			
			/* 미리보기 입력용 입력 */
			contents.push(content);
			
		});
		return contents;
	}
	/* 선택 보기 내용 변수화(기타) */
	function extractEtcContent(seq, checkType){
		var contents;
		var content = $(".question-form").find(".question-option-item-etc input[name=option-2]").val();
		var contents = {"seq":seq, "checkType":"etc", "content":content};
		
		return contents;
	}



/*********************************  실행 영역  **************************************************************************/
$(document).ready(function(){
	

	/*********************************/
	
	/* 작성완료 클릭시 기능 */
	$('#finish-btn').on('click', function(){
		var base = "${pageContext.request.contextPath}";
		
    	var data = JSON.stringify(questions);
    	
    	console.log(data);
		
		$.ajax({
			type		:	'post'
		   ,traditional	:	true
		   ,url			: 	base+"/pollAjax/writeComplete"
		   ,data		:	data
		   ,dataType	: 	'text'
       	   ,contentType	:	"application/json; charset=utf-8;"
		   ,error		: 	function(request,status,error){
       					  	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
		   ,success		: 	console.log("data send success")
		})
		
		location.href = "${pageContext.request.contextPath}/poll/my";
		
	})
});
</script>
</body>




</html>