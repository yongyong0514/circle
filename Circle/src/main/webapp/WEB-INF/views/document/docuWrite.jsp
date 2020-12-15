<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/document/docuWrite.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sign/signWrite.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css">
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css">
</head>
<body>
<div class="wrap">
		<div class="header">
			<jsp:include page="../common/menuTopBar.jsp" />
			<jsp:include page="../common/menuAlertBar.jsp" />
		</div>
		<div class="leftBar">
			<jsp:include page="docuLeftBar.jsp" />
		</div>
		<div class="container">
			<form id="formArea" method="post" enctype="multipart/form-data">
			<div class="contentBar">
				<div class="homeBar">
					<ul>
						<li class="homeTitle">새 문서 등록</li>
					</ul>
				</div>
				<div class="homeListBar">
<%-- 				<c:if>
					<button class="listBtn" type="submit">저장하기</button>
				</c:if>
				<c:if test="${docu }">	
					<button class="listBtn" type="submit">수정하기</button>
				</c:if> --%>
				</div>	
			</div>
			<div class="content">
				<div class="formBox">
						<table>
							<tr>
								<th class="formBox1">작성자</th>
								<th class="formBox2"><input type="text" class="formInput1" id="emp_info_name" value="${empInfo.emp_info_name}" readonly>
									<input type="text" class="formInput1" id="docu_emp_code" name="docu_emp_code" value="${empInfo.emp_info_emp_no}" readonly> 
								<th class="formBox1">직급</th>
								<th class="formBox2"><input type="text" class="formInput1" id="job_info_name" value="${empInfo.job_info_name}" readonly></th>
							</tr>
							<tr>
								<th class="formBox1">보존 연한</th>
								<th class="formBox2">
									<select class="formSelect1" id="docu_keep" name="docu_keep">
											<option value="0">보존 연한을 선택하세요</option>
											<option value="365" <c:if test="${docuSelectOne.docu_year eq '365'}">selected</c:if>>1 년</option>
											<option value="1095" <c:if test="${docuSelectOne.docu_year eq '1095'}">selected</c:if>>3 년</option>
											<option value="1825" <c:if test="${docuSelectOne.docu_year eq '1825'}">selected</c:if>>5 년</option>
											<option value="3650" <c:if test="${docuSelectOne.docu_year eq '3650'}">selected</c:if>>10 년</option>
											<option value="9999" <c:if test="${docuSelectOne.docu_year eq '9999'}">selected</c:if>>영구</option>
									</select>
								</th>
								<th class="formBox1">문서 유형</th>
								<th class="formBox2">
									<select class="formSelect1" id="docu_acc" name="docu_acc">
											<option value="0">문서 유형을 선택하세요</option>
											<option value="1" <c:if test="${docuSelectOne.docu_type eq '1'}">selected</c:if>>개인</option>
											<option value="2" <c:if test="${docuSelectOne.docu_type eq '2'}">selected</c:if>>공용</option>
									</select>
								</th>
							</tr>
							<tr>
								<th class="formBox1">제목</th>
								<th class="formBox4" colspan="3"><input type="text" class="formInput2" id="docu_title" name="docu_title" value="${docuSelectOne.docu_title}"></th>
							</tr>
							<tr>
								<th class="formBox0"></th>
							</tr>
							<tr>
								<th class="formBox8">첨부 파일</th>
								<th class="formBox7" colspan="3">
									<div id="fileUpload" class="dragAndDropDiv">파일을 여기에 드래그해서 추가하세요</div>
									<input type="file" name="fileUpload" id="fileUpload" style="display:none;" multiple/>
									<c:forEach var="file" items="${list1}">
										<div class='statusbar'>
											<div class='filename' onclick="location.href='${pageContext.request.contextPath}/docuRest/docuFileDownload?fileCode=${file.files_code}'">${file.files_oname}</div>
											<div class='filesize'>${file.files_size}</div>
											<div class='filecode' style='display: none;'></div>
										</div>
									</c:forEach>
								</th>
							</tr>
							<tr>
								<th class="formBox0"></th>
							</tr>
						</table>
						<div class="formBox5" id="editor"></div>
						<textarea id="docu_note" name="docu_note">${docuSelectOne.docu_note}</textarea>
					</div>
				</div>
			</form>
		</div>
	</div>
<!-- SCRIPT 영역 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
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
    
 <!-- TUI EDITOR -->
	<script>
		var editor = new toastui.Editor({
			el : document.querySelector("#editor"),
			height : "630px",
			initialEditType : "wysiwyg",
		});
	</script>

<!-- 수정 폼 로드 시 가져올 일부 본문 값 -->
	<script>
		$(document).ready(function(){
			var note = $('#docu_note').val();
			editor.setHtml(note);
		});
	</script>

<!-- 첨부파일 시작 -->
        <script>
            $(function(){
                var objDragAndDrop = $(".dragAndDropDiv");
                
                $(document).on("dragenter",".dragAndDropDiv",function(e){
                    e.stopPropagation();
                    e.preventDefault();
                    $(this).css('border', '2px solid #0B85A1');
                });
                $(document).on("dragover",".dragAndDropDiv",function(e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                $(document).on("drop",".dragAndDropDiv",function(e){
                    
                    $(this).css('border', '2px dotted #0B85A1');
                    e.preventDefault();
                    var files = e.originalEvent.dataTransfer.files;
                    
                    console.log(files);
                
                    handleFileUpload(files,objDragAndDrop);
                });
                
                $(document).on('dragenter', function (e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                $(document).on('dragover', function (e){
                  e.stopPropagation();
                  e.preventDefault();
                  objDragAndDrop.css('border', '2px dotted #0B85A1');
                });
                $(document).on('drop', function (e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                /* //drag 영역 클릭시 파일 선택창
                objDragAndDrop.on('click',function (e){
                    $('input[type=file]').trigger('click');
                }); */
 
                $('input[type=file]').on('change', function(e) {
                    var files = e.originalEvent.targezst.files;
                    
                    handleFileUpload(files,objDragAndDrop);
                });
                
                function handleFileUpload(files,obj)
                {
                   for (var i = 0; i < files.length; i++) 
                   {
                        var fd = new FormData();
                        fd.append('file', files[i]);
                 
                        var status = new createStatusbar(obj); //Using this we can set progress.
                        status.setFileNameSize(files[i].name,files[i].size);
                        sendFileToServer(fd,status);
                   }
                }
                
                var rowCount=0;
                function createStatusbar(obj){
                        
                    rowCount++;
                    var row="odd";
                    if(rowCount %2 ==0) row ="even";
                    this.statusbar = $("<div class='statusbar "+row+"'></div>");
                    this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
                    this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
                    this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
                    this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);
                    
                    obj.after(this.statusbar);
                 
                    this.setFileNameSize = function(name,size){
                        var sizeStr="";
                        var sizeKB = size/1024;
                        if(parseInt(sizeKB) > 1024){
                            var sizeMB = sizeKB/1024;
                            sizeStr = sizeMB.toFixed(2)+" MB";
                        }else{
                            sizeStr = sizeKB.toFixed(2)+" KB";
                        }
                 
                        this.filename.html(name);
                        this.size.html(sizeStr);
                    }
                    
                    this.setProgress = function(progress){       
                        var progressBarWidth =progress*this.progressBar.width()/ 100;  
                        this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
                        if(parseInt(progress) >= 100)
                        {
                            this.abort.hide();
                        }
                    }
                    
                    this.setAbort = function(jqxhr){
                        var sb = this.statusbar;
                        this.abort.click(function()
                        {
                            jqxhr.abort();
                            sb.hide();
                        });
                    }
                }
                
                function sendFileToServer(formData,status)
                {
        			var base = "${pageContext.request.contextPath}";
                    var uploadURL = base + "/docu/docuFiles";
                    var extraData ={};
                    var jqXHR=$.ajax({
                            xhr: function() {
                            var xhrobj = $.ajaxSettings.xhr();
                            if (xhrobj.upload) {
                                    xhrobj.upload.addEventListener('progress', function(event) {
                                        var percent = 0;
                                        var position = event.loaded || event.position;
                                        var total = event.total;
                                        if (event.lengthComputable) {
                                            percent = Math.ceil(position / total * 100);
                                        }
                                        //Set progress
                                        status.setProgress(percent);
                                    }, false);
                                }
                            return xhrobj;
                        },
                        url: uploadURL,
                        type: "POST",
                        contentType:false,
                        processData: false,
                        cache: false,
                        data: formData,
                        success: function(data){
                            status.setProgress(100);
                 
                            //$("#status1").append("File upload Done<br>");           
                        }
                    }); 
                 
                    status.setAbort(jqXHR);
                }
                
            });
    </script>  

	<!-- FORM 전송 시작 전 체크 -->
	<script>
		$("#formArea").submit(function(e) {
			var base = "${pageContext.request.contextPath}";
			e.preventDefault();

			/*Include field data*/
			var isSubmit = false;
			var editorValue = editor.getHtml();
			$("#docu_note").val(editorValue);
			
			/*Check empty field*/
			if($("#docu_keep").val() != '0') {
				
				if($("#docu_acc").val() != '0') {

						if($("#docu_title").val() != '') {
							
							if(editorValue != "") {
								isSubmit = true;
								
							} else {
								alert('문서 내용을 입력해주세요');
								return false;
							}
							
						} else {
							alert('문서 제목을 입력해주세요');
							$("#docu_title").focus();
							return false;
						}
					
				} else {
					alert('문서 유형을 선택해주세요');
					$("#docu_acc").focus();
					return false;
				}
				
			} else {
				alert('보존 연한을 선택해주세요');
				$("#docu_keep").focus();
				return false;
			}

 			if(isSubmit) this.submit();
		});
	</script> 
</body>
</html>