<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 중앙 컨텐츠 시작 -->
<div class="container">
	<div class="row">
		<h1>회원로그인</h1>
		<form:form commandName="command" action="login.do" id="login_form">
			<form:errors element="div" cssClass="error-color"/>
			<div class="col-sm-9 col-lg-9"><!-- 그리드 -->
			<div class="form-group custom-input">
				<div class="col-sm-3 col-lg-3">
					<label for="email">아이디</label>
				</div>
				<div class="col-sm-9 col-lg-9">
					<form:input path="email" cssClass="form-control"/>
					<span id="check_id"></span>
					<form:errors path="email" cssClass="error-color"/>
				</div>
				</div>
			
			<div class="form-group custom-input">
				<div class="col-sm-3 col-lg-3">
					<label for="td_password">비밀번호</label>
				</div>
				<div class="col-sm-9 col-lg-9">
					<form:password path="td_password" cssClass="form-control"/>
					<span id="check_passwd"></span>
					<form:errors path="td_password" cssClass="error-color"/>
				</div>
			</div>
			</div>
			<div class="col-sm-3 col-lg-3 custom-login-submit">
				<input class="btn btn-default custom-submit" type="submit" value="로그인">
			</div>
			</form:form>
	</div>
</div>
<!-- 중앙 컨텐츠 끝 -->