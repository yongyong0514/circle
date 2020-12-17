<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/schedule/bootstrap/bootstrap.css">

<style type="text/css">
.modal {
        text-align: center;
}
 
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}
.modal-header {
    padding: 15px;
    border-bottom: 0;
}
 
.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
        width:400px;
}
.modal-title{
		font-weight:bold;
}
.modal-body{
		height:auto;
}
.modal-confirm-button{
		background-color:#337ab7;
}
</style>

</head>
<body>

<div class="container">
  <!-- Modal -->
  <div class="modal fade" id="alertModal" role="dialog">
    <div class="modal-dialog modal-lg"">
      <div class="modal-content">
      	<div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">Modal Header</h4>
     	 </div>
        <div class="modal-body">
          <p>내용 입력</p>
        </div>
        <div class="modal-footer" style="border:0;">
          <input id="modal-action-divide" style="display:none" value="">
          <button type="button" id="modal-confirm" class="btn btn-default modal-confirm-button" data-dismiss="modal">확인</button>
          <button type="button" id="modal-cancle" class="btn btn-default model-cancle-button" data-dismiss="modal">취소</button>
        </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>