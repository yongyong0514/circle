<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<style>
.tree button {
	margin-left: 25px;
	background: transparent;
	border: 0;
}

.tree ul {
	display: none;
	padding-left: 17px;
}

.tree li.unfold>ul {
	display: block;
}

.tree li {
	position: relative;
	padding-left: 10px;
	border-left: 1px solid #ccc;
	min-height: 23px;
	line-height: 23px;
}

.tree li::before, .tree li::after {
	content: '';
	position: absolute;
}

.tree li::before {
	top: 10px;
	left: 0;
	width: 17px;
	height: 0;
	border-bottom: 1px solid #ccc;
}

.tree>li:first-child::after {
	top: 0;
	left: -1px;
	width: 1px;
	height: 10px;
	background: #fff;
}

.tree li.last::after {
	top: 11px;
	left: -1px;
	width: 1px;
	height: 100%;
	background: #fff;
}

.tree li span {
	position: absolute;
	top: 4px;
	left: 17px;
	width: 17px;
	height: 17px;
	background: #eee;
	text-align: center;
	line-height: 17px;
	cursor: pointer;
	color: #333;
	border: 1px solid #ccc;
}

.tree li.final span {
	cursor: default;
}

.tree li span::before {
	content: '+';
}

.tree li.unfold>span::before {
	content: '-';
}

.tree li.final span::before {
	content: '▒';
}

</style>




</head>
<body>

	<ul class="tree">
		<li>
			<button>메뉴1</button>
			<ul>
				<li><button>메뉴1-1</button></li>
				<li>
					<button>메뉴1-2</button>
					<ul>
						<li><button>메뉴1-2-1</button></li>
						<li>
							<button>메뉴1-2-2</button>
							<ul>
								<li><button>메뉴1-2-2-1</button></li>
								<li><button>메뉴1-2-2-2</button></li>
							</ul>
						</li>
						<li><button>메뉴1-2-3</button></li>
					</ul>
				</li>
				<li><button>메뉴1-3</button></li>
			</ul>
		</li>
		<li><button>메뉴2</button></li>
		<li>
			<button>메뉴3</button>
			<ul>
				<li><button>메뉴3-1</button></li>
				<li><button>메뉴3-2</button></li>
			</ul>
		</li>
	</ul>



</body>

<script>

$('.tree').each(function(){
    var $this = $(this);
    $this.find('li').each(function(){   //li에
        if(!$(this).children('ul').length){ //자식 ul 없으면
            $(this).addClass('final');  //final 클래스 부여한다
        }
        if($(this).is(':last-child')){  //마지막 li이면
            $(this).addClass('last');   //last 클래스 부여한다
        }
        $(this).append('<span></span>');
    });
    $this.find('li>span').on('click',function(){ //span 클릭하면
        if($(this).parent('li').hasClass('unfold')){    //하위메뉴 열려 있을 경우
            $(this).parent('li').removeClass('unfold'); //닫고
        }
        else {  //하위메뉴 닫혀 있을 경우
            $(this).parent('li').addClass('unfold');    //연다
        }
    });
});


</script>

</html>