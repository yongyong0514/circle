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
      <div class="table_header ">
        <ul>
          <li>
            <div class="item">
              <div class="name">
                <span>프로젝트</span>
              </div>
              <div class="phone">
                <span>작성자</span>
              </div>
              <div class="issue">
                <span>ISSUE</span>
              </div>
              <div class="status">
                <span>STATUS</span>
              </div>
            </div>
          </li>
        </ul>
      </div>
      <div class="table_body">
        <ul>
          <li>
            <div class="item">
              <div class="name">
                <span>Alex</span>
              </div>
              <div class="phone">
                <span>+1 111 222 333</span>
              </div>
              <div class="issue">
                <span>Lorem ipsum dolor sit amet.</span>
              </div>
              <div class="status">
                <span class="open">Open</span>
              </div>
            </div>
          </li>
          <li>
            <div class="item">
              <div class="name">
                <span>scarlett johansson</span>
              </div>
              <div class="phone">
                <span>+1 341 242 336</span>
              </div>
              <div class="issue">
                <span>Lorem, ipsum dolor.</span>
              </div>
              <div class="status">
                <span class="fixed">Fixed</span>
              </div>
            </div>
          </li>
          <li>
            <div class="item">
              <div class="name">
                <span>Rosey</span>
              </div>
              <div class="phone">
                <span>+1 331 442 436</span>
              </div>
              <div class="issue">
                <span>Lorem ipsum dolor sit amet consectetur.</span>
              </div>
              <div class="status">
                <span class="closed">Closed</span>
              </div>
            </div>
          </li>
          <li>
            <div class="item">
              <div class="name">
                <span>Rosey</span>
              </div>
              <div class="phone">
                <span>+1 331 442 436</span>
              </div>
              <div class="issue">
                <span>Lorem, ipsum.</span>
              </div>
              <div class="status">
                <span class="hold">Hold</span>
              </div>
            </div>
          </li>
          <li>
            <div class="item">
              <div class="name">
                <span>Rosey</span>
              </div>
              <div class="phone">
                <span>+1 331 442 436</span>
              </div>
              <div class="issue">
                <span>Lorem, ipsum dolor sit amet consectetur adipisicing.</span>
              </div>
              <div class="status">
                <span class="reopened">Reopened</span>
              </div>
            </div>
          </li>
          <li>
            <div class="item">
              <div class="name">
                <span>scarlett johansson lorem</span>
              </div>
              <div class="phone">
                <span>+1 331 442 436</span>
              </div>
              <div class="issue">
                <span>Lorem ipsum dolor sit.</span>
              </div>
              <div class="status">
                <span class="canceled">Canceled</span>
              </div>
            </div>
          </li>
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