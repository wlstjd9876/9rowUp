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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/cal/cal.view.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=073c048326b3580b4c7257b8e804ee6b"></script>
<style>
.carousel {
	margin-bottom: 0;
	padding: 0 40px 30px 40px;
}
/* The controlsy */
.carousel-control {
	left: -12px;
	height: 40px;
	width: 40px;
	background: none repeat scroll 0 0 #222222;
	border: 4px solid #FFFFFF;
	border-radius: 23px 23px 23px 23px;
	margin-top: 90px;
}

.carousel-control.right {
	right: -12px;
}
/* The indicators */
.carousel-indicators {
	right: 50%;
	top: auto;
	bottom: -10px;
	margin-right: -19px;
}
/* The colour of the indicators */
.carousel-indicators li {
	background: #cecece;
}

.carousel-indicators .active {
	background: #428bca;
}

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
	width: 100%;
	height: 100%;
}
</style>
<script type='text/javascript'>
	$(document).ready(function() {
		var s_num = '${s_num}';
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		var email =  "<%=(String) session.getAttribute("user_email")%>";
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
					url : 'eventdetail.do',
					type : 'post',
				 	data : {
						s_num : s_num 
					},
					dataType : 'json',
					success : function(data) {
						var events = [];
						var list = data.list;
						$(list).each(function(index, item) {
							events.push({
								title : 'hi',
								start : '2019-03-06T21:30:00-05:00',
								end : '2019-03-06T22:00:00-05:00'
								/* url : 'view.do?s_num=' + item.s_num */
							});
						});
						callback(events);
					}
				});
			},
		});
	});
</script>
<script>
	$(document).ready(function() {
		$('#Carousel').carousel({
			interval : 5000
		});
	});
</script>
<div class="container">
	<div class="row">
		<div class="form-group">
			<div class="col-md-6">
				<!-- 캘린더 -->
				<div id="calendar"></div>
			</div>
			<div class="col-md-6">
				<!-- 지도 -->
				<div id="map" style="width: 555px; height: 462px;">
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=073c048326b3580b4c7257b8e804ee6b&libraries=services"></script>
					<script type="text/javascript"
						src="${pageContext.request.contextPath}/resources/js/LineMap.js"></script>
					<div id="map" style="width: 100%; height: 350px;"></div>
				</div>
			</div>
		</div>
		<div class="form-group col-md-12">
			<h1>${command.s_title}</h1>
		</div>
		<!-- 여행상세내용 -->
		<table class="table">
			<tr>
				<th>공유여부</th>
				<td>${command.s_share}</td>
			</tr>
			<tr>
				<th>여행스타일</th>
				<td>${command.s_style}</td>
			</tr>
			<tr>
				<th>교통수단</th>
				<td>${command.s_traffic}</td>
			</tr>
			<tr>
				<th>날짜 혹은 일수</th>
				<td>${command.s_startdate}</td>
			</tr>
		</table>
		<div class="form-group">
			<h3>상세일정</h3>
			<div style="width: 800px;">
				<div id="calendar_week"></div>
			</div>
		</div>
		<div class="form-group">
			<h5>${command.s_tag}</h5>
		</div>
		<div class="form-group">
			<!-- 사진 -->
			<div class="row">
				<div class="col-md-12">
					<div id="Carousel" class="carousel slide">
						<ol class="carousel-indicators">
							<li data-target="#Carousel" data-slide-to="0" class="active"></li>
							<li data-target="#Carousel" data-slide-to="1"></li>
						</ol>
						<!-- Carousel items -->
						<div class="carousel-inner">
							<div class="item active">
								<div class="row">
									<div class="col-md-1"></div>
									<div class="col-md-2">
										<c:if test="${!empty command.s_photo1}">
											<%-- <a href="imageView.do?s_num=${command.s_num}&type=1" class="thumbnail"> --%>
											<img src="imageView.do?s_num=${command.s_num}&type=1"
												alt="Image" style="width: 146px; height: 146px;">
											<!-- </a> -->
										</c:if>
										<c:if test="${empty command.s_photo1}">
											<img
												src="${pageContext.request.contextPath}/resources/img/cal/nophoto.png"
												alt="Image" style="width: 146px; height: 146px;">
										</c:if>
									</div>
									<div class="col-md-2">
										<c:if test="${!empty command.s_photo2}">
											<img src="imageView.do?s_num=${command.s_num}&type=2"
												alt="Image" style="width: 146px; height: 146px;">
										</c:if>
										<c:if test="${empty command.s_photo2}">
											<img
												src="${pageContext.request.contextPath}/resources/img/cal/nophoto.png"
												alt="Image" style="width: 146px; height: 146px;">
										</c:if>
									</div>
									<div class="col-md-2">
										<c:if test="${!empty command.s_photo3}">
											<img src="imageView.do?s_num=${command.s_num}&type=3"
												alt="Image" style="width: 146px; height: 146px;">
										</c:if>
										<c:if test="${empty command.s_photo3}">
											<img
												src="${pageContext.request.contextPath}/resources/img/cal/nophoto.png"
												alt="Image" style="width: 146px; height: 146px;">
										</c:if>
									</div>
									<div class="col-md-2">
										<c:if test="${!empty command.s_photo4}">
											<img src="imageView.do?s_num=${command.s_num}&type=4"
												alt="Image" style="width: 146px; height: 146px;">
										</c:if>
										<c:if test="${empty command.s_photo4}">
											<img
												src="${pageContext.request.contextPath}/resources/img/cal/nophoto.png"
												alt="Image" style="width: 146px; height: 146px;">
										</c:if>
									</div>
									<div class="col-md-2">
										<c:if test="${!empty command.s_photo5}">
											<img src="imageView.do?s_num=${command.s_num}&type=5"
												alt="Image" style="width: 146px; height: 146px;">
										</c:if>
										<c:if test="${empty command.s_photo5}">
											<img
												src="${pageContext.request.contextPath}/resources/img/cal/nophoto.png"
												alt="Image" style="width: 146px; height: 146px;">
										</c:if>
									</div>
									<div class="col-md-1"></div>
								</div>
								<!--.row-->
							</div>
							<!--.item-->

							<div class="item">
								<div class="row">
									<div class="col-md-1"></div>
									<div class="col-md-2">
										<c:if test="${!empty command.s_photo6}">
											<img src="imageView.do?s_num=${command.s_num}&type=6"
												alt="Image" style="width: 146px; height: 146px;">
										</c:if>
										<c:if test="${empty command.s_photo6}">
											<img
												src="${pageContext.request.contextPath}/resources/img/cal/nophoto.png"
												alt="Image" style="width: 146px; height: 146px;">
										</c:if>
									</div>
									<div class="col-md-2">
										<c:if test="${!empty command.s_photo7}">
											<img src="imageView.do?s_num=${command.s_num}&type=7"
												alt="Image" style="width: 146px; height: 146px;">
										</c:if>
										<c:if test="${empty command.s_photo7}">
											<img
												src="${pageContext.request.contextPath}/resources/img/cal/nophoto.png"
												alt="Image" style="width: 146px; height: 146px;">
										</c:if>
									</div>
									<div class="col-md-2">
										<c:if test="${!empty command.s_photo8}">
											<img src="imageView.do?s_num=${command.s_num}&type=8"
												alt="Image" style="width: 146px; height: 146px;">
										</c:if>
										<c:if test="${empty command.s_photo8}">
											<img
												src="${pageContext.request.contextPath}/resources/img/cal/nophoto.png"
												alt="Image" style="width: 146px; height: 146px;">
										</c:if>
									</div>
									<div class="col-md-2">
										<c:if test="${!empty command.s_photo9}">
											<img src="imageView.do?s_num=${command.s_num}&type=9"
												alt="Image" style="width: 146px; height: 146px;">
										</c:if>
										<c:if test="${empty command.s_photo9}">
											<img
												src="${pageContext.request.contextPath}/resources/img/cal/nophoto.png"
												alt="Image" style="width: 146px; height: 146px;">
										</c:if>
									</div>
									<div class="col-md-2">
										<c:if test="${!empty command.s_photo10}">
											<img src="imageView.do?s_num=${command.s_num}&type=10"
												alt="Image" style="width: 146px; height: 146px;">
										</c:if>
										<c:if test="${empty command.s_photo10}">
											<img
												src="${pageContext.request.contextPath}/resources/img/cal/nophoto.png"
												alt="Image" style="width: 146px; height: 146px;">
										</c:if>
									</div>
									<div class="col-md-1"></div>
								</div>
								<!--.row-->
							</div>
							<!--.item-->
						</div>
						<!--.carousel-inner-->
						<a data-slide="prev" href="#Carousel"
							class="left carousel-control">‹</a> <a data-slide="next"
							href="#Carousel" class="right carousel-control">›</a>
					</div>
					<!--.Carousel-->
				</div>
			</div>
		</div>
		<div class="form-group">
			<!-- 여행내용 -->
			<textarea rows="5" cols="40" name="s_content" class="form-control"
				readonly="readonly" style="resize: none;">${command.s_content}</textarea>
		</div>
		<div class="form-group">
			<input type="button" value="수정" class="btn btn-default"
				onclick="location.href='update.do?s_num=${command.s_num}'">
			<input type="button" value="삭제" class="btn btn-default"
				onclick="location.href='delete.do?s_num=${command.s_num}'">
		</div>
	</div>
</div>