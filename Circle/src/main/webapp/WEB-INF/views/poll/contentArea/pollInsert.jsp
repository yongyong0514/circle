<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollPost.css">
<title>새 설문 작성</title>
</head>
<script>
	$(document).ready(function(){
		//topBar title 변경
		$('.pollHomeTitle').text('설문 작성');
	});

</script>
<body>
	<div class="content-container poll-insert-form">
		<form id="poll-form" name="poll-form">
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
								</div>
							</td>
						</tr>
						<tr>
							<th>
								<span class="title">설문 기간</span>
							</th>
							<td>
								<span class="date-wrap">
									<input id="start-date" class="txt wfix_small datepicker" type="text" name="start-date" value="2020-11-30">
									<span class="icon icon-calendaer"></span>
								</span>
								~
								<span class="date-wrap">
									<input id="end-date" class="txt wfix_small datepicker" type="text" name="end-date" value="2020-12-30">
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
										<input id="radio-dept" type="radio" checked="checked">
										<label for="radio-dept">영업부</label>
									</span>
									(
									<span class="option-wrap">
										<input id="checkbox-dept-child" type="checkbox" value="Y">
										<label for="radio-dept-child">하위부서</label>
									</span>
									)
									<br>
									<span class="option-wrap">
										<input id="radio-my" type="radio">
										<label for="radio-my">직접 선택</label>
									</span>
								</div>
							</td>
						</tr>
						<tr>
							<th>
								<span class="title">참조자</span>
							</th>
							<td>
								<div id="referer-list" class="name-tag-wrap">
									<ul class="name-tag">
										<li class="create add-btn">
											<span class="btn-wrap">
												<span class="form-icon icon-addlist"></span>
												<span class="txt">추가</span>
											</span>
											<a class="remove-all-tag reset-btn">
												<span class="icon remove-all"></span>
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
									<input id="radio-public-y" type="radio" value="Y" checked="checked">
									<label for="radio-public-y">공개</label>
								</span>
								<span class="spacing"></span>
								<span class="option-wrap">
									<input id="radio-public-n" type="radio" value="N">
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
									<input id="radio-reply-y" type="radio" value="Y" checked="checked">
									<label for="radio-reply-y">사용</label>
								</span>
								<span class="spacing"></span>
								<span class="option-wrap">
									<input id="radio-reply-n" type="radio" value="N">
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
									<input id="radio-editable-y" type="radio" value="Y" checked="checked">
									<label for="radio-editable-y">허용</label>
								</span>
								<span class="spacing"></span>
								<span class="option-wrap">
									<input id="radio-editable-n" type="radio" value="N">
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

</body>
</html>