<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<Style>
.wrap02 {
	max-width: 500px;
	width: 100%;
	background: #fff;
	margin: 50px auto;
	box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.125);
	padding: 30px;
}

.wrap02 .title {
	font-size: 24px;
	font-weight: 700;
	margin-bottom: 25px;
	color: #34495e;
	text-transform0000: uppercase;
	text-align: center;
}

.wrap02 .form0000 {
	width: 100%;
	height: 600px;
}

.wrap02 .form0000 .inputfield1 {
	margin-bottom: 15px;
	display: flex;
	align-items: center;
}

.wrap02 .form0000 .inputfield1 label {
	width: 200px;
	color: #34495e;
	margin-right: 10px;
	font-size: 14px;
}

.wrap02 .form0000 .inputfield1 .input, .wrap02 .form0000 .inputfield1 .textarea
	{
	width: 100%;
	outline: none;
	border: 1px solid #d5dbd9;
	font-size: 15px;
	padding: 8px 10px;
	border-radius: 3px;
	transition: all 0.3s ease;
}

.wrap02 .form0000 .inputfield1 .textarea {
	width: 100%;
	height: 400px;
	resize: none;
}

.wrap02 .form0000 .inputfield1  .pro_select {
	position: relative;
	width: 100%;
	height: 37px;
}

.wrap02 .form0000 .inputfield1  .pro_select:before {
	content: "";
	position: absolute;
	top: 12px;
	right: 10px;
	border: 8px solid;
	border-color: #d5dbd9 transparent transparent transparent;
	pointer-events: none;
}

.wrap02 .form0000 .inputfield1  .pro_select select {
position: absolute;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	outline: none;
	width: 100%;
	height: 100%;
	border: 0px;
	padding: 8px 10px;
	font-size: 15px;
	border: 1px solid #d5dbd9;
	border-radius: 3px;
}

.wrap02 .form0000 .inputfield11 .input:focus, .wrap02 .form0000 .inputfield1 .textarea:focus,
	.wrap02 .form0000 .inputfield1  .pro_select select:focus {
	border: 1px solid #34495e;
}

.wrap02 .form0000 .inputfield1 p {
	font-size: 14px;
	color: #34495e;
}





.wrapper .form .inputfield .btn1{
position: absolute;
  width: 100px;
   padding: 8px 10px;
  font-size: 15px; 
  border: 0px;
  background:   #0072c6;
  color: #fff;
  cursor: pointer;
  border-radius: 3px;
  outline: none;
  left:39%
}

.wrapper .form .inputfield .btn1:hover{
  background: #dbe5f1;
}
.wrapper .form .inputfield .btn2{
position: absolute;
  width: 100px;
   padding: 8px 10px;
  font-size: 15px; 
  border: 0px;
  background:   #0072c6;
  color: #fff;
  cursor: pointer;
  border-radius: 3px;
  outline: none;
  left:45%
}

.wrapper .form .inputfield .btn2:hover{
  background: #dbe5f1;
}
.wrapper .form .inputfield .btn3{
position: absolute;
  width: 100px;
   padding: 8px 10px;
  font-size: 15px; 
  border: 0px;
  background:   #0072c6;
  color: #fff;
  cursor: pointer;
  border-radius: 3px;
  outline: none;
  left:54%
}


.wrapper .form .inputfield .btn3:hover{
  background: #dbe5f1;
}


@media ( max-width :500px) {
	.wrap02 .form0000 .inputfield1 {
		flex-direction: column;
		align-items: flex-start;
	}
	.wrap02 .form0000 .inputfield1 label {
		margin-bottom: 5px;
	}
	.wrap02 .form0000 .inputfield1.terms {
		flex-direction: row;
	}
}
</Style>
<div class="wrap02">


	<div class="title">프로젝트 생성</div>

	<form name="projInsertProject" id="projectInsertAdd"
		action="${pageContext.request.contextPath}/project/projInsertProjectAdd"
		method="POST">
		<div class="form000000" id="project">



			<div class="inputfield1">
				<label for="pro_title">프로젝트 명</label> <input type="text"
					class="input" id="pro_title" name="pro_title"
					placeholder="이름을 입력하세요">


				<div class="inputfield1">
					<label for="pro_intro">본문</label>
					<textarea class="textarea" id="pro_intro" name="pro_intro"></textarea>
				</div>
				<div class="inputfield1">

					<!--  오늘 이전 선택 불가 + 시작일 선택 -> 종료일 그 이전 선택 불가 -->
					<label for="pro_sdate">시작일 </label> <label>날짜 선택 <!-- 만약 체크가 되어있다면 -->
						<input type="date" id="pro_sdate" name="pro_sdate"></label>

				</div>

				<div class="inputfield1">
					<label for="pro_edate">종료일 </label>
					<!-- 만약 체크가 되어있다면 -->
					<label for="pro_edate">날짜 선택 <input type="date"
						id="pro_edate" name="pro_edate"></label>
				</div>
			</div>
			<div class="inputfield1">
				<label for="pro_manager">담당자 </label> 
				<div class="pro_select">
				<select id="pro_manager"
					name="pro_manager" class="select">
					<option>담당자 선택</option>

					<option id="pro_manager" value="${empNo}">작성자</option>
					<c:forEach var="projMember" items="${projMember }">
						<option id="pro_manager" value="${projMember.emp_info_emp_no }">${projMember.dept_info_name}
							${projMember.emp_info_name }</option>
					</c:forEach>
				</select>
				</div>
			</div>

			<div class="inputfield1">
				<input type="submit" value="글쓰기" class="btn004" name="submit"
					id="submit"> <input type="reset" value="초기화" class="btn005"
					name="reset" id="reset"> <input type="button" value="돌아가기"
					class="btn006" name="return" id="return">

			</div>
		</div>
	</form>
</div>


<script type="text/javascript">
	document.getElementById('pro_sdate').value = new Date().toISOString()
			.substring(0, 10);

	$(function() {

		$("#projectInsertAdd").submit(
				function() {

					var startDate = $('#pro_sdate').val();

					var endDate = $('#pro_edate').val();

					//-을 구분자로 연,월,일로 잘라내어 배열로 반환

					var startArray = startDate.split('-');

					var endArray = endDate.split('-');

					//배열에 담겨있는 연,월,일을 사용해서 Date 객체 생성

					var start_date = new Date(startArray[0], startArray[1],
							startArray[2]);

					var end_date = new Date(endArray[0], endArray[1],
							endArray[2]);

					//날짜를 숫자형태의 날짜 정보로 변환하여 비교한다.

					if (start_date.getTime() > end_date.getTime()) {

						alert("종료날짜보다 시작날짜가 작아야합니다.");

						return false;

					}

				});

	});
</script>
<!--  본문 종료 -->
