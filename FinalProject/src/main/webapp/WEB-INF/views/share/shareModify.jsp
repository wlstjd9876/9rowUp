<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 중앙 컨텐츠 시작 -->
<div class="container">
	<div class="row">
		<h1>글수정</h1>
		<form:form commandName="command" action="update.do" enctype="multipart/form-data" id="register_form"> <!-- 파일 첨부시 enctype 반드시 명시 필요★ -->
			<form:hidden path="email"/> <!-- 자동으로 id값 읽어옴 -->
			<form:hidden path="num"/> <!-- 자동으로 num값 읽어옴 -->
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
					<c:if test="${!empty command.thumbfile}">
					<br>
					<span>파일이 등록되어 있습니다. 다시 업로드하면 기존 파일은 삭제됩니다.</span>
					</c:if>
				</li>
				<li>
					<label for="photofile2">사진업로드</label>
					<input type="file" name="photofile2" id="photofile2">
					<c:if test="${!empty command.photofile2}">
					<br>
					<span>파일이 등록되어 있습니다. 다시 업로드하면 기존 파일은 삭제됩니다.</span>
					</c:if>
				</li>
				<li>
					<label for="photofile3">사진업로드</label>
					<input type="file" name="photofile3" id="photofile3">
					<c:if test="${!empty command.photofile3}">
					<br>
					<span>파일이 등록되어 있습니다. 다시 업로드하면 기존 파일은 삭제됩니다.</span>
					</c:if>
				</li>
			</ul>
			<div class="align-center">
				<input type="submit" value="전송">
				<input type="button" value="목록으로" onclick="location.href='list.do'"> <!-- 경로 같으므로 contextPath~ 명시 필요 X -->
			</div>
		</form:form>
	</div>
</div>