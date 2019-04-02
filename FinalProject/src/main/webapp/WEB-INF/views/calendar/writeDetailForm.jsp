<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록하기</title>
</head>
<body>
	<div>
		<!-- 일정등록 버튼 클릭시 -->
		<h1>일정등록</h1>
		<form:form commandName="scheduleDetailCommand" action="writeDetail.do" id="register_form">
			<%-- <form:hidden path="s_num"/> --%>
			<form:hidden path="sd_num"/>
			<div>
				<ul>
					<li>
						<label for="sd_code">관광지 코드</label>
						<form:input path="sd_code"/>
						<%-- <form:errors path="sd_code" cssClass="error-color"/> --%>
					</li>
					<li>
						<label for="sd_day">일 차</label>
						<form:input path="sd_day"/>
						<%-- <form:errors path="sd_day" cssClass="error-color"/> --%>
					</li>
					<li>
						<label for="sd_starttime">일정 시작 시간</label>
						<input type="time" name="sd_starttime" id="sd_starttime">
					</li>
					<li>
						<label for="sd_endtime">일정 끝 시간</label>
						<input type="time" name="sd_endtime" id="sd_endtime">
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