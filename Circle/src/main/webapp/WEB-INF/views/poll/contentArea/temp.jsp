<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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
					<input type="\${checkType}" name="question-\${seq}">
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

</body>
</html>