<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 중앙 컨텐츠 시작 -->
<div class="container">
	<div class="row">
		<h1>회원탈퇴</h1>
		<form:form commandName="command" action="delete.do" id="delete_form">
			<form:hidden path="email"/>
			<form:errors element="div" cssClass="error-color"/>
			<ul>
				<li>
					<label for="td_password">비밀번호</label>
					<form:password path="td_password"/>
					<form:errors path="td_password" cssClass="error-color"></form:errors>
				</li>
			</ul>
			<div class="align-center">
				<input type="submit" class="btn btn-primary custom-submit" value="전송">
				<input type="button" class="btn btn-primary" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
			</div>
		</form:form>
	</div>
</div>