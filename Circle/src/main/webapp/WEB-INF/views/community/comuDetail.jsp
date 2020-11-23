<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/community/comuList.css"> --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<style>
#listArea{
 color:black;
 font-size: 17px;
	font-weight: bolder;
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
					<jsp:include page="../community/comuHomeListBar.jsp"/>
				</div>
				<div class="table-area">
			<table align="center" width="800px">
				<tr>
					<td>분야</td>
					<%-- <td><span><c:out value="${ requestScope.board.qCategory }"/></span></td> --%>
					<td>제목</td>
					<%-- <td colspan="3"><span><c:out value="${ requestScope.board.qTitle }"/></span></td> --%>
				</tr>
				<tr>
					<td>작성자(회원번호)</td>
					<%-- <td><span><c:out value="${ requestScope.board.memberShipNumber }"/></span></td> --%>
					<td>조회수</td>
					<%-- <td><span><c:out value="${ requestScope.board.qPageView }"/></span></td> --%>
					<td>작성일</td>
					<%-- <td><span><c:out value="${ requestScope.board.qWriteDate }"/></span></td> --%>
				</tr>
				<tr>
					<td colspan="6">내용</td>
				</tr>
				<tr>
					<%-- <td colspan="6"><p id="content"><c:out value="${ requestScope.board.qContent }"/></p></td> --%>
				</tr>
			</table>
		</div>
		<div align="center">
			<button onclick="location.href='${applicationScope.contextPath}/comuList'">목록으로 돌아가기</button>
		</div>
		
		<div class="reply-area">
			<div class="reply-write-area">
				<table align="center">
					<tr>
						<td>댓글 작성</td>
						<td><textarea rows="3" cols="80" id="replyContent"></textarea></td>
						<td><button id="addReply">댓글 등록</button></td>
					</tr>
				</table>
			</div>
			<div id="replySelectArea">
				<table id="replySelectTable" border="1" align="center">
					<tbody></tbody>
				</table>
			</div>
		</div>		
			</div>
		</div>
	</div>

</body>
</html>