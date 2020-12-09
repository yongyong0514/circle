$(function(){
		<!-- 조직도 스크립트 시작 -->
		$(".insert-organPanel .insert-closeBtnArea").click(function(){
		  $(".insert-organPanel").hide();
		});
		<!-- 조직도 스크립트 끝 -->
		
		
		<!-- 부서명 선택 시 하위 사원/부서 전체 체크 시작 -->
		$(".deptBtn > input:checkbox").click(function(){
			
			var status = $(this).prop("checked");
		
			$(this).closest("li").find("ul").find("div").children("input:checkbox").prop("checked",function(){
				return status;
			})			
		});
		<!-- 부서명 선택 시 하위 사원/부서 전체 체크 끝 -->
	});
	
	
	<!-- 트리구조 스크립트 시작 -->
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
	<!-- 트리구조 스크립트 끝 -->