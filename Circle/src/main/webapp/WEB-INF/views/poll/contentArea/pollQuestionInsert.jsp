<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollPost.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollInsert.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollQuestionInsert.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/poll/jquery.tmpl.min.js"></script>

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
			<li class="question-item sort">
				<div class="question-preview">
					<span class="question">
						<span class="seq">1</span>
						. 
						질문&nbsp;입력&nbsp;(필수,&nbsp;
						하나만선택,&nbsp;&nbsp;보기&nbsp;
						두개,&nbsp;기타&nbsp;추가)
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
						<li>
							<span class="option-wrap">
								<input id="radio-question-1001-2" name="question-1001" type="radio">
								<label for="radio-question-1001-2">
									보기2 입력
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
						<span class="icon-toolbar write"></span>
					</a>
					<a class="icon24-btn remove-question-btn" title="삭제">
						<span class="icon-toolbar del"></span>
					</a>
				</div>
			</li>
			<!-- 문항추가 입력 폼 시작 -->
			<li class="question-item question-item-edit" style="display:none;">
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
							<tr class="plural-only" style="display:none;">
								<th>
									<span class="title">최대 선택 개수</span>
								</th>
								<td>
									<select id="maxSelectCase" name="maxSelectCase">
										<option value="0"> 제한없음 </option>
									</select>
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
			<!-- 문항추가 입력 폼 끝 -->
			
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
	<div class="organChart">
		<jsp:include page="../../common/menuOrganChart.jsp"/>
	</div>
</body>
<!-- 보기 추가 옵션 템플릿 -->
<script type="text/html" id="question-option-template">
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

<!-- 기타 추가 옵션 템플릿 -->
<script type="text/html" id="question-etc-option-template">
<li class="question-option-item-etc etc">
	<span class="txt-wrap">
		<input type="radio" name="radio" value="1">
		<input class="txt wfix-max question-option-desc" type="text" name value="기타">
	</span>
	<span class="m-btn-wrap del-question-option-btn">
		<span class="icon-classic icon-del del-etc"></span>
	</span>
</li>
</script>
<script>
	$(document).ready(function(){
		
		/************************
		**					   **
		** 문항 추가 관련 기능 ** 
		**                     **
		************************/
		
			/* 문항 추가 버튼 클릭기능 */
			$("#add-question-btn").on("click", function(){
				$(".question-item-edit").css("display","block");
			});
			
			/* 문항 타입 선택 */
			$("select[name=question-type]").on("change",function(){
				switch($("select[name=question-type]").val()){
				/* 선택형 선택시 */
				case "select" : console.log("select 선택");
								$("select[name=question-sub-type]").html("<option value='single'>하나만 선택</option><option value='plural'>복수 선택</option>");
								$(".question-answer-row").css("display","table-row");
								break;
				
				/* 텍스트형 선택시 */
				case "text" : console.log("text 선택");
								$(".question-answer-row").css("display","none");
								$("select[name=question-sub-type]").html("<option value='text'>단문 입력</option><option value='textarea'>장문 입력</option>");
								break;
				
				/* 점수형 선택시 */
				case "score" : console.log("score 선택");
								$(".question-answer-row").css("display","none");
								$("select[name=question-sub-type]").html("<option value='3'>3 점</option><option value='5'>5 점</option><option value='7'>7 점</option><option value='10'>10 점</option>");
								break;
				}
			});
	
			/*********************************
			** 선택형 문항 내부 기능 ** 
			**********************************/		
			/* 복수선택 select 선택시 */
			$("select[name=question-sub-type]").on("change", function(){
				switch($(this).val()){
					/* 하나만 선택 */
					case "single" : console.log("single 선택");
									$(".plural-only").css("display", "none");
									break;
					case "plural" : console.log("plural 선택");
									$(".plural-only").css("display", "table-row");
									break;
				}
			});
			/* 최대 개수 제한 숫자 자동변경 */
			$(".plural-only").mouseenter(function(){
				$("#maxSelectCase").children("option:not(:first)").remove();
				/* 보기 숫자 카운팅 변수 */
				var count = ($(".question-answer-row .answer-wrap .question-option-item-etc .txt-wrap input.txt").length) + ($(".question-answer-row .answer-wrap .question-option-item").length);
				
				for(var i = 1;  i <= count; i++){
					$("<option value=" + i + ">" + i + "</option>").appendTo("#maxSelectCase");
				}
			});
			
			/* 선택형 보기 입력창 클릭시 기능 */
			$(".add-question-btn").find("input[type='text']").on("click", function(){
				$("#question-option-template").tmpl().prependTo(".question-form ul.answer-wrap");
			});
			/* 선택형 보기 입력창 제거 아이콘 클릭 */
			$(document).on("click", "span.icon-del", function(){
				$(this).closest(".question-option-item").remove();
			});
			/* 기타 추가 클릭 */
			$(".add-etc-question-btn").on("click", function(){
				$(this).css("display","none");
				$("#question-etc-option-template").tmpl().appendTo(".question-form ul.answer-wrap");
			});
			/* 기타 제거 아이콘 클릭*/
			$(document).on("click", "span.del-etc", function(){
				$(this).closest(".question-option-item-etc").remove();
				$(".add-etc-question-btn").css("display","block");
			});
			/*************************/
			
			/*********************************
			** 문항추가 완료/취소 버튼 기능 ** 
			**********************************/
			/* 완료버튼 클릭 */
			$(".poll-action").find("span:contains('완료')").on("click", function(){
				/* 질문 입력창 입력 확인 - 경고메세지 출력*/
				$("input[name=question]").val().length < 2 ? ($("input[name=question]").siblings(".desc-top-wrap").css("display","block"),$("input[name=question]").css({"border-color": "red","color": "red"}).focus()) : ($(".desc-top-wrap").css("display","none"),$("input[name=question]").css({"border-color": "#ddd","color": "#333"}));
				
				/* 보기 입력창 입력 확인 - 경고메세지 출력 */
				$(".question-form").find("input[name=option-2]").each(function(index,item) {
					$(item).val().length < 1 ? ($(item).siblings(".desc-top-wrap").css("display","block"), $(item).css({"border-color": "red","color": "red"})) : ($(item).siblings(".desc-top-wrap").css("display","none"), $(item).css({"border-color": "#ddd","color": "#333"}));
				});
			});
			
			/* 취소버튼 클릭 */
			$(".poll-action").find("span:contains('취소')").on("click", function(){
				$(".question-item-edit").css("display","none");
			});
			/*********************************/
			
			
		/*********************************
		*********************************/
		
	});
	
</script>
</html>