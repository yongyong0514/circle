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
									<select id="maxSelectCase" name="maxSelectCase"></select>
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
			<li class="action">
				<div id="add-question-btn" class="add-poll-btn">
					<span class="icon"></span>
					<span class="txt">문항 추가</span>
				</div>
			</li>
		</ul>
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
	</div>
	<div class="organChart">
		<jsp:include page="../../common/menuOrganChart.jsp"/>
	</div>

</body>
<script>
	$(document).ready(function(){
		
	});
</script>
</html>