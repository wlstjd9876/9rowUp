<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
.hn {
   font-family: 'Hanna', sans-serif;
}
</style>
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
.fontdetail{
	text-align: left   
}
.modaldetail{
	width: 600px;
	height: 750px;
}
.formcenter {
	margin-bottom: 55px;
	margin-left: 55px;
	padding: 100px 100px;
	align-items: center;
}
/*버튼 왼쪽 정렬*/
.buttonleft {
	float: left;
}
/*버튼 왼쪽 정렬 끝*/
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

kdk {
	display: inline-block;
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
                	  var title = '' 
                		  title = detail(item.sd_code);
                	  alert(title);
                     events.push({
                        title : title,
                        start : '2019-03-10T12:00:00',
                        allDay : false
                        /* url : 'view.do?s_num=' + item.s_num */
                     });
                  });
                  callback(events);
               }
            });
         },
         defaultDate : <%=(String) request.getAttribute("defaultDate")%>
      });
   });
   function detail(contentId){
		$.ajax({        
			url: '${pageContext.request.contextPath}/detailAjax',
			data:{contentId:contentId},
			type: 'get',
			dataType: 'json',
			cache:false,
			timeout:30000,
			success: function(data){
				var myItem = data.response.body.items.item;
				var myBody = data.response.body;
				var title = myItem.title;
				alert('title'+title);
				callback(title);
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) { 
				alert("Status: " + textStatus +"and "+ "Error: " + errorThrown); 
			}  
		});
	};      
</script>
<script>
	$(document).ready(function() {
		$('#Carousel').carousel({
			interval : 5000
		});
	});
</script>
<!-- 팝업창 -->
<script type="text/javascript">
	$(document).ready(function() {//팝업창 처리
						$('.popupBtn').click(function() {
											window.open(
															"${pageContext.request.contextPath}/data/location/listPopup.do",//this는 함수의 나의값을 불러서 .attr('data-num')반복되는값을 지정해주는것이다.
															"childForm",
															"width=1200, height=650, resizable = no, scrollbars = no");
										});
					});
</script>
<div class="container">
	<div class="row hn">
	<br><br>
		<div class="form-group">
			<div class="col-md-6">
				<!-- 캘린더 -->
				<div id="calendar"></div>

				<!--상세일정 Modal 시작 -->

				<!-- modal 구동 버튼 (trigger) -->
				<div>
				<br>
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#myModal">일정상세등록</button>
				<br>
				</div>
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalTitle" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content modaldetail">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h2 class="modal-title fontdetail" id="myModalLabel">일정상세등록</h2>
							</div>
							<div class="row">

								<form:form commandName="calendarDetailCommand" action="view.do"
									id="register_form" class="col-lg-10 formcenter">
									<div class="form-group">
										<label for="sd_code" class="fontdetail">관광지 코드</label>
										<form:input path="sd_code" class="form-control kdk" />
										<form:errors path="sd_code" cssClass="error-color" />
										<!-- 팝업 버튼 시작-->
										<input type="button"
											class="popupBtn btn btn-default buttonleft" value="관광지 찾기">
										<!-- 팝업 버튼 끝-->
									</div>
									<br>
									<div class="form-group">
										<label for="sd_day">일 차</label>
										<form:input path="sd_day" class="form-control" />
										<form:errors path="sd_day" cssClass="error-color" />
									</div>
									<div class="form-group">
										<label for="sd_starttime">일정 시작 시간</label> <input type="time"
											name="sd_starttime" id="sd_starttime" class="form-control">
									</div>
									<div class="form-group">
										<label for="sd_endtime">일정 끝 시간</label> <input type="time"
											name="sd_endtime" id="sd_endtime" class="form-control">
									</div>
									<div class="form-group">
										<label for="sd_memo">메모</label> <input type="text"
											name="sd_memo" id="sd_memo" class="form-control">
									</div>
									<div class="form-group">
										<label for="sd_money">여행비</label>
										<form:input path="sd_money" class="form-control" />
										<form:errors path="sd_money" cssClass="error-color" />
									</div>
									<div class="form-group" style="text-align: center;">
										<input type="submit" value="전송" class="btn btn-default">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">닫기</button>
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--상세일정 Modal 끝 -->

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

	<div class="form-group col-md-12 hn">
		<h1>${command.s_title}</h1>
	</div>

	<!-- 여행상세내용 -->
	<table class="table hn">
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
	<div class="form-group hn">
		<br>
		<h2>상세일정</h2>
		<div style="width: 800px;">
			<div id="calendar_week"></div>
			<br>
		</div>
	</div>
	<div class="form-group hn">
		<h4>${command.s_tag}</h4>
	</div>
	<div class="form-group hn">
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
					<a data-slide="prev" href="#Carousel" class="left carousel-control">‹</a>
					<a data-slide="next" href="#Carousel"
						class="right carousel-control">›</a>
				</div>
				<!--.Carousel-->
			</div>
		</div>
	</div>
	<div class="form-group hn">
		<!-- 여행내용 -->
		<textarea rows="5" cols="40" name="s_content" class="form-control"
			readonly="readonly" style="resize: none;">${command.s_content}</textarea>
	</div>
	<div class="form-group hn">
		<input type="button" value="수정" class="btn btn-default"
			onclick="location.href='update.do?s_num=${command.s_num}'"> <input
			type="button" value="삭제" class="btn btn-default"
			onclick="location.href='delete.do?s_num=${command.s_num}'">
	</div>
</div>
