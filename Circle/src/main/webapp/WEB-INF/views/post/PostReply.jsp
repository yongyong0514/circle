<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
<table>
<c:forEach var="postReply" items="${postReply}">

<tr>
<td>
${postReply.emp_info_name }(<fmt:formatDate value="${postReply.post_repl_wdat}" pattern="yyyy-MM-dd HH:mm"/>)
</td>
</tr>

</c:forEach>

</table>

</div>

<script>
var post_code = '${postReply.post_repl_post}'; //게시글 번호

$('[name=btnReply]').click(function() { //댓글 등록 버튼 클릭
	
	var insertData = $('[name=btnReply]').serialize(); //내용을 가져옴
	commentInsert(insertData); //함수 호출
});

//댓글목록
function replyList() {
	$.ajax({
		url : '/reply/replyList',
		type : 'get',
		data : {'post_code', post_code},
		success :function(data){
			
			var a = '';
			$.each(data, function(key, value){
				a += '<div class="commnetArea">';
				a += '<div class="commnetInfo + value.post_repl_code"'+'댓글번호 : ' + value.post_code' / 작성자 : ' + value.emp_info_name'>';
				a += '<a onclick="commentUpdate('+value.post_repl_code+', \''+value.post_repl_comt+'\');"> 수정 </a>';
				a += '<a onclick="commentDelete('+value.post_repl_code');"> 삭제 </a> <div>';
				a += '<div class="commentContent' + value.post_repl_code+'"> <p>내용 : ' + value.post_repl_comt + '</p>';
				a += '</div></div>'
			});
		
			$(".commentList").html(a);
			
		}
		
		
	}
			
	);
}

//댓글 등록
function replyInsert(insertData){
	
	$.ajax({
		url : '/reply/replyInsert',
		type : 'post',
		data : insertData,
		success : function(data){
			
			if(data == 1){
				replyList();
				$('[name=post_repl_comt]').val('');
			}
		}
	});
	
}


//댓글 수정 
function replyUpdate(post_code){
	
	var updateReply = $('[name=post_repl_cont_+' post_repl_code+']').val();

	$.ajax({
		url : '/reply/update',
		type : 'post',
		data : {'post_reply_cont' : updateReply, 'post_repl_code' : post_repl_code},
		success : function(data){
			if(data == 1) postList(post_code); // 수정 후 목록 출력
		}
		
	});
	
}

//댓글 삭제

function replyDelete(post_repl_code){
	
	$.ajax({
		url : '/reply/delete'+post_repl_code,
		type : 'post',
		success: function(data){
			if(data == 1) replyList(post_code);
		}
		
	});
}


$(document).ready(function()){
	replyList(); // 페이지 로딩시 댓글 목록 출력
}

</script>



