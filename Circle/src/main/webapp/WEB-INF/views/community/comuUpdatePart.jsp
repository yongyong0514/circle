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
				<form name="comuUpdate" id="comuUpdate" action="${pageContext.request.contextPath}/community/comuUpdate"method="POST">
				<%-- <c:forEach var="comuCheck" items="${comuCheck }"> --%>
				<div class="table-area">
			<table align="center" width="800px" height="50px">
				<tr>
					<th align="center" >동호회</th>
					<td><span>${ comuCheck.comu_list_name}</span></td> 
					<th align="center" >제목</th>
					<td colspan="3"><input type="text" name="comu_post_title"
										></td>
				</tr>
				<tr>
					<th align="center" >작성자</th>
					<td><span>${ comuCheck.emp_info_name}</span></td>
					<th align="center">조회수</th>
					<td><span>${ comuCheck.comu_post_view }</span></td>
					<th align="center" >작성일</th>
					<td><span>${ comuCheck.comu_post_dat}</span></td>
				</tr>
				<tr>
					<th colspan="6" align="center" style="font-weight: bold;">내용</th>
				</tr>
				<tr>
					<td colspan="6"><textarea name="comu_post_cont" cols="100" rows="15"></textarea></td>
				</tr>
			</table>
		</div>
		<%-- </c:forEach> --%>
		
		
		<div class="reply-area">
		<ul>
		<li align="right">
			<a href='<c:url value='/community/comuList'/>'>[목록으로 돌아가기]</a>
			</li>
		
		
		 	<li  align="right">
		 	 <div class="inputfield">
			<%-- <label><input type="hidden" name="comu_post_ordr" value="${ comuCheck.comu_post_ordr}"></label>  --%>
			<br>
			<label><input type="submit" value="수정하기" class="btn" id="submit"></label>

			</div> 
			</li>
		</ul>
		</div>
		</form>
		
			</div>
		</div>