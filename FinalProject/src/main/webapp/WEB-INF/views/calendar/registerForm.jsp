<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/js/fullcalendar.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/js/fullcalendar.min.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/lib/moment.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/fullcalendar.js"></script>
<!-- 한글지정 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/locale/ko.js"></script>
<!-- <script>
	window.opener.document.getElementsByClass("fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable").attr('href')=document.getElementById("sd_num").value;
</script> -->


<style>
body {
	text-align: center;
	font-size: 14px;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	min-height: 700px;
}

#wrap {
	width: 100%;
	margin: 0 auto;
}

#external-events {
	float: left;
	width: 150px;
	padding: 0 10px;
	border: 1px solid #ccc;
	background: #eee;
	text-align: left;
}

#external-events h4 {
	font-size: 16px;
	margin-top: 0;
	padding-top: 1em;
}

#external-events .fc-event {
	margin: 10px 0;
	cursor: pointer;
}

#external-events p {
	margin: 1.5em 0;
	font-size: 11px;
	color: #666;
}

#external-events p input {
	margin: 0;
	vertical-align: middle;
}

#calendar {
	width: 900px;
	height: 600px;
}
</style>



<script type='text/javascript'>
	$(document).ready(function() {

		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		var email =  "<%=(String)session.getAttribute("user_email")%>";
		var calendar = $('#calendar').fullCalendar({

			header : {
				left : 'prev,next',
				center : 'title',
				right : 'today'
			},
			selectable : true,
			selectHelper : true,
			events : function(start, end, timezone, callback) {
				$.ajax({
					url : 'eventAll.do',
					type : 'post',
					data:{email:email},
					dataType : 'json',
					success : function(data) {
						var events = [];
						var list = data.list;
						$(list).each(function(index, item) {
							events.push({
								title : item.s_title,
								start : item.s_startdate,
								end : item.s_enddate,
								url: 'view.do?s_num='+item.s_num+'?defaultDate='+item.s_startdate
							});
						});
						callback(events);
					}
				});
			},
		});
	});
</script>

<div class="container"
	style="width: 900px; margin: 0 auto; height: 800px;">
	<div
		style="width: 900px; height: 100px; text-align: center; margin: 30px auto;">
		<input type="button" value="일정등록" class="btn btn-default"
			name="finish" id="finish" onclick="location.href='finish.do'">
		<input type="button" value="임시저장" class="btn btn-default" name="temp"
			id="temp" onclick="">
	</div>
	<div class="cal-body">
		<div id="calendar"></div>
	</div>
</div>
