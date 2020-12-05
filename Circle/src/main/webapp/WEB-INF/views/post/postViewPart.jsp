<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="container">
	<!--  본문 -->
	<div class="main">
		<c:forEach var="postView" items="${postView}">
			<div>
				<h2>${postView.post_title}</h2>
				<h5>${postView.emp_info_name},
					<fmt:formatDate value="${postView.post_wdat}" pattern="yyyy.MM.dd" />
				</h5>
					<div><h5>[${postView.post_cvp}]</h5></div>
			</div>
			<div>${postView.post_comt}</div>
		</c:forEach>
	</div>
	
	
<!-- 버튼 부분 -->
<c:forEach var="postView" items="${postView }">
<div><a href='<c:url value='/post/postUpdate?post_code=${postCheck.post_code}'/>'>수정하기</a></div>
</c:forEach>
<c:forEach var="postView" items="${postView }">
<div><a href='<c:url value='/post/postDelete?post_code=${postView.post_code}'/>'>삭제하기</a></div>
</c:forEach>
<button>돌아가기</button>
</div>

<!--  덧글 -->
<div>
<c:if test="${sessionScope.emp_info_emp_no != null }">
	
	<input type="hidden" name="post_code" value="${postCheck.post_code}">

	<textarea id="post_repl_cont" name="post_repl_cont">
	
	
	</textarea>
	<span>
	<button type="button" id="btnReply" name="btnReply">댓글 작성</button>
	</span>
	</c:if>
	</div>
	<div id="listReply">
	</div>
	<div id="listReply"></div>
		<jsp:include page="../post/PostReply.jsp" />


<!--  댓글 script -->		
<script>

$(#btnReply).click(function(){
			var reply_repl_cont = $("#reply_repl_cont").val.(); //댓글내용
			var post_code = "${postView.post_code}"; //게시물 번호
			var param = {"post_repl_cont" : post_repl_cont, "post_code" : postCode};
			
			$.ajax({
				type: "post",
				url : "${path}/reply/insert",
				data:param,
				success:function(){
					alert("댓글이 등록 완료되었습니다.");
					listReply();//목록출력
				}
				
			});
});




<!-- 댓글 목록 script -->
function.listReply(){
$.ajax({
type: "get",
url: "${path}/reply/list?post_code=${postView.post_code}"
sucess:function(result){
$("#listReply").html(result);
}
});


<!-- 댓글 목록  -->

function listReply(num){
	
	$.ajax({
		type: "post",
		url: = "${path}/reply/list?post_code?{postView.post_code}&curPage",
		success: funtion(result){
			console.log(result);
			$("#listReply").html(result);
		}
	});
	
}
</script>
}