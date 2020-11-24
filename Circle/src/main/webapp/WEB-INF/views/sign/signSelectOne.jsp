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
						<li class="signHomeListTitle"><button class="signSelectOneModifyBtn">수정하기</button></li>
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
									<div id="viewer" data-content="${signSelectOne.sign_note}"></div>
								</td>
							</tr>
							<tr>
								<td class="formBox7" colspan="2">
								<button id="formBtn3">결재</button>
									<ul id="signSelect">
										<li><button>승인<br><a class="fontSize1">결재를 승인합니다</a></button>&nbsp;&nbsp;&nbsp;<button>반려<br><a class="fontSize1">결재를 거부합니다</a></button></li>
										<li><img src="${pageContext.request.contextPath}/resources/img/sign/arrow.png" class="arrowImg"></li>
									</ul>
								</td>
							</tr>
<!-- 					결재가 완료되었으면 메세지 변경 및 버튼 비활성화	
						<tr>
							<td class="formBox7" colspan="2"><button class="formBtn3" disabled>결재가 완료되었습니다</button></td>
						</tr> -->
						</table>
						<table class="formResult5">
							<tr>
								<td class="formBox0" colspan="2"></td>
							</tr>
							<tr>
								<td class="formBox2" rowspan="2"><%-- <img src="${pageContext.request.contextPath}/resources/img/sign/chat.png" class="img2"> --%></td>
								<td class="formBox3">
									<input type="text" class="formResult2" value="이름공간" readonly>
									<input type="text" class="formResult2" value="직위" readonly>
								</td>
							</tr>
							<tr>
								<td class="formBox3">
									<input type="text" class="formResult4" value="2020-11-11 10:10" readonly>
								</td>
							</tr>
							<tr>
								<td class="formBox9" colspan="2">
									<input type="text" class="formResult6" value="결재 도장 이미지" readonly>
								</td>
							</tr>
						</table>
						<table>
							<tr>
								<td class="formBox8" colspan="2"><input type="text" class="formInput1">
									<button class="formBtn0">전송</button>
								</td>
							</tr>
<!-- 						<tr>
								<td class="formBox10" colspan="2"><button class="formBtn2">결재</button></td>
							</tr> -->
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
    <script>
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
    </script>
    
    <script>
    	$("#formBtn3").click(function(){
    		$("#signSelect").fadeIn(100);
    	});
    </script>
    
    <script>
    	$("#signSelect").mouseleave(function(){
    		$("#signSelect").fadeOut(100);
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
</body>
</html>