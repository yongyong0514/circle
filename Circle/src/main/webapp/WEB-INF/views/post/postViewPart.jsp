<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.wrapper {
	max-width: 500px;
	width: 100%;
	background: #fff;
	margin: 50px auto;
	box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.125);
	padding: 30px;
}

.wrapper .title {
	font-size: 24px;
	font-weight: 700;
	margin-bottom: 25px;
	color: #34495e;
	text-transform: uppercase;
	text-align: center;
}
.wrapper .head {
	font-size: 18px;
	font-weight: 700;
	margin-bottom: 25px;
	color: #34495e;
	text-transform: uppercase;
	text-align: right;
}
.wrapper .head2 {
	font-size: 12px;
	left: 90%;
	font-weight: 700;
	margin-bottom: 25px;
	color: #34495e;
	text-transform: uppercase;
	text-align: right;
}

.wrapper  .btn1{
position: absolute;
  width: 100px;
   padding: 8px 10px;
  font-size: 15px; 
  border: 0px;
  background:  #0072c6;
  color: #fff;
  cursor: pointer;
  border-radius: 3px;
  outline: none;
  left: 44.7%
}

 
.wrapper.btn1:hover{
  background: #dbe5f1;
}
.wrapper  .btn2{
position: absolute;
  width: 100px;
   padding: 8px 10px;
  font-size: 15px; 
  border: 0px;
  background:  #0072c6;
  color: #fff;
  cursor: pointer;
  border-radius: 3px;
  outline: none;
  left:51.7%
}

.wrapper  .btn2:hover{
  background: #dbe5f1;
}


.wrapper  .btn3{
position: absolute;
  width: 100px;
   padding: 8px 10px;
  font-size: 15px; 
  border: 0px;
  background:  #0072c6;
  color: #fff;
  cursor: pointer;
  border-radius: 3px;
  outline: none;
  left:58%
}

.wrapper.btn3:hover{
  background: #dbe5f1;
}


.wrapper .form .inputfield label {
	width: 200px;
	color: #34495e;
	margin-right: 10px;
	font-size: 14px;
}








.reply {
	max-width: 500px;
	width: 100%;
	background: #fff;
	margin: 50px auto;
	box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.125);
	padding: 30px;
}



.reply .rephead {
	font-size: 12px;
	font-weight: 700;
	margin-bottom: 25px;
	color: #34495e;
	text-transform: uppercase;
	text-align: right;
}


.reply .rephead2 {
	font-size: 15px;
	left: 90%;
	font-weight: 700;
	margin-bottom: 25px;
	color: #34495e;
	text-transform: uppercase;
	text-align: left;
}



.reply  .btnr{
position: absolute;
  width: 80px;
  height:20px;
   padding: 8px 10px;
  font-size: 10px; 
  border: 0px;
  background:  #0072c6;
  color: #fff;
  cursor: pointer;
  border-radius: 3px;
  text-align:center;
  outline: none;
  left:45%
}

.reply.btnr:hover{
  background: #dbe5f1;
}


.reply  .btnr2{
position: absolute;
  width: 80px;
  height:20px;
   padding: 8px 10px;
  font-size: 10px; 
  border: 0px;
  background:  #0072c6;
  color: #fff;
  cursor: pointer;
  border-radius: 3px;
  text-align:center;
  outline: none;
  left:35%
}

.reply.btnr2:hover{
  background: #dbe5f1;
}


.reply  .inputfield {
	margin-bottom: 15px;
	display: flex;
	align-items: center;
}

.reply  .inputfield label {
	width: 200px;
	color: #34495e;
	margin-right: 10px;
	font-size: 14px;
}




.writereply {
	max-width: 500px;
	width: 100%;
	background: #fff;
	margin: 50px auto;
	box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.125);
	padding: 30px;
}

.writereply  .replyInsertBtn{
position: absolute;
  width: 100px;
  height:40px;
   padding: 8px 10px;
  font-size: 10px; 
  border: 0px;
  background:  #0072c6;
  color: #fff;
  cursor: pointer;
  border-radius: 3px;
  text-align:center;
  outline: none;
  left:56%
}

.writereply .replyInsertBtn:hover{
  background: #dbe5f1;
}



.writereply .form  .input
	{
	width: 100%;
	outline: none;
	border: 1px solid #d5dbd9;
	font-size: 15px;
	padding: 8px 10px;
	border-radius: 3px;
	transition: all 0.3s ease;
}

.writereply .post_repl_cont {
	font-size: 24px;
	font-weight: 700;
	margin-bottom: 25px;
	color: #34495e;
	text-transform: uppercase;
	text-align: center;
}


</style>

<!--  본문 -->
<div class="wrapper">
	<c:forEach var="postView" items="${postView}">
		<div class="title">
			${postView.post_title}
			</div>
			<div class="head">
			<div>${postView.dept_info_name}
			${postView.emp_info_name}</div>
			</div>
			<div class="head2">
			작성일 : <fmt:formatDate value="${postView.post_wdat}" pattern="yyyy.MM.dd" />
			조회수 :  [${postView.post_cvp}]</div>
		<div class="comt">${postView.post_comt}</div>
	</c:forEach>


<!-- 버튼 부분 -->

<div class="btn">
<c:if test="${empNo eq viewEmpNo }">
	<c:forEach var="postView" items="${postView}">
				<button  class="btn1" type="button"  onClick="location.href='<c:url value='/post/postUpdate?post_code=${postView.post_code}'/>'">수정하기</button>
				<button  class="btn2" type="button"  onClick="location.href='<c:url value='/post/postDelete?post_code=${postView.post_code}'/>'">삭제하기</button>
	</c:forEach>
	</c:if>
		<button  class="btn3" type="button"  onClick="location.href="${pageContext.request.contextPath}/post/postMain?nowPage=${paging.startPage}&cntPerPage=${paging.cntPerPage}">돌아가기</button>
	</div>

		</div>
		
		
		
		
		
<!--  덧글 -->
<div class="reply">
<!-- 덧글 리스트 -->
<div>
	<div id="reply" class="rebody2">
			<c:forEach var="listReply" items="${listReply}">
					<p class="rephead">
						 ${listReply.emp_info_name}
						 <fmt:formatDate value="${listReply.post_repl_wdat}" pattern="yyyy-MM-dd" />
					</p>
					<p class="rephead2">${listReply.post_repl_cont}</p>
					
					<c:if test="${empNo eq listReply.post_repl_emp }">
					<div>
						<div>
										<button  class="btnr" type="button"  onClick="location.href='<c:url value='/post/postReplyUpdate?post_code=${listReply.post_repl_post}'/>'">수정하기</button>
										<button  class="btnr2" type="button"  onClick="location.value='/post/postReplyDelete?post_code=${listReply.post_repl_post}'/>'">삭제하기</button>
						
						</div>
					</div>
					</c:if>
			</c:forEach>
	</div>
</div>
</div>

<!--  덧글 작성 -->

<div class="writereply">
<div class="form">
<form name="replyForm" 	action="${pageContext.request.contextPath}/post/replyInsertAdd" method="post">
	<input type="hidden" id="post_repl_post" name="post_repl_post" value="${post.post_code}" /> <input type="hidden" id="post_repl_emp" name="post_repl_emp" value="${post.post_emp}" />
	
		<label for="post_repl_cont">댓글</label>
		<input type="text" class="post_repl_cont" id="post_repl_cont" name="post_repl_cont" />
		<input type="submit" class="replyInsertBtn"  value="작성하기" />

</form>
</div>
</div>

