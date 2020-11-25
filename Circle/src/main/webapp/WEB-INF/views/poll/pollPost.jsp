<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollPost.css">
<title>설문 참여하기</title>
</head>
<body>
	<div class="poll-post-content-container">
		<header>
			<jsp:include page="pollPostBar.jsp"></jsp:include>
		</header>
		<div class="poll-post-inner-content-container">
			<div class="poll-post-article-container">
				<header class="poll-post-article-header">
					<h1>설문 메인 제목</h1>
					<table>
						<tbody>
							<tr>
								<th>
									<div>
										<span class="span-toggle">
											<span class="toggle-icon">
											</span>
										</span>
										<span class="post-writer-info">작성자 :</span>
									</div>
								</th>
								<td>
									<span class="photo">
										<a class="writer-info" data-userid="200101090031">
											<img alt='김정훈 본부장' title="김정훈 본부장" src="#">								
										</a>
									</span>
									<span class="writer-info txt" data-userid="200101090031">
										김정훈 본부장
									</span>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="sub-info">
						<table class="sub-info-list">
							<tbody>
								<tr>
									<th>
										<span class="sub-info-list-title">작성일 :</span>
									</th>
									<td>
										<span class="sub-info-list-date">2020-11-25(수) 12:34</span>
									</td>
								</tr>
								<tr>
									<th>
										<span class="sub-info-list-title">설문기간 :</span>
									</th>
									<td>
										<span class="sub-info-list-date">2020-11-25 ~ 2020-12-31</span>
									</td>
								</tr>
								<tr>
									<th>
										<span class="sub-info-list-title">참여 후 수정 :</span>
									</th>
									<td>
										<span class="sub-info-list-date">허용</span>
									</td>
								</tr>
								<tr>
									<th>
										<span class="sub-info-list-title">설문결과 :</span>
									</th>
									<td>
										<span class="sub-info-list-date">공개</span>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</header>
				<div class="poll-post-info">
					<div class="poll-post-info-wrap">
						<span class=txt>
							전체 참여자
							<strong>36</strong>
						</span>
						<span class="inline-space"></span>
						<span>
							참여 완료
							<strong>0</strong>
						</span>
						<span class="inline-space"></span>
						<span>
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
											<span class="answer-checkbox">
												<input id="checkbox-code1" type="checkbox">
												<label for="checkbox-code1">선택형</label>
											</span>
										</li>
										<li>
											<span class="answer-checkbox">
												<input id="checkbox-code2" type="checkbox">
												<label for="checkbox-code2">필수답변</label>
											</span>
										</li>
										<li>
											<span class="answer-checkbox">
												<input id="checkbox-code3" type="checkbox">
												<label for="checkbox-code3">복수선택</label>
											</span>
										</li>
										<li>
											<span class="answer-checkbox">
												<input id="checkbox-code4" type="checkbox">
												<label for="checkbox-code4">최대선택개수 제한없음</label>
											</span>
										</li>
										<li class="etc">
											<span class="txt-wrap">
												<input id="checkbox-code5" type="checkbox">
												<label for="checkbox-code5 txt">기타</label>
												<input class="txt" type="text">
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
												<textarea class="text-area-w-max" rows="5">
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
												<input class="text-w-max" type="text">
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
											<span class="radio-wrap">
												<input id="radio-id1">
												<label for="radio-id1">1</label>
											</span>
										</li>
										<li>
											<span class="radio-wrap">
												<input id="radio-id2">
												<label for="radio-id2">2</label>
											</span>
										</li>
										<li>
											<span class="radio-wrap">
												<input id="radio-id3">
												<label for="radio-id3">3</label>
											</span>
										</li>
										<li>
											<span class="radio-wrap">
												<input id="radio-id4">
												<label for="radio-id4">4</label>
											</span>
										</li>
										<li>
											<span class="radio-wrap">
												<input id="radio-id5">
												<label for="radio-id5">5</label>
											</span>
										</li>
										<li>
											<span class="radio-wrap">
												<input id="radio-id6">
												<label for="radio-id6">6</label>
											</span>
										</li>
										<li>
											<span class="radio-wrap">
												<input id="radio-id7">
												<label for="radio-id7">7</label>
											</span>
										</li>
										<li>
											<span class="radio-wrap">
												<input id="radio-id8">
												<label for="radio-id8">8</label>
											</span>
										</li>
										<li>
											<span class="radio-wrap">
												<input id="radio-id9">
												<label for="radio-id9">9</label>
											</span>
										</li>
										<li>
											<span class="radio-wrap">
												<input id="radio-id10">
												<label for="radio-id10">10</label>
											</span>
										</li>
									</ul>						
								</li>

							</ul>
						</div>
						<div class="question-submit-button">
							<a href="#" class="poll-submit-btn">
								<button class="txt">설문 제출</button>
							</a>
							<a href="#" class="poll-temp-save-btn">
								<button class="txt">임시 저장</button>
							</a>
						</div>
					</div>				
				</article>
			</div>
			<div class="poll-reply-container">
				<div class="poll-reply-count-wrap">
					<ul class="reply-count">
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
					<ul class="poll-reply">
						<li>
							<div>
								<span class="photo">
									<a data="id">
										<img src="#" alt="김정훈 본부장" title="김정훈 본부장">
									</a>
								</span>
								<div>
									<div class="reply-msg-wrap"></div>
									<p class="reply-msg-info">
										<span></span>
										<span></span>
										<span></span>
									</p>
								</div>
								<div></div>
							</div>
						</li>
						<li></li>
					</ul>
					<div></div>
				</div>
			</div>
		</div>

	</div>

</body>
</html>