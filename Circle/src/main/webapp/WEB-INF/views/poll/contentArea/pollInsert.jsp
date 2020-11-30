<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollPost.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollInsert.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
									<input id="start-date" class="txt wfix_small datepicker" type="date" name="start-date" value="2020-11-30">
									<span class="icon icon-calendaer"></span>
								</span>
								~
								<span class="date-wrap">
									<input id="end-date" class="txt wfix_small datepicker" type="date" name="end-date" value="2020-12-30">
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
										<input id="radio-dept" type="radio" name="joinMember" checked="checked">
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
										<input id="radio-my" type="radio" name="joinMember">
										<label for="radio-my">직접 선택</label>
									</span>
									<div id="organ-view" class="option-name-tag-wrap">
										<ul class="name-tag">
											<li class="create add-btn">
												<span class="btn-wrap">
													<span class="form-icon icon-addlist"></span>
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
								<div id="referer-list" class="name-tag-wrap">
									<ul class="name-tag">
										<li class="create add-btn">
											<span class="btn-wrap">
												<span class="form-icon icon-addlist"></span>
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
									<input id="radio-public-y" type="radio" name="public" value="Y" checked="checked">
									<label for="radio-public-y">공개</label>
								</span>
								<span class="spacing"></span>
								<span class="option-wrap">
									<input id="radio-public-n" type="radio" name="public" value="N">
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
	<div class="organChart">
		<jsp:include page="../../common/menuOrganChart.jsp"/>
	</div>

</body>
<script>
	$(document).ready(function(){
		
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
		$(".icon-addlist").on("click", function() {
			var p = $(this).offset();
			$(".organPanel").css({"position":"absolute","top":p.top,"left":p.left}).show();
		});
		
		//메뉴바 조직도 클릭시 위치 조정
		$(".organChart").click(function(){
			$(".organPanel").css({"position":"fixed","left":"80px","bottom":"2.2rem"});
		});
		
		//다음/취소 버튼 선택기능
		$("#next-btn").on("click", function(){
			location.replace("${pageContext.request.contextPath}/poll/pollMain/insertQuestion");
		})
	});
	
</script>
</html>