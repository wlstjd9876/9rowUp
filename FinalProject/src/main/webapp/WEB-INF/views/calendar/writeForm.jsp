<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록하기</title>
</head>
<body>
	<div>
		<h1>날짜등록</h1>
		<form:form commandName="command" action="write.do" id="register_form">
			<div>
				<ul>
					<li>
						<label for="title">제목</label>
						<form:input path="title"/>
					</li>
					<li>
						<label for="content">내용</label>
						<form:textarea path="content"/>
					</li>
				</ul>
			</div>
			<div>
				<input type="submit" value="전송">
			</div>
		</form:form>
	</div>
</body>
</html>