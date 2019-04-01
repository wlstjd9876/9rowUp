<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/data/location/style.css">

<link
	href='//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'
	rel='stylesheet' type='text/css'>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/data/location/searchform.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>같이떠나요!</title>
</head>
<body>
	<div id="contents">
		<div id="search_form">
			<h1 class="hn">관광지 정보</h1>
			<br>
			<p>
				<label for="age">연령대</label> <input type="text" id="age"
					name="login" id="login">
			</p>
			<p>
				<label for="gen">성별</label> <input type="text" id="gen" name="login"
					id="login">
			</p>


			<div class="sel_box">
				<label for="areacode">지역</label> <select name="selOne" id="selOne"
					onchange="doChange(this, 'selTwo')">
					<option value="default">---Select Something---</option>
					<option value="1">서울</option>
					<option value="2">경기</option>
				</select>
			</div>
			<div class="sel_box">
				<label for="people">시군구</label> 
				<select name="selTwo" id="selTwo">
					<option value="default">---Select Something---</option>
				</select>

			</div>
			<p>
				<label for="reason">신청이유</label> <input type="text" id="reason"
					name="login" id="login">
			</p>
			<div class="container">
				<h1>Go on, click me!</h1>
				<div class="search-box-container">
					<button class="submit">
						<i class="fa fa-search"></i>
					</button>
					<input class="search-box">
				</div>
				<h3 class="response"></h3>
			</div>
		</div>
	</div>
</body>
</html>