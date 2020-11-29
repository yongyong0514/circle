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
#file{
	margin: 0 auto;
	margin-left: 30px;
	margin-right: 30px;
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

					<%-- <jsp:include page="../community/comuHomeListBar.jsp"/> --%>
				</div>

				<div class="resultArea1">

					<br>
					<h5 class="n" id="nti">동호회 글 작성</h5>
					<br>
					<form action="<%-- ${ applicationScope.contextPath }/community/ --%>comuAddAction"
						method="post" enctype="multipart/form-data">
						<table id="all">
							<thead>
								<tr>

									<td><select name="comuName" id="comuName">
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
									<td colspan="3"><input type="text" size="115" name="title"
										id="title" placeholder="제목"></td>
								</tr>
								<tr>
									<td><br></td>
								</tr>
								<tr>
									<!-- <td align="center" class="n">내용 </td> -->
									<td colspan="3"><textarea name="content" cols="100"
											rows="20" style="resize: none;" class="text" placeholder="내용"></textarea>
									</td>
								</tr>
									<tr>
									<td><br></td>
								</tr>
								<!-- 파일 추가 -->
								<tr>
									<td><input type="button"
										 id="add" name="add"
										value="파일추가" class="form-control"> <input
										type="button" 
										onclick="delbtn();" value="파일삭제" class="form-control" id="add">
									</td>
								</tr>
								<!-- class="btn btn-default btn-xs pull-right" -->
								<tr>
									<td><br></td>
								</tr>
								<tr >
									<td id="file"><input type="file" class="form-control" name="file" id="file" ></td>
									<td><br></td>
								</tr>
								
								<tr>
									<td><br></td>
								</tr>
								
								<tr>
									<td colspan="2"><input type="submit"
										style="background-color: #F0FBD1; color: black;"
										class="btn btn-default pull-right" value="등록" /> <input
										type="button" style="background-color: #F0FBD1; color: black;"
										class="btn btn-default pull-right"
										onclick="javascript:location.href='comuList'" value="글목록" />
										<!-- 주주 -->
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
</html>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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

				<div>

					<jsp:include page="../community/comuHomeBar.jsp" />

				</div>
			<div class="content">
				<div class="row">
					<jsp:include page="../community/comuHomeListBar.jsp"/>

				<!-- <div class="resultArea1"> -->

					<!-- <br>
					<h5 class="n" id="nti">동호회 글 작성</h5>
					<br> -->
					<form action="${ applicationScope.contextPath }/comu/add"
						method="post" enctype="multipart/form-data">
						<table class="table table-striped"
							style="border: 2px solid #FFFFFF; text-align: center; background-color: white;">
							<thead>
								<tr>
									<th colspan="2"
										style="background-color: #eeeeee; text-align: center;">동호회</th>
								</tr>
								<tr>
									<td><select name="comu" id="comu">
											<option value="0">동호회 이름을 선택하세요</option>
											<c:forEach var="b" items="${comu}">

												<option value="${ comu.COMU_LIST_CODE }">
												<c:out value="${ comu.COMU_LIST_NAME }" /></option>

											</c:forEach>
									</select></td>

								</tr>

								<tr>
									
									<td colspan="3"><input type="text" name="title"
										class="form-contro1">제목</td>
								</tr>

								<tr>
								
									<td colspan="3"><textarea name="content" cols="100"
											rows="10" class="form-contro1">내용</textarea></td>
								</tr>
								<tr></tr>
								<tr>
									<td>파일<input type="button"
										class="btn btn-default btn-xs pull-right" id="add" name="add"
										value="파일추가" class="form-control"> <input
										type="button" class="btn btn-default btn-xs pull-right"
										onclick="delbtn();" value="파일삭제" class="form-control">
									</td>
								</tr>
								<tr>
									<td><input type="file" class="form-control" name="file" id="file"></td>
								</tr>

								<tr>
									<td colspan="2"><input type="submit"
										style="background-color: #D9418C; color: white;"
										class="btn btn-default pull-right" value="등록" /> <input
										type="button" style="background-color: #D9418C; color: white;"
										class="btn btn-default pull-right"
										onclick="javascript:location.href='comuList'" value="글목록" />
									</td>
								</tr>

							</thead>
						</table>
						<br>
						<div id="submit">
							<button type="reset" class="btn">취소하기</button>
							<button type="submit" class="btn">등록하기</button>
						</div>

					</form>

				</div>
			</div>
			</div>
		</div>
	<!-- </div> -->
</body>
</html> --%>