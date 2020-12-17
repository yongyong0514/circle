<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

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
	text-transform00: uppercase;
	text-align: center;
}

.wrap02 .form00 {
	width: 100%;
	height: 600px;
}

.wrap02 .form00 .inputfield {
	margin-bottom: 15px;
	display: flex;
	align-items: center;
}

.wrap02 .form00 .inputfield label {
	width: 200px;
	color: #34495e;
	margin-right: 10px;
	font-size: 14px;
}

.wrap02 .form00 .inputfield .input, .wrap02 .form00 .inputfield .textarea
	{
	width: 100%;
	outline: none;
	border: 1px solid #d5dbd9;
	font-size: 15px;
	padding: 8px 10px;
	border-radius: 3px;
	transition: all 0.3s ease;
}

.wrap02 .form00 .inputfield .textarea {
	width: 100%;
	height: 400px;
	resize: none;
}

.wrap02 .form00 .inputfield  .pro_select {
	position: relative;
	width: 100%;
	height: 37px;
}

.wrap02 .form00 .inputfield  .pro_select:before {
	content: "";
	position: absolute;
	top: 12px;
	right: 10px;
	border: 8px solid;
	border-color: #d5dbd9 transparent transparent transparent;
	pointer-events: none;
}

.wrap02 .form00 .inputfield  .pro_select select {
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

.wrap02 .form00 .inputfield .input:focus, .wrap02 .form00 .inputfield .textarea:focus,
	.wrap02 .form00 .inputfield  .pro_select select:focus {
	border: 1px solid #34495e;
}

.wrap02 .form00 .inputfield p {
	font-size: 14px;
	color: #34495e;
}





.wrap02 .form00 .inputfield .btn01 {
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
	left: 39%
}

.wrap02 .form00 .inputfield .btn01:hover {
	background: #dbe5f1;
}

.wrap02 .form00 .inputfield .btn02 {
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
	left: 45%
}

.wrap02 .form00 .inputfield .btn02:hover {
	background: #dbe5f1;
}

.wrap02 .form00 .inputfield .btn03 {
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
	left: 54%
}

.wrap02 .form00 .inputfield .btn03:hover {
	background: #dbe5f1;
}

.wrap02 .form00 .inputfield:last-child {
	margin-bottom: 0;
}

@media ( max-width :500px) {
	.wrap02 .form00 .inputfield {
		flex-direction: column;
		align-items: flex-start;
	}
	.wrap02 .form00 .inputfield label {
		margin-bottom: 5px;
	}
	.wrap02 .form00 .inputfield.terms {
		flex-direction: row;
	}
}
</style>
<div class="wrap02">
<div class="form" id="iss">

	<div class="title">업무 생성</div>
	<form name="projInsertIssAdd" id="projInsertIssAdd" action="${pageContext.request.contextPath}/project/projInsertIssAdd"
		method="POST" enctype="multipart/form-data">
		
		
		
		<div class="inputfield">
			<label for="iss_title">업무 명</label> <input type="text" class="input"
				id="iss_title" name="iss_title" placeholder="이름을 입력하세요">
		
		
			<div class="inputfield">
				<label for="iss_pro_code">프로젝트 </label> 
				<select id="iss_pro_code" name="iss_pro_code">
					<c:forEach var="projMain" items="${projMain}">
						<option id="iss_pro_code" value="${projMain.pro_code}"> ${projMain.pro_title}</option>
					</c:forEach>
				</select>
			</div>
		
		
			<div class="inputfield">
				<label for="iss_file">파일</label> 
				<input name="iss_file" 	id="iss_file" type="file" class="input" accept="*.*" multiple="multiple">
			</div>
		
		
			<div class="inputfield">
				<label for="iss_prog_code">진행단계 </label>
				 <select id="iss_prog_code" name="iss_prog_code"> 
					<c:forEach var="issProg" items="${issProg}">
						<option id="iss_prog_code" name="iss_prog_code"
							value="${issProg.prog_code }">${issProg.prog_title}
							${issMember.emp_info_name }</option>
					</c:forEach>
				</select>
			</div>
		
			<div class="inputfield">
				<label for="iss_situ_code">업무상황</label> 
				<select id="iss_situ_code" name="iss_situ_code">
					<c:forEach var="issSitu" items="${issSitu}">
						<option id="iss_situ_code" name="iss_situ_code"
							value="${issSitu.situ_code }">${issSitu.situ_title}</option>
					</c:forEach>
				</select>
			</div>

			<div class="inputfield">
				<label for="iss_cont">업무 설명</label>
				<textarea class="textarea" id="iss_cont" name="iss_cont"></textarea>
			</div>
		
			<div class="inputfield">
				<label for="iss_sdate">시작일 </label> 
				<label>날짜 선택 <!-- 만약 체크가 되어있다면 -->
					<input type="date" id="iss_sdate" name="iss_sdate"></label>

			</div>


			<div class="inputfield">
				<label for="iss_edate">종료일 </label>
				<!-- 만약 체크가 되어있다면 -->
				<label for="iss_edate">날짜 선택 <input type="date"
					id="iss_edate" name="iss_edate"></label>
			</div>
		</div>

		<div class="inputfield">
			<input type="submit" value="글쓰기" class="btn" name="submit"
				id="submit"> <input type="reset" value="초기화" class="btn"
				name="reset" id="reset"> <input type="button" value="돌아가기"
				class="btn" name="return" id="return">

		</div>
	</form>
</div>

</div>
