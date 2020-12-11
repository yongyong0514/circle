<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>



<div class="form" id="project">



	<div class="title">프로젝트 생성</div>
	<form name="projInsertProject" id="projectInsertAdd"
		action="${pageContext.request.contextPath}/project/projInsertProjectAdd"
		method="POST">
		
		
		
		<div class="inputfield">
			<label for="pro_title">프로젝트 명</label> <input type="text"
				class="input" id="pro_title" name="pro_title"
				placeholder="이름을 입력하세요">
			
			
			<div class="inputfield">
				<label for="pro_intro">본문</label>
				<textarea class="textarea" id="pro_intro" name="pro_intro"></textarea>
			</div>
			<div class="inputfield">

				<!--  오늘 이전 선택 불가 + 시작일 선택 -> 종료일 그 이전 선택 불가 -->
				<label for="pro_sdate">시작일 </label> <label>날짜 선택 <!-- 만약 체크가 되어있다면 -->
					<input type="date" id="pro_sdate" name="pro_sdate"></label>

			</div>

			<div class="inputfield">
				<label for="pro_edate">종료일 </label>
				<!-- 만약 체크가 되어있다면 -->
				<label for="pro_edate">날짜 선택 <input type="date"
					id="pro_edate" name="pro_edate"></label>
			</div>
		</div>
		<div class="inputfield">
			<label for="pro_manager">담당자 </label> 
			<select id="pro_manager"
				name="pro_manager">
				<option>담당자 선택</option>

				<option id="pro_manager" value="${empNo}">작성자</option>
				<c:forEach var="projMember" items="${projMember }">
					<option id="pro_manager" value="${projMember.emp_info_emp_no }">${projMember.dept_info_name}
						${projMember.emp_info_name }</option>
				</c:forEach>
			</select>
		</div>

		<div class="inputfield">
			<input type="submit" value="글쓰기" class="btn" name="submit"
				id="submit"> <input type="reset" value="초기화" class="btn"
				name="reset" id="reset"> <input type="button" value="돌아가기"
				class="btn" name="return" id="return">

		</div>
	</form>
</div>

<script type="text/javascript">
document.getElementById('pro_sdate').value = new Date().toISOString().substring(0, 10);


$(function(){

	$("#projectInsertAdd").submit(function(){

        var startDate = $('#pro_sdate').val();

        var endDate = $('#pro_edate').val();

        //-을 구분자로 연,월,일로 잘라내어 배열로 반환

        var startArray = startDate.split('-');

        var endArray = endDate.split('-');   

        //배열에 담겨있는 연,월,일을 사용해서 Date 객체 생성

        var start_date = new Date(startArray[0], startArray[1], startArray[2]);

        var end_date = new Date(endArray[0], endArray[1], endArray[2]);

          //날짜를 숫자형태의 날짜 정보로 변환하여 비교한다.

        if(start_date.getTime() > end_date.getTime()) {

            alert("종료날짜보다 시작날짜가 작아야합니다.");

            return false;

        }

     });

});

</script>
<!--  본문 종료 -->
