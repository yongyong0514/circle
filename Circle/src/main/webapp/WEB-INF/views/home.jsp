<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>

html{
background:#C5D4E7;
}
#aside{
	background:#C5D4E7;
	
}
#top{
	background:#DBE5F1;
	background: -webkit-linear-gradient(to top, #DBE5F1;, #FFFFFF);
	background: linear-gradient(to top, #DBE5F1;, #FFFFFF);
	border: 1px solid lightgrey;
}

#rectangle354{
	margin:0 auto; 
	width: 500px;
	height: 600px;
	left: 1600px;
	top: 250px;
	margin-top:50px;
	background: white;
	border: 1px solid #4486AB;
	box-sizing: border-box;
	}
#rectangle355{
	margin:0 auto; 
	width: 500px;
	height: 100px;
	left: 1600px;
	top: 900px;
	
	background:#DBE5F1;
	border: 1px solid #4486AB;
	box-sizing: border-box;
	}

body{
background: #F3F3F3;
}
.group1{
width:120px;
height: 120px;
display:inline-block;
margin-left:20px;
margin-top:20px;
}
#group2{
	font-style: normal;
	font-weight: bold;
	font-size: 20px;
	width: 300px;
	color:gray;
}

#title{

	
	font-weight: bold;
	font-size: 30px;
	align:center;
	margin-left:320px;
	width:480px;
	
}	
	#titleS{
	font-size:15px;
	font-weight: bold;
	
	}
#id{
font-family: 맑은고딕;
	font-style: normal;
	font-weight: bold;
	font-size: 15px;
	margin-left:30px;
	
}
#password{
font-family: 맑은고딕;
	font-style: normal;
	font-weight: bold;
	font-size: 15px;
	margin-left:30px;
	
}
#login{
font-family: 맑은고딕;
margin-left:150px;
width: 200px;
height:80px;
}
#makeId{
	
	font-family: Monospace;
	font-style: normal;
	font-weight: bold;
	font-size: 18px;
	margin-left:120px;


}#join{
font-family: Monospace;
	font-style: normal;
	font-weight: bold;
	font-size: 20px;
	color:blue;

}
.id{
 background:#E8F0FD;
 width:450px; 
 height:45px;
 margin-left:20px;
}
.pwd{
 background:#E8F0FD;
 width:450px; 
 height:45px;
 margin-left:20px;
}
#login{
margin-left:20px;
	font-weight: bold;
	font-size: 30px;
	color:#4A5BF9;
}

#pwdfind{
margin-left:20px;
	font-weight: bold;
	font-size: 15px;
}
#foot{
	margin-left:35%;
	color:#4A5BF9;
	font-weight: bold;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	
	<form name="homeForm" method="post" action="/common/mainPage">
	<section id="container">
			<aside id="aside" >
			
			<div id="rectangle354">
			
			<div id="top">
			<label id="title">Circle<a id="titleS">&nbsp;professional</a></label>
			</div>
			
			<div>
			<img alt="" src="/circle/resources/img/sign/circleIcon.png" class="group1">
			<a class="group1" id="group2">간편하고 깔끔하게 circle<br>(환영 메세지)</a>
			
				</div>
			<label id="id">UserName</label><br><input type="text" name="id"  class="id">
			<br><br>
			<label id="password">PassWord</label><br> <input type="password" name="pwd"  class="pwd">
			<br><br>
			
				<a href="login" type="submit" id="login">로그인</a>
				<br><br><br>	
			<label id="pwdfind" onclick="pwdfind();">비밀번호를 잊었습니다.</label>
			
			</div>
			
			<div id="rectangle355">
			<br>
			<label id="foot">서비스 이용</label>&nbsp;&nbsp;<label id="" onclick="join();">약관보기</label> 
			</div>
		</aside>
		
	</section>
		</form>
	
	
	
	
	
		<script>
	
		/* function login(){
		//var login = document.getElementById("login").setAttribute("onclick","login()")
		location.href='/views/community/comuList.jsp';
		
	} */
	function join(){
		location.href='/circle/sign/signList';
		//http://localhost:8888/circle/sign/signList
	}
	
	</script>

</body>
</html>
