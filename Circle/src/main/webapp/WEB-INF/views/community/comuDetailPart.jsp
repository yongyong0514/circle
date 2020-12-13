<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	.main{
		
		height:800px;
	
		color:black;
		margin-top:50px;
		margin-left:auto;
		margin-right:auto;
		
	}
	td {
		border:1px solid black;
		font-size: 20px;
		font-weight: bold;
	}
		th {
		border:1px solid black;
		color:black;
	}
	.table-area {
		border:1px solid black;
		width:800px;
		height:350px;
		margin:0 auto;
	}
	 #cont {
		height:285px;
	} 
	.reply-area {
		width:800px;
		color:blakc;
		margin:0 auto;
		 border: 1px solid black;
		
	}
	  button{
	 background:#37B4EA;
	 border: 1px solid black;
	}
	#ulList{
	width: 1400px;
	
	height: 50px;
}
li{
	
	margin-left: 15px;	
	font-size: 15px;
	font-weight: bolder;
	
}	
#addReply{
	margin:0 auto;
}
</style>
<div class="container">
				<div class="main">
				<c:forEach var="comuDetail" items="${comuDetail }">
				<div class="table-area">
			<table align="center" width="800px" height="50px">
				<tr>
					<th align="center" >동호회</th>
					<td><span>${ comuDetail.comu_list_name}</span></td> 
					<th align="center" >제목</th>
					<td colspan="3"><span>${comuDetail.comu_post_title }</span></td>
				</tr>
				<tr>
					<th align="center" >작성자</th>
					<td><span>${ comuDetail.emp_info_name}</span></td>
					<th align="center">조회수</th>
					<td><span>${ comuDetail.comu_post_view }</span></td>
					<th align="center" >작성일</th>
					
					<td><span><fmt:formatDate value="${comuDetail.comu_post_dat}" pattern="yyyy.MM.dd" /></span></td>
				</tr>
				<tr>
					<th colspan="6" align="center" style="font-weight: bold;">내용</th>
				</tr>
				<tr>
					<td colspan="6"><p id="cont"><br>${ comuDetail.comu_post_cont}"</p></td>
				</tr>
			</table>
		</div>
		</c:forEach>
		
		
		<%-- 
		<c:choose>
			<c:when test="${sessionScope.userid == comuDetail.emp_info_name}"> --%>
					<div class="reply-area">
		<ul>
		<li align="right">
			<a href='<c:url value='/community/comuList'/>'>[목록으로 돌아가기]</a>
			</li>
		
		 	<br>
		 	<c:if test="${empNo eq viewEmpNo }">
		 	<c:forEach var="comuDetail" items="${comuDetail}">
			<li align="right"><a class="up" href='<c:url value='/community/comuUpdate?comu_post_ordr=${comuDetail.comu_post_ordr}'/>'>[수정하기]</a>
			
			<a href='<c:url value='/community/comuDelete?comu_post_ordr=${comuDetail.comu_post_ordr}'/>'>[삭제하기]</a></li><br>
			</c:forEach>
			</c:if>
		</ul>
		</div>
		<%-- </c:when>
		</c:choose> --%>
		
		<div class="reply-area">
			<div class="reply-write-area">
				<table align="center">
					<tr>
						<td style="color: black" align="center">댓글 작성</td>
						<td><textarea rows="3" cols="80" id="replyContent"></textarea></td>
						<td><button id="addReply">댓글 등록</button></td>
						<td></td>
					</tr>
				</table>
			</div>
			<div id="replySelectArea">
				<table id="replySelectTable" border="1">
					<tbody></tbody>
				</table>
			</div>
		</div>		
			</div>
		</div>
		<script type="text/javascript"> 
	 $(".up").on('click',function(){
		 var message = '${msg}'; 
		 var returnUrl = '${url}'; 
		 alert(mag); 
		 document.location.href = url; 
	 })
</script>