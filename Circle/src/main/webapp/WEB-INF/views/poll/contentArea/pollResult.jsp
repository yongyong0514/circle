<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollResult.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src='${pageContext.request.contextPath}/resources/js/poll/echarts-en.min.js'></script>

<title>설문 결과보기</title>
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
						<h1>이미 참여한 설문 메인 제목</h1>
						<table class="poll-post-info-list">
							<tbody>
								<tr>
									<th>
										<div class="normal-info">
											<span class="span-toggle">
												<span class="toggle-icon">
												</span>
											</span>
											<span class="title">작성자 :</span>
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
											.
											점심 뭐먹지(질문 선택형)
										</span>
										<div class=result-chart-wrap>
											<dl class=result-chart-info>
												<dt>
													<span class="txt">전체 참여자 : </span>
												</dt>
												<dd>
													<span class="number">5</span>
													<span class="txt">명</span>
												</dd>
												<dt>
													<span class="txt">참여율 : </span>
												</dt>
												<dd>
													<span class="number">1</span>
													<span class="txt">명</span>
													<span class="gage-wrap">
														<span class="gage" style="width:20.00%"></span>
													</span>
													<span class="number">20.00%</span>
												</dd>
											</dl>										
											<div id="result-chart" style="width:895px;height:250px;"></div>
										</div>
									</li>
									<li class=question-response>
										<span class="question">
											<span class="seq">2</span>
											"."
											<span class="necessary">[필수]</span>
											"2번 텍스트형 필수 장문"
										</span>	
										<div class=result-chart-wrap>
											<dl class=result-chart-info>
												<dt>
													<span class="txt">전체 참여자 : </span>
												</dt>
												<dd>
													<span class="number">5</span>
													<span class="txt">명</span>
												</dd>
												<dt>
													<span class="txt">참여율 : </span>
												</dt>
												<dd>
													<span class="number">1</span>
													<span class="txt">명</span>
													<span class="gage-wrap">
														<span class="gage" style="width:20.00%"></span>
													</span>
													<span class="number">20.00%</span>
												</dd>
											</dl>										
										</div>					
									</li>
									<li class=question-response>
										<span class="question">
											<span class="seq">3</span>
											"."
											"3번 텍스트형 단문"
										</span>	
										<div class=result-chart-wrap>
											<dl class=result-chart-info>
												<dt>
													<span class="txt">전체 참여자 : </span>
												</dt>
												<dd>
													<span class="number">5</span>
													<span class="txt">명</span>
												</dd>
												<dt>
													<span class="txt">참여율 : </span>
												</dt>
												<dd>
													<span class="number">1</span>
													<span class="txt">명</span>
													<span class="gage-wrap">
														<span class="gage" style="width:20.00%"></span>
													</span>
													<span class="number">20.00%</span>
												</dd>
											</dl>										
										</div>					
									</li>
									<li class=question-response>
										<span class="question">
											<span class="seq">4</span>
											"."
											<span class="necessary">[필수]</span>
											"4번 필수 점수형 10점"
										</span>	
										<div class=result-chart-wrap>
											<dl class=result-chart-info>
												<dt>
													<span class="txt">전체 참여자 : </span>
												</dt>
												<dd>
													<span class="number">5</span>
													<span class="txt">명</span>
												</dd>
												<dt>
													<span class="txt">참여율 : </span>
												</dt>
												<dd>
													<span class="number">1</span>
													<span class="txt">명</span>
												</dd>
												<dt>
													<span class="txt">평균 점수 : </span>
												</dt>
												<dd>
													<span class="average-txt number">1</span>
												</dd>
											</dl>										
										</div>					
									</li>
	
								</ul>
							</div>
							<div class="question-submit-button">
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
										<a data="id">
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
										<a data="id">
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
	
    <script>
        // based on prepared DOM, initialize echarts instance
        var myChart = echarts.init($('#result-chart')[0]);
		
        var data1 = "맥창";
        
        // specify chart configuration item and data
		option = {
		    title: false,
		    tooltip: {
		        trigger: 'item',
		        formatter: '{a} <br/>{b} : {c} ({d}%)'
		    },
		    legend: {
		        type: 'scroll',
		        orient: 'vertical',
		        left: 10,
		        bottom: 10,
		        data: [data1,'솔낭구','뢰벤','순대국','청국장'],
		
		    },
		    series: [
		        {
		            name: '점심 뭐먹지',
		            type: 'pie',
		            left:'10',
		            radius : '55%',
		            center: ['50%', '60%'],
		            label: {
		                position: 'outer',
	                	formatter: '{b}：{c}명  ({d}%)  '
		            },
		            data:[
		                {value:335, name:data1},
		                {value:310, name:'솔낭구'},
		                {value:234, name:'뢰벤'},
		                {value:135, name:'순대국'},
		                {value:1548, name:'청국장'}
		            ],
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 0,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0)'
		                    
		                }
		            }
		        }
		    ]
		};

        // use configuration item and data specified to show chart
        myChart.setOption(option);
    </script>

</body>
</html>