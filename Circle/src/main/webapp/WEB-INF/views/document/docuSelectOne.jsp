<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/document/docuSelectOne.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
</head>
<body>
	<div class="wrap">
	<div class="header">
		<jsp:include page="../common/menuTopBar.jsp" />
		<jsp:include page="../common/menuAlertBar.jsp" />
	</div>
	<div class="leftBar">
		<jsp:include page="../document/docuLeftBar.jsp" />
	</div>
	<div class="container">
		<div class="contentBar">
			<div class="homeBar">
					<ul>
						<li class="homeTitle">문서 내용</li>
					</ul>
				</div>
			<div class="oneListBar">
				<div>
					<div class="title1">
						<c:if test="${docuSelectOne.docu_emp_code == empInfo.emp_info_emp_no}">
							<button class="ModifyBtn" onclick="location='${pageContext.request.contextPath}/docu/docuUpdate?docuCode=<c:out value="${docuSelectOne.docu_code}"/>'">수정하기</button>
						</c:if>
					</div>
					<div>
						<c:if test="${docuSelectOne.docu_emp_code == empInfo.emp_info_emp_no}">	
							<button class="DeleteBtn" value="${docuSelectOne.docu_code}">삭제하기</button>
						</c:if>
					</div>
					<div class="title2">작성일</div>
					<div class="title2">작성자</div>
					<div class="title3">제목</div>
					</div>
				</div>
			</div>
			<div class="OneList">
					<ul>
						<li class="resultBox4">
							<input type="text" class="signDate" value="${docuSelectOne.docu_wdat}" readonly>
							<input type="text" class="signDate" value="${docuSelectOne.docu_whour}" readonly>
						</li>
						<li class="resultBox2">
							<input type="text" class="Writer" value="${docuSelectOne.emp_info_name}" readonly>
							<input type="text" class="Writer" value="${docuSelectOne.job_info_name}" readonly>
						</li>
						<li class="imgBox1">
							<img src="">
						</li>
						<li class="resultBox1">
							<input type="text" class="docuTitle"  value="${docuSelectOne.docu_title}" readonly>
						</li>
					</ul>
				</div>
			<div class="content">
			<!--1개의 건 시작 -->
				<div class="formArea">
					<div class="formBox">
						<table>
							<tr>
								<td class="formBox0" colspan="2"></td>
							</tr>
							<tr>
								<td class="formBox2" rowspan="2"><img src="${pageContext.request.contextPath}/resources/img/test/user.png" class="img2"></td>
								<td class="formBox3">
									<input type="text" class="formResult2" value="${docuSelectOne.emp_info_name}" readonly>
									<input type="text" class="formResult2" value="${docuSelectOne.job_info_name}" readonly>
								</td>
							</tr>
							<tr>
								<td class="formBox3">
									<input type="text" class="formResult4" value="${docuSelectOne.docu_wdat}&nbsp;${docuSelectOne.docu_whour}" readonly>
								</td>
							</tr>
							<tr>
								<td class="formBox4" colspan="2">
									<input type="text" class="formResult3" value="${docuSelectOne.docu_title}" readonly>
								</td>
							</tr>
							<tr>
								<td class="formBox5" colspan="2">
									<div id="viewer">${docuSelectOne.docu_note}</div>
								</td>
							</tr>
							<tr>
								<td class="formFile" colspan="2">
									<div id="fileUpload" class="dragAndDropDiv"></div>
									<c:forEach var="file" items="${list1}">
										<div class='statusbar'>
											<div class='filename' onclick="location.href='${pageContext.request.contextPath}/docuResult/docuFileDownload?fileCode=${file.files_code}'">${file.files_oname}</div>
											<div class='filesize'>${file.files_size}</div>
											<div class='filecode' style='display: none;'></div>
										</div>
									</c:forEach>
								</td>
							</tr>
						</table>
						<table class="reply">
						</table>
						<table><!-- 댓글 전송 버튼 박스 구간 -->
							<tr>
								<td class="formBox8" colspan="2"><textarea class="replyArea"></textarea>
									<div class="formBtn0" id="submitReply">전송</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <!-- 왼쪽바 고정 추가 옵션 시작-->
	<script>
		$(function() {
    		var leftBar = $(".leftBar").offset().top;
    			$(window).scroll(function() {
    		var window = $(this).scrollTop();
    		if(leftBar <= window) {
    			$(".leftBar").addClass("fixed");
    		} else {
    			$(".leftBar").removeClass("fixed");
    			}
    		})
    	});
    </script>

	<!-- 댓글 초기 로드 -->
	<script>
		$(function(){
			docuReply();
			
		});
	</script>
	
	<!-- 댓글 로드 -->
	<script>
		function docuReply(){
			var base = "${pageContext.request.contextPath}";
			var docuCode = document.location.href.split("=");
			
			$.ajax({
				type: "get",
				url: base + "/docuRest/docuReply",
				data: {docuCode: docuCode[1]},
				success: function(data){
					if(data != null) {
						var $reply = $(".reply");
						$reply.html('');
						
						for(var key in data) {
							var $tbody = $("<tbody class='replyBox'>");
							var $tr1 = $("<tr>");
							var $tr2 = $("<tr>");
							var $replyImage = $("<td class='replyImage' rowspan='2'><img src='${pageContext.request.contextPath}/resources/img/test/user.png' class='img3'>");
							var $replyUser = $("<td class='replyUser'>");
							var $empName = $("<input type='text' class='formResult2' readonly>").val(data[key].emp_info_name);
							var $jobName = $("<input type='text' class='formResult2' readonly>").val(data[key].job_info_name);
							var $replyDate = $("<input type='text' class='formResult4' readonly>").val(data[key].docu_repl_date);
							var $deleteReply = $("<button class='deleteReply' readonly>삭제</button>").val(data[key].docu_repl_code);
							var $formReply = $("<td class='formReply'>");
							var $replyNote = $("<textarea class='replyNote' readonly></textarea>").text(data[key].docu_repl_content);

							$replyUser.append($empName);
							$replyUser.append($jobName);
							$replyUser.append($replyDate);
							$replyUser.append($deleteReply);
							
							$tr1.append($replyImage);
							$tr1.append($replyUser);
							
							$formReply.append($replyNote);
							
							$tr2.append($formReply);
							
							$tbody.append($tr1);
							$tbody.append($tr2);
							
							$reply.append($tbody);

						}
					}
				}
			});
		}
	</script>
	
	<!-- 댓글 전송 -->
	<script>
		$("#submitReply").click(function(){
			var base = "${pageContext.request.contextPath}";
			var docuCode = document.location.href.split("=");
			var docuEmpCode = ${empInfo.emp_info_emp_no};
			var docuContent = $(".replyArea").val();

			if(!docuContent == ""){ 
				$.ajax({
					url: base + "/docuRest/docuReplyInsert",
					type: "post",
					data: {docu_repl_docu_code : docuCode[1]
						 , docu_repl_emp_code : docuEmpCode
						 , docu_repl_content : docuContent},
					success: function(){
							docuReply();
							$(".replyArea").val("");
					},
					error: function(){
						alert("error");
					}
				});
			} else {
				alert("댓글을 입력해주세요.");
			}
		});
	</script>
	
	<!-- 댓글 삭제 -->
	<script>
		$(document).on('click', '.deleteReply', function(){
			var base = "${pageContext.request.contextPath}";
 			var replyCode = $(this).val();
 			
 			$.ajax({
				url: base + "/docuRest/docuReplyDelete",
				type: "post",
				data: {replyCode : replyCode},
				success: function(){
						docuReply();
				},
				error: function(){
					alert("error");
				}
			});
		});
	</script>
	<script>
		$(".DeleteBtn").click(function(){
			var base = "${pageContext.request.contextPath}";
			var docuCode = $(this).val();

			$.ajax({
				url: base + "/docu/docuDelete",
				type: "post",
				data: {docuCode : docuCode},
				success: function(){
					location.href = "${pageContext.request.contextPath}/docu/docuList";
				},
				error: function(){
					alert("error");
				}
			});
		});
	</script>
</body>
</html>