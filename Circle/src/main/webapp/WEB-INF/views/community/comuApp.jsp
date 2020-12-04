<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/community/comuAdd.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<style>

.formBox1{
	border: 1px solid black;
	width:30px;
	color:black;
	height:33px;
	background: #0072C6;
	background: -webkit-linear-gradient(to right, #AFDBFF, #F1F9FF, #AFDBFF);
	background: linear-gradient(to right, #AFDBFF, #F1F9FF, #AFDBFF);
	border-radius: 10px;
}	
.formInput1{
	
	border: 1px solid black;
	width:150px;
	color:black;
	height:33px;
	background: #0072C6;
	background: -webkit-linear-gradient(to right, #AFDBFF, #F1F9FF, #AFDBFF);
	background: linear-gradient(to right, #AFDBFF, #F1F9FF, #AFDBFF);
	border-radius: 10px;
	font-size: 15px;
	font-weight: bolder;
	align-content: center;
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
				<h5 class="n" id="nti">가입 신청서 작성</h5>
				<br>
				<form action="${pageContext.request.contextPath}/community/comuApp"
						method="post" >
            <table id="all">
               <tr>
                  <th class="n">동호회</th>
              
                  <th>
                     <input type="text" class="formInput1" id="comu_list_code" value="${list.comu_list_code}" readonly>
                     <input type="text" class="formInput1" id="comu_list_name" name="comu_list_name" value="${list.comu_list_name}" readonly>
                  </th>
                  
               </tr>
             
               <tr>
                  <td class="n">가입 동기 </td>
                  <td colspan="3"><input type="text" size="60" name="title" id="title"></td>
               </tr>
             
               <tr>
                  <td align="center" class="n">각오 </td>
                  <td colspan="3">
                     <textarea name="content" cols="100" rows="20" style="resize:none;" class="text"></textarea>
                  </td>
               </tr>
            </table>
            <br>
            <div id="submit" >
               <button type="reset" class="btn">취소하기</button>
               <button type="submit" class="btn">지원하기</button>
            </div>
            
         </form>
	
				</div>		
			</div>
		</div>
	</div>
</body>
</html>