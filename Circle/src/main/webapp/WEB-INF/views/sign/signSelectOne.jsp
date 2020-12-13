<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sign/signSelectOne.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/menuTopBar.jsp" />
		<jsp:include page="../common/menuAlertBar.jsp" />
	</div>
		<div class="leftBar">
			<jsp:include page="../sign/signLeftBar.jsp" />
		</div>
		<div class="container">
			<div class="contentBar">
				<jsp:include page="../sign/signSelectOneHomeBar.jsp"/>
				<div class="signHomeListBar">
					<ul>
						<li class="signHomeListTitle">
							<c:if test="${signSelectOne.sign_step != 'SIPC000003'}">
								<c:if test="${signSelectOne.sign_emp_code == empInfo.emp_info_emp_no}" >
									<button class="signSelectOneModifyBtn">수정하기</button>
								</c:if>
							</c:if>
						</li>
						<li><button class="signListBtn3">완료일</button></li>
						<li><button class="signListBtn3">작성일</button></li>
						<li><button class="signListBtn2">참조자</button></li>
						<li><button class="signListBtn2">결재자</button></li>
						<li><button class="signListBtn2">남은결재</button></li>
						<li><button class="signListBtn1">작성자</button></li>
					</ul>
				</div>
			</div>
			<div class="content">
			<!--1개의 건 시작 -->
				<div class="signOneList">
					<ul>
						<li class="resultBox4">
							<input type="text" class="signDate" value="${signSelectOne.sign_edat}" readonly>
							<input type="text" class="signDate" value="${signSelectOne.sign_ehour}" readonly>
						</li>
						<li class="resultBox4">
							<input type="text" class="signDate" value="${signSelectOne.sign_wdat}" readonly>
							<input type="text" class="signDate" value="${signSelectOne.sign_whour}" readonly>
						</li>
						<li class="resultBox3">
							<button class="signSee">
								<img src="${pageContext.request.contextPath}/resources/img/sign/share.png" class="imgSize">
							</button>
						</li>
						<li class="resultBox3">
							<button class="signJoin">
								<img src="${pageContext.request.contextPath}/resources/img/sign/add-contact.png" class="imgSize">
							</button>
						</li>
						<li class="imgBox2">
							<input type="text" class="signCount" value="${signSelectOne.sign_count}" readonly>
						</li>
						<li class="resultBox2">
							<input type="text" class="signWriter" value="${signSelectOne.emp_info_name}" readonly>
							<input type="text" class="signWriter" value="${signSelectOne.job_info_name}" readonly>
						</li>
						<li class="imgBox1">
							<img src="${pageContext.request.contextPath}/resources/img/sign/chat.png" class="img1">
						</li>
						<li class="resultBox1">
							<input type="text" class="signType"  value="${signSelectOne.sign_type_name}" readonly>
							<input type="text" class="signTitle"  value="${signSelectOne.sign_title}" readonly>
						</li>
					</ul>
				</div>
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
									<input type="text" class="formResult2" value="${signSelectOne.emp_info_name}" readonly>
									<input type="text" class="formResult2" value="${signSelectOne.job_info_name}" readonly>
								</td>
							</tr>
							<tr>
								<td class="formBox3">
									<input type="text" class="formResult4" value="${signSelectOne.sign_wdat}&nbsp;${signSelectOne.sign_whour}" readonly>
								</td>
							</tr>
							<tr>
								<td class="formBox4" colspan="2">
									<input type="text" class="formResult3" value="${signSelectOne.sign_title}" readonly>
								</td>
							</tr>
							<tr>
								<td class="formBox5" colspan="2">
									<div id="viewer">${signSelectOne.sign_note}</div>
								</td>
							</tr>
							<tr>
								<td class="formFile" colspan="2">
									<div id="fileUpload" class="dragAndDropDiv"></div>
									<c:forEach var="file" items="${list3}">
										<div class='statusbar'>
											<div class='filename' onclick="location.href='${pageContext.request.contextPath}/signResult/signFileDownload?fileCode=${file.files_code}'">${file.files_oname}</div>
											<div class='filesize'>${file.files_size}</div>
											<div class='filecode' style='display: none;'></div>
										</div>
									</c:forEach>
								</td>
							</tr>
							<tr>
								<td class="formBox7" colspan="2">
									<c:forEach var="join" items="${signListJoiner}">
										<c:if test="${signSelectOne.sign_step != 'SIPC000003'}">
											<c:if test="${join.emp_info_emp_no == empInfo.emp_info_emp_no}">
												<c:if test="${join.sign_join_check == 'N' }">
													<button id="formBtn3">결재</button>
													<ul id="signSelect1">
														<li>
															<button class="submitAgree">승인<br><a class="fontSize1">결재를 승인합니다</a></button>&nbsp;&nbsp;&nbsp;
															<button class="submitDenied">반려<br><a class="fontSize1">결재를 거부합니다</a></button>
														</li>
													</ul>
												</c:if>
											</c:if>
										</c:if>
									</c:forEach>
										<c:if test="${signSelectOne.sign_step == 'SIPC000003'}">
											<button id="formBtn3" disabled>결재가 완료되었습니다</button>
										</c:if>
											<div id="signModalForm">
												<div class="signModalArea">
													<table>
														<tr>
															<th>
																<div class="signModalTitle">${empInfo.emp_info_name}&nbsp;${empInfo.job_info_name}&nbsp;님께서 등록하신 결재 서명입니다(최대 5개까지 등록 가능합니다)</div>
															</th>
															<th>
																<div class="signModalClose">x</div>
															</th>
														</tr>
														<tr>
															<th colspan="2">
																<div class="signModalImgList">
																	<div>&nbsp;</div>
																	<c:forEach var="file" items="${list4}">
																		<div class="case1">
																			<img class="imgSize2" src="${pageContext.request.contextPath}/sign/sfsDownload?fileCode=${file.files_code}">
																		</div>
																	</c:forEach>
																</div>
															</th>
														</tr>
													</table>
												</div>
												<div class="signModalLayer"></div>
											</div>
								</td>
							</tr>
						</table>
						
						<table class="signAndReply1"><!-- 댓글과 서명박스 구현 공간 -->
							<c:forEach var="sign" items="${list5}">
								<tbody class='replyBox1'>
									<tr>
										<td class='replyImage' rowspan='2'><img src='${pageContext.request.contextPath}/resources/img/test/user.png' class='img3'></td>
										<td class='replyUser'>
											<input type="text" class="formResult2" value="${sign.emp_info_name}" readonly>
											<input type="text" class="formResult2" value="${sign.job_info_name}" readonly>
											<input type="text" class="formResult4" value="${sign.sign_reply_date}" readonly>		
										</td>			
									</tr>
									<tr>
										<td class="formReply">
											<div class="replyNote"><img class="imgSize2" src="${pageContext.request.contextPath}/sign/sfsDownload?fileCode=${sign.sign_reply_content}"></div>
										</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
						<table class="signAndReply">
						</table>
						<table><!-- 댓글 전송 버튼 박스 구간 -->
							<tr>
								<td class="formBox8" colspan="2"><textarea class="replyArea"></textarea>
									<div class="formBtn0" id="submitReply">전송</div>
								</td>
							</tr>
						</table>
					</div>
					<div class="formRight">
						<table>
							<tr>
								<th class="formBox6"><button class="formBtn1">결재자</button></th>
							</tr>
						</table>
					<div class="formResult1" id="signListJoiner">
						<table>
							<tbody>
							</tbody>
						</table>
					</div>
						<table>
							<tr>
								<th class="formBox6"><button class="formBtn1">참조자</button></th>
							</tr>
						</table>
					<div class="formResult1" id="signListWatcher">
						<table>		
							<tbody>
							</tbody>					
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
    
    <!-- 로드 시 가져올 일부 본문 값 -->
    <script>
    var txtArea = $(".replyNote");
    	if (txtArea) {
    	    txtArea.each(function(){
            $(this).height(this.scrollHeight);
        });
    }
	</script>
	
	<!-- 결재 댓글 초기 로드 -->
	<script>
		$(function(){
			signReply();
			
		});
	</script>
	
	<!-- 결재 댓글 로드 -->
	<script>
		function signReply(){
			var base = "${pageContext.request.contextPath}";
			var signCode = document.location.href.split("=");
			
			$.ajax({
				type: "get",
				url: base + "/signResult/signReply",
				data: {signCode: signCode[1]},
				success: function(data){
					if(data != null) {
						var $signListReply = $(".signAndReply");
						$signListReply.html('');
						
						for(var key in data) {
							var $tbody = $("<tbody class='replyBox'>");
							var $tr1 = $("<tr>");
							var $tr2 = $("<tr>");
							var $replyImage = $("<td class='replyImage' rowspan='2'><img src='${pageContext.request.contextPath}/resources/img/test/user.png' class='img3'>");
							var $replyUser = $("<td class='replyUser'>");
							var $empName = $("<input type='text' class='formResult2' readonly>").val(data[key].emp_info_name);
							var $jobName = $("<input type='text' class='formResult2' readonly>").val(data[key].job_info_name);
							var $replyDate = $("<input type='text' class='formResult4' readonly>").val(data[key].sign_reply_date);
							var $formReply = $("<td class='formReply'>");
							var $replyNote = $("<textarea class='replyNote' readonly></textarea>").text(data[key].sign_reply_content);

							$replyUser.append($empName);
							$replyUser.append($jobName);
							$replyUser.append($replyDate);
							
							$tr1.append($replyImage);
							$tr1.append($replyUser);
							
							$formReply.append($replyNote);
							
							$tr2.append($formReply);
							
							$tbody.append($tr1);
							$tbody.append($tr2);
							
							$signListReply.append($tbody);

						}
					}
				}
			});
		}
	</script>
	
	<!-- 결재 댓글 전송 -->
	<script>
		$("#submitReply").click(function(){
			var base = "${pageContext.request.contextPath}";
			var signCode = document.location.href.split("=");
			var signEmpCode = ${empInfo.emp_info_emp_no};
			var signContent = $(".replyArea").val();

			if(!signContent == ""){ 
				$.ajax({
					url: base + "/signResult/signReplyInsert",
					type: "post",
					data: {sign_code : signCode[1]
						 , sign_reply_emp_code : signEmpCode
						 , sign_reply_content : signContent},
					success: function(){
							signReply();
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
	
    <script>
		$(".signSelectOneModifyBtn").click(function(){
			var base = "${pageContext.request.contextPath}";
			var code = document.location.href.split("=");
			var signCode = code[1]; 
			location.href = "../sign/signModify?signCode=" + signCode;
		});  
    </script>
    
<!--     <script>
    	$(function(){
    		var content = $("#viewer").data("content"); //data-content의 값을 불러와라
    		$("#viewer").data("content", ""); //data-content의 값을 삭제(불러왔기 때문에)

            var viewer = toastui.Editor.factory({
                el:document.getElementById("viewer"),
                viewer:true,
                height: '700px',
                initialValue: content,
            });
        });
    </script> -->
    
    <script>
    	$("#formBtn3").click(function(){
    		$("#signSelect1").fadeIn(100);
    	});
    </script>
    
    <script>
    	$("#signSelect1").mouseleave(function(){
    		$("#signSelect1").fadeOut(100);
    	});
    </script>
    
	<!-- 결재자 리스트 -->
	<script>
		$(function(){
			var base = "${pageContext.request.contextPath}";
			var signCode = document.location.href.split("=");
			$.ajax({
				url: base + "/signResult/signListJoiner",
				type: "get",
				data: {signCode : signCode[1]},
				success: function(data) {
					if(data != null) {
						var $signListJoiner = $("#signListJoiner tbody");
						$signListJoiner.html('');
						
						for(var key in data) {
							var $tr = $("<tr class='resultBox5'>");
							var $JoinerNameTd = $("<td class='tName'>").text(data[key].emp_info_name);
							var $JoinerClassTd = $("<td class='tClass'>").text(data[key].job_info_name);
							
							$tr.append("<td class='jImg'><img src='${pageContext.request.contextPath}/resources/img/test/user.png' class='resultImg1'></td>");
							$tr.append($JoinerNameTd);
							$tr.append($JoinerClassTd);
							
							$signListJoiner.append($tr);
						}
					}
				}
			});
		});
	</script>
	
	<!-- 참조자 리스트 -->
	<script>
		$(function(){
			var base = "${pageContext.request.contextPath}";
			var signCode = document.location.href.split("=");
			$.ajax({
				url: base + "/signResult/signListWatcher",
				type: "get",
				data: {signCode : signCode[1]},
				success: function(data) {
					if(data != null) {
						var $signListWatcher = $("#signListWatcher tbody");
						$signListWatcher.html('');
						
						for(var key in data) {
							var $tr = $("<tr class='resultBox5'>");
							var $JoinerNameTd = $("<td class='tName'>").text(data[key].emp_info_name);
							var $JoinerClassTd = $("<td class='tClass'>").text(data[key].job_info_name);
							
							$tr.append("<td class='jImg'><img src='${pageContext.request.contextPath}/resources/img/test/user.png' class='resultImg1'></td>");
							$tr.append($JoinerNameTd);
							$tr.append($JoinerClassTd);
							
							$signListWatcher.append($tr);
						}
					}
				}
			});
		});
	</script>
	
	<!-- 결재 진행 -->
	<script>
    	$(".submitAgree").click(function(){
    		$("#signModalForm").attr("style", "display: block");
    	});
    </script>
    
    <script>
		$(".signModalClose").click(function(){
			$("#signModalForm").attr("style", "display: none");
		});
	</script>
	
	<script>
		$(".case1").click(function(){
			var base = "${pageContext.request.contextPath}";
			var uploadURL = base + "/signResult/signProcess";
			var tag1 = $(this).children();
			var tag2 = tag1[0].currentSrc;
			var fileCode = tag2.split("=");
			var signCode = document.location.href.split("=");
			
			$.ajax({
				url: uploadURL,
				type: "POST",
				data: {fileCode: fileCode[1]
					, signCode: signCode[1]},
				success: function(){
					location.reload(true);
				}
			});
		});
	</script>
	
	<script>
		$(".submitDenied").click(function({
			var base = "${pageContext.request.contextPath}";
			var uploadURL = base + "/signResult/signCancel";
			var signCode = document.location.href.split("=");
			
			$.ajax({
				url: uploadURL,
				type: "POST",
				data: {signCode: signCode[1]},
				success: function(){
					location.reload(true);
				}
			});
		});
	</script>
</body>
</html>