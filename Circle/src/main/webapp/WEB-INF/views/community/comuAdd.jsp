<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/community/comuAdd.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
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
#comuName{
border: 1px solid black;
	width:200px;
	color:black;
	height:33px;
	background: #0072C6;
	background: -webkit-linear-gradient(to right, #AFDBFF, #F1F9FF, #AFDBFF);
	background: linear-gradient(to right, #AFDBFF, #F1F9FF, #AFDBFF);
	border-radius: 10px;
	font: bolder;
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

					<jsp:include page="../community/comuHomeBar.jsp" />

					
				</div>

				<div class="resultArea1">

					<br>
					<h5 class="n" id="nti">동호회 글 작성</h5>
					<br>	
									<!-- ${pageContext.request.contextPath} 는 localHost 페이지에 절대경로 -->
									<!-- Controller에 처리를 맡긴다 -->
					<form action="${pageContext.request.contextPath}/community/comuAddAction"
						method="post" id="formArea">
						<table id="all">
							<thead>
								<tr>
									<td><br></td>
								</tr>
								
								
							<tr>
								
								<th class="formBox1">작성자</th>
								
								<th class="formBox2"><input type="text" class="formInput1" id="emp_info_name" value="${empInfo.emp_info_name}" readonly>
									<input type="hidden" class="formInput1" id="sign_emp_code" name="sign_emp_code" value="${empInfo.emp_info_emp_no}" readonly> </th>
									<tr>
									<td><br></td>
								</tr>
								<tr>
								<th class="formBox1">직급</th>
								<th class="formBox2"><input type="text" name="job" class="formInput1" id="job_info_name" value="${empInfo.job_info_name}" readonly></th>
							</tr>
								<!-- 주석 -->
								<!-- 주석 -->
								<tr>
									<td><br></td>
								</tr>
								<tr>
									<%-- <c:out value="${list }"/> --%>
									<td><select name="comu_post_list_code" id="comuName">
											<option value="0">동호회 이름을 선택하세요</option>
												 <c:forEach var="comuName" items="${list}">
											<option value="${comuName.comu_list_code}">
											${comuName.comu_list_name}
											</option>

											</c:forEach> 
									</select></td>
				
								</tr>
								
								<tr>
									<td><br></td>
								</tr>
								
							
								<tr>
									<!--  <td class="n">제목 </td> -->
									<td colspan="3"><input type="text" size="115" name="comu_post_title"
										id="title" placeholder="제목" class="title"></td>
								</tr>
								<!--  <tr><td>
									<span class="alert-wrap desc-top-wrap warn-error">
										<span class="desc caution"><span class="alert_wrap wrap_desc_top go_error go_renew"><span class="title">제목은 필수 입력항목 입니다.</span></span></span>
									</span>
									</td></tr>  -->
								<tr>
									<td><br></td>
								</tr>
								<tr>
									<!-- <td align="center" class="n">내용 </td> -->
									<td colspan="3"><textarea name="comu_post_cont" cols="100"
											rows="20" style="resize: none;" id ="text" class="text" placeholder="내용"></textarea>
									</td>
								</tr>
									<tr>
									<td><br></td>
								</tr>
								
								<tr>
									<td><br></td>
								</tr>
								
								<tr>
									<td colspan="2">
										<input type="submit"style="background-color: #F0FBD1; color: black;"
										class="btn btn-default pull-right" onclick="insert1();" value="등록" /> 
										
										<input type="button" style="background-color: #F0FBD1; color: black;"
										class="btn btn-default pull-right"
										onclick="javascript:location.href='comuList'" value="글목록" />
									</td>
								</tr>
							</thead>
						</table>
						<br>
			
					</form>
							
				</div>
			</div>
		</div>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
<script type="text/javascript">

/* $("#formArea").submit(function(e) {
	var base = "${pageContext.request.contextPath}";
	e.preventDefault(); */
	
	/*Check empty field*/
	
	/* if($("#title").val() != '0') {
		
		if($("#text").val() != '0') {
			if(isSubmit) this.submit();
		}else {
						alert('문서 내용을 입력해주세요');
						return false;
					}
				else {
					alert('문서 제목을 입력해주세요');
					$("#title").focus();
					return false;
				}
		} 
}); */
function insert1(){
	alert("글이 등록 되었습니다.");
}
</script>
</html>

