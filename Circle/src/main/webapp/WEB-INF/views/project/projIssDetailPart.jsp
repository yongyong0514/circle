<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.wrapper {
	max-width: 500px;
	width: 100%;
	background: #fff;
	margin: 50px auto;
	box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.125);
	padding: 30px;
}

.wrapper .title {
	font-size: 24px;
	font-weight: 700;
	margin-bottom: 25px;
	color: #34495e;
	text-transform: uppercase;
	text-align: center;
}

.wrapper .head {
	font-size: 12px;
	font-weight: 700;
	margin-bottom: 25px;
	color: #34495e;
	text-transform: uppercase;
	text-align: right;
}

.wrapper .head2 {
	font-size: 14px;
	left: 90%;
	font-weight: 700;
	margin-bottom: 25px;
	color: #34495e;
	text-transform: uppercase;
	text-align: right;
}

.body  .no1 {
	position: absolute;
	width: 100px;
	padding: 8px 10px;
	font-size: 15px;
	border: 0px;
	background: #0072c6;
	color: #fff;
	cursor: pointer;
	border-radius: 3px;
	outline: none;
	left: 58%
}

.body.no1:hover {
	background: #dbe5f1;
}
</style>


<!--  본문 -->
<div class="wrapper">
	<c:forEach var="projIssDetail" items="${projIssDetail}">
		<div>
			<div class="title">${projIssDetail.iss_title}</div>
			<div class="head">
				 ${projIssDetail.dept_info_name} ${projIssDetail.emp_info_name}
				<br>작성일 : ${projIssDetail.iss_wdat}
				<br> 시작일 :
				<c:if test="${projIssDetail.iss_sdate eq null}">
					<label>---</label>
				</c:if>
				${projIssDetail.iss_sdate}
				<br> 종료일 :
				<c:if test="${projIssDetail.iss_edate eq null}">
					<label>---</label>
				</c:if>${projIssDetail.iss_edate}
<br>
				진행단계 : ${projIssDetail.prog_title}
<br>
				업무상황 : ${projIssDetail.situ_title}


			</div>

			<div class="head2">
				${projIssDetail.iss_cont}
			</div>

		</div>
		<div>
			업무관련 자료
			<div>
				<c:if test="${projIssDetail.files_code  eq null}">
					<label>관련 자료가 없습니다. </label>
				</c:if>
				<c:if test="${projIssDetail.files_code  != null}">
			파일 명 : ${projIssDetail.files_oname}<a
						href='<c:url value='/project/projDownload?files_code=${projIssDetail.files_code}'/>'>다운로드</a>
				</c:if>
			</div>
			<button class="no1">변경하기</button>
		</div>
	</c:forEach>

</div>




<!-- 버튼 부분 -->

<div>
	<c:if test="${empNo eq viewEmpNo }">
		<c:forEach var="projDetail" items="${projDetail}">
					<button  class="btn1" type="button"  onClick="location.href='<c:url value='/project/projUpdate?pro_code=${projDetail.pro_code}'/>'">수정하기</button>
				<button  class="btn2" type="button"  onClick="location.href='<c:url value='/project/projDelete?pro_code=${projDetail.pro_code}'/>'>">삭제하기</button>
	
		</c:forEach>
	</c:if>
	<div>
		<a
			href='<c:url value='/project/projDelete?pro_code=${projDetail.pro_code}'/>'>돌아가기</a>
	</div>
</div>
		

