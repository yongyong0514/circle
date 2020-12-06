<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollPost.css">

<script src="/circle/resources/js/poll/jquery.min.js"></script>
<script src="/circle/resources/js/poll/jquery.tmpl.min.js"></script>
<title>설문 참여하기</title>
</head>
<body>
	<div class="poll-post-content-container">
		<header>
			<jsp:include page="../contentTopBar/pollPostBar.jsp"></jsp:include>
		</header>
		<div class="poll-post-inner-content-container">
			<section class="poll-post-toolbar">
				<ul class="poll-post-manage">
					<li> 
						<a class="toolbar-btn-wrap">
							<span class="toolbar-icon modify"></span>
							<span class="poll-post-toolbar-modify-btn-txt">수정</span>
						</a>
					</li>
					<li>
						<a class="toolbar-btn-wrap">
							<span class="toolbar-icon play"></span>
							<span class="poll-post-toolbar-progress-btn-txt">진행</span>
						</a>
					</li>
					<li>
						<a class="toolbar-btn-wrap">
							<span class="toolbar-icon del"></span>
							<span class="poll-post-toolbar-delete-btn-txt">삭제</span>
						</a>
					</li>
				</ul>
				<ul class="poll-post-list">
					<li>
						<a class="toolbar-btn-wrap toolbar-list-btn">
							<span class="toolbar-icon list" title="목록"></span>
							<span class="txt">목록</span>
						</a>
					</li>
				</ul>
			</section>
			<div class="poll-post-article-main-container">
				<div class="poll-post-article-wrap">
					<header class="poll-post-article-header">
						<h1><c:out value="미참여 설문 제목 적는 부분"></c:out></h1>
						<table class="poll-post-info-list">
							<tbody>
								<tr>
									<th>
										<div class="normal-info">
											<span class="span-toggle">
												<span class="toggle-icon">
												</span>
											</span>
											<span class="title">작성자 : </span>
										</div>
									</th>
									<td>
										<span class="photo">
											<a class="writer-info" data-userid="200101090031">
												<img alt='사진' title="김정훈 본부장" src="${pageContext.request.contextPath}/resources/img/test/user.png" style="width:20px;height:20px;">								
											</a>
										</span>
										<span class="writer-info txt" data-userid="200101090031">
											김정훈 본부장
										</span>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="sub-info" style="display:block;">
							<table class="poll-post-info-list">
								<tbody>
									<tr>
										<th>
											<span class="title">작성일 :</span>
										</th>
										<td>
											<span class="date">2020-11-25(수) 12:34</span>
										</td>
									</tr>
									<tr>
										<th>
											<span class="title">설문기간 :</span>
										</th>
										<td>
											<span class="date">2020-11-25 ~ 2020-12-31</span>
										</td>
									</tr>
									<tr>
										<th>
											<span class="title">참여 후 수정 :</span>
										</th>
										<td>
											<span class="date">허용</span>
										</td>
									</tr>
									<tr>
										<th>
											<span class="title">설문결과 :</span>
										</th>
										<td>
											<span class="date">공개</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</header>
					<div class="poll-post-join-info">
						<div class="poll-post-join-info-wrap">
							<span class="txt">
								전체 참여자
								<strong>36</strong>
							</span>
							<span class="inline-space"></span>
							<span class="txt">
								참여 완료
								<strong>0</strong>
							</span>
							<span class="inline-space"></span>
							<span class="txt">
								미참여
								<strong>36</strong>
							</span>
						</div>
					</div>
					<article class="poll-post-question-container">
						<div class="question-guide">
							시작 안내 문구
						</div>
						<div id=poll-response-form>
							<div class="question-list-container">
								<ul class="question-list">
									<li class=question-response>
										<span class="question">
											<span class="seq">1</span>
											"."
											<span class="necessary">[필수]</span>
											"1번 질문 선택형"
										</span>
										<ul class="answer-wrap">
											<li>
												<span class="answer-option-wrap">
													<input id="checkbox-code1" type="checkbox">
													<label for="checkbox-code1">선택형</label>
												</span>
											</li>
											<li>
												<span class="answer-option-wrap">
													<input id="checkbox-code2" type="checkbox">
													<label for="checkbox-code2">필수답변</label>
												</span>
											</li>
											<li>
												<span class="answer-option-wrap">
													<input id="checkbox-code3" type="checkbox">
													<label for="checkbox-code3">복수선택</label>
												</span>
											</li>
											<li>
												<span class="answer-option-wrap">
													<input id="checkbox-code4" type="checkbox">
													<label for="checkbox-code4">최대선택개수 제한없음</label>
												</span>
											</li>
											<li class="etc">
												<span class="txt-wrap">
													<input id="checkbox-code5" type="checkbox">
													<label for="checkbox-code5 txt" class="label-wrap">기타</label>
													<input class="txt w-fix-max" type="text">
												</span>
											</li>
										</ul>
									</li>
									<li class=question-response>
										<span class="question">
											<span class="seq">2</span>
											"."
											<span class="necessary">[필수]</span>
											"2번 텍스트형 필수 장문"
										</span>	
										<ul class="answer-wrap">
											<li>
												<div class="text-area-wrap">
													<textarea class="textarea w-max" rows="5">
													</textarea>
												</div>
											</li>
										</ul>						
									</li>
									<li class=question-response>
										<span class="question">
											<span class="seq">3</span>
											"."
											"3번 텍스트형 단문"
										</span>	
										<ul class="answer-wrap">
											<li>
												<div class="text-wrap">
													<input class="text w-max" type="text">
												</div>
											</li>
										</ul>						
									</li>
									<li class=question-response>
										<span class="question">
											<span class="seq">4</span>
											"."
											<span class="necessary">[필수]</span>
											"4번 필수 점수형 10점"
										</span>	
										<ul class="answer-wrap rank">
											<li>
												<span class="answer-option-wrap">
													<input id="radio-id1" type="radio">
													<label for="radio-id1">1</label>
												</span>
											</li>
											<li>
												<span class="answer-option-wrap">
													<input id="radio-id2" type="radio">
													<label for="radio-id2">2</label>
												</span>
											</li>
											<li>
												<span class="answer-option-wrap">
													<input id="radio-id3" type="radio">
													<label for="radio-id3">3</label>
												</span>
											</li>
											<li>
												<span class="answer-option-wrap">
													<input id="radio-id4" type="radio">
													<label for="radio-id4">4</label>
												</span>
											</li>
											<li>
												<span class="answer-option-wrap">
													<input id="radio-id5" type="radio">
													<label for="radio-id5">5</label>
												</span>
											</li>
											<li>
												<span class="answer-option-wrap">
													<input id="radio-id6" type="radio">
													<label for="radio-id6">6</label>
												</span>
											</li>
											<li>
												<span class="answer-option-wrap">
													<input id="radio-id7" type="radio">
													<label for="radio-id7">7</label>
												</span>
											</li>
											<li>
												<span class="answer-option-wrap">
													<input id="radio-id8" type="radio">
													<label for="radio-id8">8</label>
												</span>
											</li>
											<li>
												<span class="answer-option-wrap">
													<input id="radio-id9" type="radio">
													<label for="radio-id9">9</label>
												</span>
											</li>
											<li>
												<span class="answer-option-wrap">
													<input id="radio-id10" type="radio">
													<label for="radio-id10">10</label>
												</span>
											</li>
										</ul>						
									</li>
	
								</ul>
							</div>
							<div class="question-submit-button">
								<a href="#" class="poll-submit-btn main-btn">
									<span class="txt">설문 제출</span>
								</a>
								<a href="#" class="poll-temp-save-btn sub-btn">
									<span class="txt">임시 저장</span>
								</a>
							</div>
						</div>				
					</article>
				</div>
				<div class="poll-reply-container">
					<div class="poll-reply-wrap">
						<ul class="reply-wrap count">
							<li class="reply-count-view">
								<span class="reply-count-icon"></span>
								<span class="reply-count-txt">
									"댓글"
									<span class="reply-count-num">2</span>
								</span>
							</li>					
						</ul>
					</div>
					<div class="poll-reply-wrap">
						<ul class="reply-wrap">
							<li>
								<div>
									<span class="photo">
										<a>
											<img src="${pageContext.request.contextPath}/resources/img/test/user.png" alt="사진" title="김정훈 본부장">
										</a>
									</span>
									<div>
										<div class="reply-msg-wrap">
											<div class="reply-msg-info">
												<span class="name">김정훈 본부장</span>
												<span class="reply-date">방금전</span>
											</div>
											<p>
												<span id="reply-content">댓글내용1</span>
											</p>
										</div>
									</div>
									<div class="reply-update-wrap" style="display:inline-block;">
										<span class="reply-update-btn" id="edit">
											<span class="reply-edit-btn-icon"></span>
										</span>
										<span class="reply-update-btn" id="delete">
											<span class="reply-delete-btn-icon"></span>
										</span>
									</div>
								</div>
							</li>
							<li>
								<div>
									<span class="photo">
										<a>
											<img src="${pageContext.request.contextPath}/resources/img/test/user.png" alt="사진" title="김정훈 본부장">
										</a>
									</span>
									<div>
										<div class="reply-msg-wrap">
											<div class="reply-msg-info">
												<span class="name">김정훈 본부장</span>
												<span class="reply-date">방금전</span>
											</div>
											<p>
												<span id="reply-content">댓글내용2</span>
											</p>
										</div>
									</div>
									<div class="reply-update-wrap" style="display:">
										<span class="reply-update-btn" id="edit">
											<span class="reply-edit-btn-icon"></span>
										</span>
										<span class="reply-update-btn" id="delete">
											<span class="reply-delete-btn-icon"></span>
										</span>
									</div>
								</div>
							</li>
						</ul>
						<div class="reply-input-wrap">
							<span class="photo">
								<img alt="사진" src="${pageContext.request.contextPath}/resources/img/test/user.png" style="width:32px;height:32px;">
							</span>
							<div class="reply-msg-wrap">
								<div class="reply-input-component-wrap">
									<p class="reply-input-form-wrap">
										<span class="reply-input-form-textarea">
											<textarea class="reply-input-textarea w-max" rows="1"></textarea>
										</span>
									</p>
									<span class="reply-insert-btn-wrap sub-btn">
										<span class="txt">댓글 작성</span>
									</span>
								</div>
								<div></div>
								<div></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<section class="poll-post-toolbar">
				<ul class="poll-post-manage">
					<li>
						<a class="toolbar-btn-wrap">
							<span class="toolbar-icon modify"></span>
							<span class="poll-post-toolbar-modify-btn-txt">수정</span>
						</a>
					</li>
					<li>
						<a class="toolbar-btn-wrap progress-change-btn">
							<span class="toolbar-icon play"></span>
							<span class="poll-post-toolbar-progress-btn-txt">진행</span>
						</a>
					</li>
					<li>
						<a class="toolbar-btn-wrap">
							<span class="toolbar-icon del"></span>
							<span class="poll-post-toolbar-delete-btn-txt">삭제</span>
						</a>
					</li>
				</ul>
				<ul class="poll-post-list">
					<li>
						<a class="toolbar-btn-wrap toolbar-list-btn">
							<span class="toolbar-icon list" title="목록"></span>
							<span class="txt">목록</span>
						</a>
					</li>
				</ul>
			</section>
		</div>

	</div>
	


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