<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/post/postAdd.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
     <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/menuTopBar.jsp" />
		<jsp:include page="../common/menuAlertBar.jsp" />
		<div class="container">
			<div class="navLeft">
				<jsp:include page="../post/postSidebar.jsp" />
			</div>
			<div class="content">
				<div>
					<jsp:include page="../post/postHomebar.jsp"/>
				</div>
				
				<!-- 내용 -->
				<div class="wraper">
				<form class="insert" action="postAdd" method="get">
				<h3 class="name">제목</h3>
					<input type="text" name="title" class="up">
				<h3 class="name">카테고리</h3>
				<select type="dropbox" name="category" class="category">
				<option>1</option>
				<option>2</option>
				 </select>
				 
				 
				<h3 class="name">본문</h3>
				<br>
				
				</select>
				<br>
				 <div id="editor" name="comment"></div>
				
				<div> 
				<h3> 공개 여부</h3>
				<select type="radiobox" name="open" class="open">
				<option>y</option>
				<option>n</option>
				<br>
				<br>
				<input type="file" id="file" accept="*/*">
				
				<input type="submit" id="submit" value="글쓰기">
				</div>
				
				</form>
			</div>
			</div>
		</div>
	</div>
	
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

	
	<script>
        //문제 : 등록을 누르면 작성한 내용이 전송되지 않는다는 것!
        //해결책 : input,textarea,select만 전송이 되므로 input[type=hidden]을 생성하여 값 복사!
        $(function(){
            //에디터 생성
            var editor = new toastui.Editor({
                el:document.querySelector("#editor"),
            });    

            //전송을 위해 #editor의 뒤에 input태그를 숨김 첨부
            $("#editor").after("<input type='hidden' name='content'>");

            //에디터에 이벤트를 설정할 때는 jquery 처럼 설정이 가능(jquery 기능이 아님)
            //- keyup / blur / 등
            //- editor.getMarkdown() : 내부적으로 관리되는 문법(Markdown)
            //- editor.getHtml() : 실제 표시되는 모양(HTML)
            editor.on("blur", function(){
                var value = editor.getMarkdown();

                //value를 input에 복사
                $("#editor").next("input[name=content]").val(value);

                //localStorage를 사용하면 작성중인 글을 임시저장할 수 있음
                //- window.localStorage.setItem("이름", "데이터");
                //- window.localStorage.getItem("이름") -> 데이터
                window.localStorage.setItem(location.href, value);
            });

            //만약 입력이 안되면 전송을 불가능하게 하고싶다면 form에 submit이벤트를 설정해야 한다
            // - 에디터에 설정하는 것이 아님!
            // - e.preventDefault();를 원하는 상황에서 사용
            $("form").submit(function(e){

                var content = $(this).find("input[name=content]").val();
                if(!content.trim()){//쓸데없는 여백을 지운 뒤 content값이 없거나 비어있다면
                    alert("값을 입력하세요!");
                    e.preventDefault();//기본 진행 이벤트를 차단
                    return;
                }

                //전송
                this.submit();
            });
        });
    </script>
   
</body>
</html>