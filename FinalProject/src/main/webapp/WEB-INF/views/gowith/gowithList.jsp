<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style2.css">

<script src="${pageContext.request.contextPath}/resources/js/popup.js"></script>
<html>
<head>
<script type="text/javascript">
    $(document).ready(function() {
      $('#close').click(function() {
        $('#pop').hide();
      });
    });
 </script>
<meta charset="UTF-8">
<title>같이떠나요!</title>
</head>
<body>
	<h1>같이떠나요!</h1>
	<div id="contents">
		<a href="#layerPopup"><input type="button" class="btn btn-danger"
			value="신청하기"></a>
		<div id="layerPopup" class="formtag">
		<h1>신청하기</h1>
			<p>
				<label for="name">신청자 이름</label> <input type="text" id="fname"
					name="login" id="login">
			</p>
			<p>
				<label for="age">연령대</label> <input type="text" id="age"
					name="login" id="login">
			</p>
			<p>
				<label for="gen">성별</label> <input type="text" id="gen" name="login"
					id="login">
			</p>
			<p>
				<label for="people">인원수</label>
				<select id="people" name="인원수">
				<option value="1">1</option> 
				<option value="2">2</option> 
				<option value="3">3</option> 
				</select>

			</p>
			<p>
				<label for="reason">신청이유</label> <input type="text" id="reason"
					name="login" id="login">
			</p>
			<p>
				<input type="submit" class="myButton" value="신청하기">
				<button type="button" class="closeButton div vc">취소하기</button>
			</p>

		</div>
	</div>
</body>
</html>