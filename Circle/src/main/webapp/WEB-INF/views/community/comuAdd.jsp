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
				<h5 class="n" id="nti">동호회 글 작성</h5>
				<br>
				   <form action="${ applicationScope.contextPath }/comunity/add" method="post" >
            <table id="all">
               <tr>
                  <td class="n">동호회</td>
                 
                  <td>
                     <select name="comu" id="comu">
                     	<option value="0">동호회 이름을 선택하세요</option>
                     <c:forEach var="b" items="${comu}">
                     
                        <option value="${ comu.COMU_LIST_CODE }"><c:out value="${ comu.COMU_LIST_NAME }"/></option>
                 
                        </c:forEach>
                     </select>
                  </td>
                  
               </tr>
             
               <tr>
                  <td class="n">제목 </td>
                  <td colspan="3"><input type="text" size="60" name="title" id="title"></td>
               </tr>
             
               <tr>
                  <td align="center" class="n">내용 </td>
                  <td colspan="3">
                     <textarea name="content" cols="100" rows="20" style="resize:none;" class="text"></textarea>
                  </td>
               </tr>
            </table>
            <br>
            <div id="submit" >
               <button type="reset" class="btn">취소하기</button>
               <button type="submit" class="btn">등록하기</button>
            </div>
            
         </form>
	
				</div>		
			</div>
		</div>
	</div>
</body>
</html>