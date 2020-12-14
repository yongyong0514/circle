<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/community/comuList.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
#listArea{

 color:black;
 font-size: 17px;
	font-weight: bolder;
}
#listbar{
 background:#D8D8D8;
 height:25px;
		border:1px solid silver;
		margin: auto;
}
#List{
		height:50px;
		border:1px solid black;
		font-weight: bolder;
		margin:auto;
		 background:#FFFFFF;
	}
</style>


</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/menuTopBar.jsp" />
		<jsp:include page="../common/menuAlertBar.jsp" />
		
		<div class="organChart">
			<c:import url="/organChart/getInfo"/>
		</div>
		
		<div class="container">
			<div class="navLeft">
				<jsp:include page="../community/comuLeftBar.jsp" />
			</div>
			<div class="content">
				<div>
					<jsp:include page="../community/comuHomeBar.jsp"/>
					<jsp:include page="../community/comuHomeListBar.jsp"/>
				</div>
				
				<div class="comuList">
				<br>
				
				 <form action="${pageContext.request.contextPath}/community/comuAppList"
						method="post" enctype="multipart/form-data" name="">
			<table id="listArea" style="text-align: center; border: 1px solid #FFOODD;">
				<tr id="listbar">
					<th width="100px" style="background-color:#eeeeee; text-align: center; color:#black; ">신청자</th>
						<th width="100px" style="background-color:#eeeeee; text-align: center; color:#black; ">동호회</th>
					<th width="100px" style="background-color:#eeeeee; text-align: center; color:#black; ">직급</th>
						<th width="150px" style="background-color:#eeeeee; text-align: center; color:#black; ">각오</th>
					<th width="150px" style="background-color:#eeeeee; text-align: center; color:#black; ">신청일</th>
						<!-- <th width="100px" style="background-color:#eeeeee; text-align: center; color:#black; ">가입 승인</th>
							<th width="100px" style="background-color:#eeeeee; text-align: center; color:#black; ">가입 거절</th> -->
				<!-- width="150px" -->
				</tr>
				<tr>
				
				</tr>
			
				 
				<tbody>
				 <c:forEach var="comuAppList" items="${comuAppList}" varStatus="status" >
					
				
						<tr>		
						<th>
						<input type="hidden" name="comu_post_ordr" value="${ comuAppList.comu_post_ordr}">
						</th>
						<th>
						<input type="hidden" name="comu_info_comu_code" value="${ comuAppList.comu_info_comu_code}">
						</th>
						<th>
						<input type="hidden" name="comu_info_emp_no" value="${ comuAppList.comu_info_emp_no}">
						</th>
						<th>
						<input type="hidden" name="comu_list_code" value="${ comuAppList.comu_list_code}">
						</th>
						</tr>
					
					<tr class="List">
						<td><br>${comuAppList.emp_info_name}</td>
						<td><br>${comuAppList.comu_list_name}</td>
						<td><br>${comuAppList.job_info_name}</td>
						<td><br><a href='<c:url value='/community/appDetail?comu_post_ordr=${comuAppList.comu_post_ordr}'/>'>${comuAppList.comu_post_cont}</a></td>
						<td><br><c:out value="${ comuAppList.comu_post_dat }"/></td>
						
					<%-- 	<td><br><input type="submit"
										style="background-color: #F0FBD1; color: black;"
										class="btn btn-default pull-right" value="가입 승인" name="${status.count} " /></td>
							<td><br><input
										type="button" style="background-color: #F0FBD1; color: black;"
										class="btn btn-default pull-right"
										onclick="javascript:location.href='comuList'" value="가입 거절" />
										<!-- 주주 -->
									</td> --%>
<%-- 						   <th><input type="hidden" name="comu_post_type" value="${comuAppList.comu_post_type}"><th> --%>
				
					</tr>
				
				</c:forEach> 
				</tbody>
				
			</table>
					</form>
		
				</div>		
			</div>
		</div>
	</div>
<script>
	/* $(".List").find('input[type=submit]').on('click', function(){
		 서브밋 막기 
		event.preventDefault();
		
						closest(부모태그 찾기) 
		var x = $(this).closest('form').submit(); 
		
		
		console.log(x);
	}) */
</script>
</body>
</html>