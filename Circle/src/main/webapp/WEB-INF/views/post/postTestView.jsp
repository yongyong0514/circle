<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/post/postView.css">



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


</head>
<body>


	<div class="wrap">
		<jsp:include page="../common/menuTopBar.jsp" />
		<jsp:include page="../common/menuAlertBar.jsp" />

		<div class="navLeft">
			<jsp:include page="../post/postSidebar.jsp" />
		</div>
		<div class="content">
			<div>
				<jsp:include page="../post/postHomebar.jsp" />
			</div>

			<!-- 내용 -->
			<div>
				<div class="post_topbar">
					<div class="usy-dt">
						<img src="images/resources/us-pic.png" alt="">
						<div class="usy-name">
							<h3>${postTestView.post_title}</h3>
						</div>
					</div>

				</div>
				<div class="epi-sec">
					<ul class="descp">
					<c:forEach var="postTestView" items="${postTestView}">
						<li><img src="images/clock.png" alt=""><span>${postTestView.post_emp_name}</span></li>
						<li><img src="images/clock.png" alt=""><span>${postTestView.post_wdat }</span></li>
						<li><img src="images/icon9.png" alt=""><span>${postTestView.post_dept_name}</span></li>
						</c:forEach>
					</ul>
					<ul class="bk-links">
						<li><a href="#" title=""><i class="la la-bookmark"></i></a></li>

						<li><a href="#" title="" class="bid_now">수정하기</a></li>
					</ul>
				</div>
				<div class="job_descp">
					<p>${postTestView.post_comt}</p>
				</div>
				<div class="job-status-bar">
					<ul class="like-com">
						<li><img src="images/com.png" alt=""><span>View뷰
								50</span></li>
						<li><img src="images/com.png" alt=""><span>Comment댓글
								15</span></li>

					</ul>
					<div class="comments" v-if="item.reply">
						<div class="comment" v-for="re in item.reply">
						<c:forEach var="postTestView" items="${postTestView}">
							<div class="content ui message">
								<a class="author">${postTestView.post_repl_emp}</a>
								<div class="metadata">
									<span class="date">${postTestView.post_repl_wdat}</span>
								</div>
								<div class="text">${postTestView.post_repl_cont }</div>
								<div class="actions">
									<a class="reply">Reply</a>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>

				<form class="ui reply form">
					<div class="field">
						<textarea></textarea>
					</div>
					<div class="ui blue labeled submit icon button">
						<i class="icon edit"></i> Add Reply
					</div>
				</form>
			</div>
		</div>
	</div>

   <script>
            let comments = [{
    id: 1,
    username: 'Matt',
    userid: '1',
    content: 'How artistic! ',
    post_at: '2017-09-21 16:17',
    parent_id: 0,
    reply:"",
  },{
    id: 2,
    username: 'Elliot Fu',
    userid: '2',
    content: 'This has been very useful for my research. Thanks as well! ',
    post_at: '2017-09-22 26:17',
    parent_id: 0,
     reply:[{
        id: 3,
        username: 'Jenny Hess',
        userid: '3',
        content: 'Elliot you are always so right :) ',
        post_at: '2017-09-22 26:17',
        parent_id: 2
      }],
  },
  ]
  new Vue({
    el: '#app',
    data: {
      active: false,
      comments: comments,
    }
  })
        </script>
</body>
</html>