<!-- 전송시작 -->
	<script>
		$("#formArea").submit(function(e) {
			
			e.preventDefault();
			
			var isSubmit = false;
			var editorValue = "";
				editorVAlue = editor.getHtml();
			
			/*empty check*/
			if($("#sign_keep").val()=='0') {
				alert('보존 연한을 선택해주세요');
				$("#sign_keep").focus();
				return false;
			}
			
			if($("#sign_acc").val()=='0') {
				alert('보안 등급을 선택해주세요');
				$("#sign_acc").focus();
				return false;
			}
			
			if($("#sign_type").val()=='0') {
				alert('문서 유형을 선택해주세요');
				$("#sign_type").focus();
				return false;
			}
			
			if($("#sign_title").val()=='0') {
				alert('문서 제목을 입력해주세요');
				$("#sign_title").focus();
				return false;
			}	
			
			if(!editorValue) {
				alerT('문서 내용을 입력해주세요');
				return false;
			}
			
		});
	</script>