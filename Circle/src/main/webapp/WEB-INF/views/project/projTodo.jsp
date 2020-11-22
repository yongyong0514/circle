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
	href="${pageContext.request.contextPath}/resources/css/project/projTodo.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

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
	
    <div class="container">
     <div>
     <input type="text" class="txtb" placeholder="Add a task">
     </div> 
      <div class="notcomp">
        <h3>Not Completed</h3>
     <c:forEach   var="projTodo" items="${projTodo}">
<c:if test="${projTodo.prog_code != 'PROG000003'}"/>
        
       <div> ${projTodo.iss_title}</div>
</c:forEach>
      </div>
      <div class="comp">
        <h3>Completed</h3>
<c:forEach   var="projTodo" items="${projTodo}">
        <c:if test="${projTodo.prog_code == 'PROG000003'}"/>
        <div>
        ${projTodo.iss_title}
        </div>
      </c:forEach>
      </div>
    </div>
</div>
</div>

    <script type="text/javascript">
      $(".txtb").on("keyup",function(e){
        //13  means enter button
        if(e.keyCode == 13 && $(".txtb").val() != "")
        {
          var task = $("<div class='task'></div>").text($(".txtb").val());
          var del = $("<i class='fas fa-trash-alt'></i>").click(function(){
            var p = $(this).parent();
            p.fadeOut(function(){
              p.remove();
            });
          });

          var check = $("<i class='fas fa-check'></i>").click(function(){
            var p = $(this).parent();
            p.fadeOut(function(){
              $(".comp").append(p);
              p.fadeIn();
            });
            $(this).remove();
          });

          task.append(del,check);
          $(".notcomp").append(task);
            //to clear the input
          $(".txtb").val("");
        }
      });
    </script>

</body>
</html>