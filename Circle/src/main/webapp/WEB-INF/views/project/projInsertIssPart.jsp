<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



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
