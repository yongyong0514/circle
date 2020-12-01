<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common/menuBar/menuOrganChart.css">
</head>
<body>
	<!-- 조직도 버튼 시작 -->
	<div class="organChartBorder">
		<div class="organChartBtn">조직도</div>
	</div>
	<!-- 조직도 버튼 끝 -->

	<!-- 조직도 패널 시작-->
	<div class="organPanel">
		<div class="topPanel">
			<div class="search">
				<input type="text" name="searchValue" placeholder="사번/이름/부서/직위/이메일"/>
			</div>
			<div class="closeBtnArea">
				<input type="button" name="closeBtn" value="X"/>
			</div>
		</div>
		<div class="members">
			<ul>
				<li>대표이사
					<ul>
						<li>김대표
							<ul>
								<li></li>
							</ul>
						</li>
					</ul>
				</li>
			</ul>
			
			<ul>
				<li>사업본부</li>
			</ul>
			
			<ul>
				<li>경영지원본부
					<ul>
						<li>인사팀
							<ul>
								<li>가나다</li>
								<li>이순신</li>
							</ul>
						</li>
						<li>경영팀
							<ul>
								<li>고길동</li>
								<li>둘리</li>
							</ul>
						</li>
						<li>총무팀</li>
					</ul>
				</li>
			</ul>
			
			<ul>
				<li>개발본부
					<ul>
						<li>디자인팀</li>
						<li>서비스개발팀</li>
						<li>플랫폼운영팀</li>
					</ul>
				</li>
			</ul>
			
			<ul>
				<li>영업본부
					<ul>
						<li>마케팅팀</li>
						<li>영업팀</li>
						<li>유통팀</li>
					</ul>
				</li>
			</ul>
			
			<!-- 부서등급이 2인 부서 -->
			<c:forEach var="부서2" items="부서2s">
				<ul>
					<li>개발본부
						<ul>
							<!-- 부서등급이 2인 부서 -->
							<c:forEach var="부서3" items="부서3s">
								<li>디자인팀</li>
								<li>서비스개발팀</li>
								<li>플랫폼운영팀</li>
							</c:forEach>
						</ul>
					</li>
				</ul>
			</c:forEach>
		</div>
	</div>
	<!-- 조직도 버튼 끝 -->
	
	<!-- 개인 인적사항 시작 -->
	
	<!-- 개인 인적사항 끝 -->
</body>


<!-- 조직도 스크립트 시작 -->
<script>
	$(function(){
		$(".organChartBtn").click(function(){
			$(".organPanel").toggle();
			console.log("clicked");
		});
		
		$(".closeBtnArea").click(function(){
		  $(".organPanel").hide();
		  console.log("worked");
		});
	});
</script>
<!-- 조직도 스크립트 끝 -->

</html>