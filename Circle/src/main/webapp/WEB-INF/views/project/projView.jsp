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
	href="${pageContext.request.contextPath}/resources/css/project/projKanban.css">



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style type="txt/css">
.post-detail {
	 width: 800px;
	 padding: 1em;
	 height: 80vh;
	 min-height: 300px;
	 margin: 0 auto;
	 overflow-y: auto;
	 overflow-x: hidden;
}
 .post-detail .post-content {
	 margin-bottom: 2em;
}
 .post-detail .comments .content .text {
	 color: gray;
}
 .post-detail .comments .content .actions {
	 text-align: right;
}
 .post-detail .comments .content .actions .reply {
	 opacity: 0;
	 transition: 0.4s ease-out;
}
 .post-detail .comments .content:hover .reply {
	 opacity: 1;
}
 
</style>
</head>
<body>


	<div class="wrap">
		<jsp:include page="../common/menuTopBar.jsp" />
		<jsp:include page="../common/menuAlertBar.jsp" />

		<div class="navLeft">
			<jsp:include page="../project/projSidebar.jsp" />
		</div>
		<div class="content">
			<div>
				<jsp:include page="../project/projHomebar.jsp" />
			</div>

			<!-- 내용 -->
 <div id="app">
        <div class="post-detail">
          <!--   post content -->
          <div class="post-content">
         <h2 class="ui header">
        <i class="settings icon"></i>
        <div class="content">
          Account Settings
          <div class="sub header">2017-09-22 12:30 by Terror</div>
        </div>
      </h2>
            <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Saepe eligendi inventore ea eius aspernatur aliquam minus praesentium veniam est magni laborum, obcaecati dignissimos perferendis, sequi quidem animi fuga nostrum facere.</div>
          </div>
          <!--  comments -->
          <div class="ui comments">
             <h3 class="ui dividing header">Comments</h3>
             <div class="comment" v-for="item in comments">
              <div class="content ui message">
                <a class="author">{{ item.username }}</a>
                <div class="metadata">
                  <span class="date">{{ item.post_at }}</span>
                </div>
                <div class="text">
                  {{ item.content }}
                </div>
                <div class="actions">
                  <a class="reply">Reply</a>
                </div>
              </div>
      <!--    reply -->
           <div class="comments" v-if="item.reply">
            <div class="comment"  v-for="re in item.reply">
              <div class="content ui message">
                <a class="author">{{ re.username }}</a>
                <div class="metadata">
                  <span class="date">{{ re.post_at }}</span>
                </div>
                <div class="text">
                  {{ re.content }}
                </div>
                <div class="actions">
                  <a class="reply">Reply</a>
                </div>
              </div>
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
      
      
      
      
</div>
		</div>



		<script src="<c:url value="/resources/js/project/projKanban.js" />"></script>
</body>
</html>