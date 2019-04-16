<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member.js"></script>
<!-- 중앙 컨텐츠 시작 -->
<div class="container">
	<div class="row">
		<h1>비밀번호 변경</h1>
		<form:form commandName="command" action="changePassword.do" id="change_form" class="form-horizontal">
			<form:hidden path="email"/>
			<form:errors element="div" cssClass="error-color"/>
			<div class="form-group">
				<label for="old_passwd" class="col-md-3 col-lg-3">현재 비밀번호</label>
				<div class="col-md-5 col-lg-5">
					<form:password path="old_passwd" class="form-control"/>
					<form:errors path="old_passwd" cssClass="error-color"></form:errors>
				</div>
			</div>
			<div class="form-group">
				<label for="td_password" class="col-md-3 col-lg-3">변경할 비밀번호</label>
				<div class="col-md-5 col-lg-5">
					<form:password path="td_password" class="form-control"/>
					<form:errors path="td_password" cssClass="error-color"></form:errors>
				</div>
			</div>
			<div class="form-group">
				<label for="confirm_passwd" class="col-md-3 col-lg-3">변경할 비밀번호 확인</label>
				<div class="col-md-5 col-lg-5">
					<input type="password" name="confirm_passwd" id="confirm_passwd" class="form-control">
					<span id="message_id" class="error-color"></span>
				</div>
			</div>
			<div class="form-group" style="text-align: center;">
				<input type="submit" class="btn btn-default" value="전송">
				<input type="button" class="btn btn-default" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
			</div>
		</form:form>
	</div>
</div>