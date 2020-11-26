<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
									<div class="inputfield">
										<label for="postType">게시판 선택</label>
										<div class="open_select">
											<select id="postType" name="postType">
				<c:forEach var="postType" items="${postType}">
					<option>${postType.post_type_title}</option>
								</c:forEach>
			</select>
										</div>
									</div>
</body>
</html>