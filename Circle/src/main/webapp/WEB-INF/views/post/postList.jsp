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
	href="${pageContext.request.contextPath}/resources/css/post/postList.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/menuTopBar.jsp" />
		<jsp:include page="../common/menuAlertBar.jsp" />
		<div class="container">
			<div class="navLeft">
				<jsp:include page="../post/postSidebar.jsp" />
			</div>
			<div class="content">

				<div>
					<jsp:include page="../post/postHomebar.jsp" />
				</div>
				<!-- 내용 -->



				<div class="filter"></div>

				<table class="post">

					<tr>
						<th>글번호</th>
						<th>분류</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
<c:forEach   var="postList" items="${postList}">
					<tr>
						<td>${postList.post_code}</td>
						<td>${postList.post_type_title}</td>
						<td>${postList.post_title}</td>
						<td>${postList.emp_info_name}</td>
						<td>${postList.post_wdat}</td>
						<td>${postList.post_cvp}</td>
					</tr>
			</c:forEach>
				
				</table>
			 <div class="row">
    <div id="paging" class="paging-view">
      <ul class="pagination">
        <li id="page" class="active"><a href="#">1</a></li>
        <li id="page"><a href="">2</a></li>
        <li id="page"><a href="">3</a></li>
        <li id="page"><a href="">4</a></li>
        <li id="page"><a href="">5</a></li>
      </ul>
    </div>
  </div>
				</div>
				</div>
				</div>


<script>
$(function(){
	  $('tbody tr[href]').click(
	    function(){
	      console.log($(this).attr('href'));
	      //window.location = $(this).attr('href');
	    }
	  ).find('a').hover(
	    function(){
	      $(this).parents('tr').unbind('click');
	    },
	    function(){
	      $(this).parents('tr').click(
	        function(){
	          console.log($(this).attr('href'));
	          //window.location = $(this).attr('href');
	        }
	      );
	    }
	  );

	});
</script>
</body>
</html>