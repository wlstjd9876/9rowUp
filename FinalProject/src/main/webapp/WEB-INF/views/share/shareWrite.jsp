<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 중앙 컨텐츠 시작 -->
<div class="container">
	<div class="row">
		<h1>글쓰기</h1>
		<form:form commandName="command" action="write.do" enctype="multipart/form-data" id="register_form"> <!-- 파일 첨부시 enctype 반드시 명시 필요★ -->
			<form:hidden path="email"/> <!-- 자동으로 id값 읽어옴 -->
			<form:errors element="div" cssClass="error-color"/>
			<ul>
				<li>
					<label for="title">제목</label>
					<form:input path="title"/>
					<form:errors path="title" cssClass="error-color"/>
				</li>
				<li>
					<label for="content">내용</label>
					<form:textarea path="content"/>
					<form:errors path="content" cssClass="error-color"/>
				</li>
				<li>
					<label for="thumbfile">사진업로드</label>
					<input type="file" name="thumbfile" id="thumbfile">
				</li>
				<li>
					<label for="photofile2">사진업로드</label>
					<input type="file" name="photofile2" id="photofile2">
				</li>
				<li>
					<label for="photofile3">사진업로드</label>
					<input type="file" name="photofile3" id="photofile3">
				</li>
			</ul>
			<div class="align-center">
				<input type="submit" value="전송">
				<input type="button" value="목록으로" onclick="location.href='list.do'"> <!-- 경로 같으므로 contextPath~ 명시 필요 X -->
			</div>
		</form:form>
	</div>
</div>