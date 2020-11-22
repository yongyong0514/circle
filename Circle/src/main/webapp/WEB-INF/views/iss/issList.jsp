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
	href="${pageContext.request.contextPath}/resources/css/iss/issList.css">
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>



</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/menuTopBar.jsp" />
		<jsp:include page="../common/menuAlertBar.jsp" />
		<div class="container">
			<div class="navLeft">
				<jsp:include page="../iss/issSidebar.jsp" />
			</div>
			<div class="content">
		
				<div>
					<jsp:include page="../iss/issHomebar.jsp" />
				</div>
				<!-- 내용 -->

<div class="wrapper">
      
    <div class="table_wrap table-sortable">
      <div class="search_box">
        <input type="text" id="search_input" placeholder="Fliter Table Using Names">
      </div>
      <div class="table_header">
        <ul>
          <li>
            <div class="item">
              <div class="name">
                <span>프로젝트</span>
              </div>
              <div class="phone">
                <span>작성일</span>
              </div>
              <div class="issue">
                <span>ISSUE</span>
              </div>
              <div class="status">
                <span>SITU</span>
              </div>
            </div>
          </li>
        </ul>
      </div>
      <div class="table_body">
        <ul>
      <c:forEach  var="issList" items="${issList}">
          <li>
            <div class="item">
              <div class="name">
                <span>${issList.pro_title}</span>
              </div>
              <div class="wdat">
                <span>${issList.iss_wdat}</span>
              </div>
              <div class="issue">
                <span>${issList.iss_title}</span>
              </div>
              <div class="status" id="situ">
                <span class="situration" id="situ">${issList.situ_title}</span>
              </div>
            </div>
          </li>
              </c:forEach>
          </ul>
    
      </div>
      <div class="table_footer"></div>
    </div>
  
  </div>
</div>

		</div>
	</div>
	
	<script src="<c:url value="/resources/js/iss/issList.js" />"></script>


</body>
</html>