<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/iss/issInsert.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

</head>
<body>

<!--  common part -->
<form:form CommendName="insert"  name="iss" action="issInsert" method="POST" ModelAttribute="iss">
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
<!-- common end -->
			
   <!-- write start -->
    <div class="wrapper">
        <div class="title">
         신규 업무
        </div>
        <div class="form">
           <div class="inputfield">
              <label>업무 명</label>
              <input path="iss" id="iss_title" type="text" value="">
           </div>  
            <div class="inputfield">
              <label>프로젝트</label>
              <div class="open_select">
                <label path="Iss">
                <select id="pro_code" items="${iss_pro_code}" path="Iss" name="iss_pro_code">
                  <options  items="${iss_pro_code}"/>
                </select>
              </div>
           </div>
           <div class="inputfield">
            <label>업무상황</label>
            <div class="open_select">
              <select id="prog_code" items="${iss_prog_code}" name="iss_prog_code">
                <option value="midle">보통</option>
                <option value="low">낮음</option>
                <option value="very_low">최하</option>
                <option value="high">높음</option>
                <option value="very_high">최상</option>
                <option value="emergency">매우긴급</option>
              </select>
            </div>
         </div>
         <div class="inputfield">
            <label>진행단계</label>
            <div class="open_select">
              <select>
                <option value="todo">할 일</option>
                <option value="doing">하는 중</option>
                <option value="done">완료</option>
              </select>
            </div>
         </div>
           <div class="inputfield">
            <label>업무 시작일</label>
            <input type="date" class="input" id="start" name="project-start"
           min="2020-01-01" max="2100-12-31">
         </div>
           <div class="inputfield">
            <label>업무 종료일</label>
            <input type="date" class="input" id="start" name="project-start"
           min="2020-01-01" max="2100-12-31">
         </div>  
          <div class="inputfield">
              <label>업무 설명</label>
              <textarea class="textarea"></textarea>
           </div> 
           <div class="inputfield">
            <label>추가인원</label>
            <input type="submit" class="input" value="추가하기">
         </div>  
          <div class="inputfield">
            <input type="submit" value="업무 추가" class="btn">
          </div>
        </div>
    </div>
<!--  write form end -->
		</div>

</div>
</form:form>


		<script src="<c:url value="/resources/js/iss/issInsert.js" />"></script>
</body>
</html>