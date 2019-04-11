<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-theme.min.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.2.0/fullcalendar.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.2.0/fullcalendar.print.css" media='print' />
<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/moment.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui-touch-punch/0.2.3/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/locale/ko.js"></script>
<!-- <script>
	window.opener.document.getElementsByClass("fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable").attr('href')=document.getElementById("sd_num").value;
</script> -->


<style>
	body {
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
	}
		
	#wrap {
		width: 1100px;
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
		float: right;
		width: 900px;
	}
</style>


<script>  
$(document).ready(function() {
    var addDay = 1;
    
    function setCalendar(){
        $('#calendar').fullCalendar({
            defaultView: 'month',
            
            header: {
                left: 'prev,next today', 
                center: 'title', 
                right: 'month,agendaWeek,agendaDay registerBtn' /* ,addDayBtn,oddDayBtn */
            },
            
            eventClick: function(eventObj) {
                window.open('${pageContext.request.contextPath}/calendar/popup/detail.do?sd_num='+$(this).attr('href'), '일정 상세페이지', 'width=400, height=300, left=100, top=50');
            	return false;
            },
            
  
            
            customButtons: {
                registerBtn:{
                    text: '일정등록',
                    click: function(url) {
                        location.href = '${pageContext.request.contextPath}/calendar/writeDetail.do';
                    }
                   },
                    registerBtn:{
                text: '즐겨찾기',
                click: function(url) {
                    location.href = '${pageContext.request.contextPath}/calendar/writeDetail.do';
                }
                }
           
            },
            
            selectable:true, //이벤트 선택 허용
            eventLimit:true, //하루에 너무 많은 이벤트가 발생하면 popover 허용
            
            //navLinks : 월/주별 달력에서 일자를 클릭하면 일별 보기로 전환하는 기능 사용여부
            navLinks: false,
            //editable : 실행된 달력에서 일정을 표시한 바를 마우스로 이동할 수 있게 하는 것
            editable: true,
            
            //allDaySlot : week - allDay 사용유무
            allDaySlot: false,
            
            //스크롤 시작 시간 설정
            scrollTime: '08:00:00',
            
            titleFormat: 'YYYY MMMM',
            
            //이벤트 생성
            //월에 데이터 보여줌
            events: function(start, end, timezone, callback) {
                $.ajax({
                    url: 'scheduleAll.do',
                    type : 'post',
                    data : {},
                    dataType: 'json',
                    success: function(data) {
                        
                        var events = [];
                        var list = data.list;
                        
                        $(list).each(function(index, item) {
                            var now = new Date();
                            var nowMonth = ((now.getMonth()< 9) ? '0' : '') + (now.getMonth() + 1);
                            var nowDate = (((now.getDate() + item.sd_day - 1)< 10) ? '0' : '') + (now.getDate() + item.sd_day - 1);
                            
                            events.push({
                            	url:item.sd_num,
                                title: item.sd_code + ' 관광지 이름',
                                start: now.getFullYear() + '-' + nowMonth + '-' + (nowDate) + 'T' + item.sd_starttime,
                                end: now.getFullYear() + '-' + nowMonth + '-' + (nowDate) + 'T' + item.sd_endtime
                            });
                        });
                        callback(events);
                    }
                });
            }
        });
    }
    
    setCalendar();
});
</script>
<div class="container">
<div style="float: left; width: 30%">
		<div id='external-events'>
			<h4>즐겨찾기한 장소</h4>
				<!-- 반복문 -->
				<c:forEach var="fav" items="${list}">
				<div class='fc-event'>${fav.f_num}|<c:if test="${fav.f_category == 1}">장소</c:if><c:if test="${fav.f_category == 2}">일정</c:if><c:if test="${fav.f_category == 3}">회원</c:if>|${fav.f_code}</div>
				</c:forEach>			
			
			<!-- <div class='fc-event'>My Event 1</div>
			<div class='fc-event'>My Event 2</div>
			<div class='fc-event'>My Event 3</div>
			<div class='fc-event'>My Event 4</div>
			<div class='fc-event'>My Event 5</div> -->
			<!-- 체크박스 체크하면 드래그한 후 리스트에서 삭제
				<p>
				<input type='checkbox' id='drop-remove' />
				<label for='drop-remove'>remove after drop</label>
			</p> -->
		</div>
</div>
<div style="float: right; width: 70%">
	<div class="row">
		<div class="cal-body" style="padding: 20px;">
			<div id="calendar"></div>
		</div>
		<div style="text-align: center; padding: 10px;">
	    	<input type="button" value="일정완성" class="btn btn-default" name="finish" id="finish" onclick="location.href='finish.do'">
	    	<input type="button" value="임시저장" class="btn btn-default" name="temp" id="temp" onclick="">
	    </div>
	</div>
</div>


</div>
