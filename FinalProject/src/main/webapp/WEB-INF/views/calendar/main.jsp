<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/js/fullcalendar.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/js/fullcalendar.min.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/lib/moment.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/fullcalendar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/locale/ko.js"></script>
<script>  
$(document).ready(function() {
    var addDay = 1;
    
    function setCalendar(){
        $('#calendar').fullCalendar({
            defaultView: 'agendaChangeDay',
            
            header: {
                left: 'prev,next today', 
                center: 'title', 
                right: 'month,agendaChangeDay registerBtn,addDayBtn,oddDayBtn'
            },
            
            eventClick: function(eventObj) {
                window.open('${pageContext.request.contextPath}/popup/popup.do?sd_num=${sd_num}', '일정 상세페이지', 'width=400, height=300, left=100, top=50');
            },
            
            views:{
                agendaChangeDay:{
                    type:'agenda',
                    duration: {days: addDay}
                }
            },
            
            customButtons: {
                registerBtn:{
                    text: '일정등록',
                    click: function(url) {
                        location.href = '${pageContext.request.contextPath}/main/writeDetail.do';
                    }
                },
                addDayBtn:{
                    text: '일 추가',
                    click: function(url) {
                        addDay++;
                        $('body').empty().append('<div id="calendar"></div>');
                        setCalendar();
                    }
                },
                oddDayBtn:{
                    text: '일 삭제',
                    click: function(url) {
                        if(addDay == 1){
                            //타임테이블이 1일 이하일 때는 더 이상 일정 빼기 불가능
                            return false;
                        }else{
                            addDay--;
                            $('body').empty().append('<div id="calendar"></div>');
                            setCalendar();
                        }
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
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
        font-size: 14px;
    }
    #calendar {
        max-width: 900px;
        margin: 40px auto;
        padding: 0 10px;
        height:600px;
    }
</style>
</head>
<body>
<div id="calendar"></div>
<div>
    <input type="button" value="일정상세등록" name="registerDetail" id="registerDetail" onclick="location.href='write.do'">
</div>
</body>
</html>