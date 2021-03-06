<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/community/comuList.css">

<style>
#listArea{
 color:black;
 font-size: 17px;
	font-weight: bolder;
}
   .outer{
       width:1000px;
   height:400px;
   background:#FADEDE;
   color:black;
   margin-top:50px;
   margin-left:auto;
   margin-right:auto;
   }
   table {
      border:1px solid black;
   }
   .tableArea {
      width:700px;
      height:150px;
    
   }
   	button{
	 background:#37B4EA;
	}
	td{
	 color:black;
	 
	}
	#da{
	margin-top:50px;
	}
	#submit{
	
	   margin-left:500px;
	}
	h1{
		 color:black;
 font-size: 17px;
	font-weight: bolder;
	}
	#title{
	height:100px;
	width:700px;
	}
</style>

</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/menuTopBar.jsp" />
		<jsp:include page="../common/menuAlertBar.jsp" />
		<div class="container">
			<div class="navLeft">
				<jsp:include page="../community/comuLeftBar.jsp" />
			</div>
			<div class="content">
			
			<div>
			
					<jsp:include page="../community/comuHomeBar.jsp"/>
					
					<%-- <jsp:include page="../community/comuHomeListBar.jsp"/> --%>
				</div> 
				
				<div class="resultArea1">
				
				<br>
				<h1>가입 신청서</h1>
				
				   <form action="${ applicationScope.contextPath }/insert.bo" method="post">
            <table>
               <tr>
                  <td>동호회</td>
                 
                  <td>
                     <select name="category">
                     <c:forEach var="b" items="${ requestScope.list }">
                     
                        <option value="10"><c:out value="${ b.qNo }"/></option>
                     
                        </c:forEach>
                     </select>
                  </td>
                  
               </tr>
               <br>
               <tr>
                  <td>가입 신청 사유</td>
                  <td colspan="3"><input type="text" size="60" name="title" id="title"></td>
               </tr>
               <tr>
                  <td align="center" id="da"> 각오 </td>
                  <td colspan="3">
                     <textarea name="content" cols="100" rows="20" style="resize:none;"></textarea>
                  </td>
               </tr>
            </table>
            <br>
            <div id="submit">
               <button type="reset">취소하기</button>
               <button type="submit">신청하기</button>
            </div>
            
         </form>
	
				</div>		
			</div>
		</div>
	</div>
</body>
</html>