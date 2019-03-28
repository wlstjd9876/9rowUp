<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/resources/js/fullcalendar.css' />
<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/resources/js/fullcalendar.min.css' />
<script type='text/javascript' src='${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/resources/js/lib/moment.min.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/resources/js/fullcalendar.min.js'></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/locale/ko.js"></script>
<script> 
$(document).ready(function() { 
	$('#calendar').fullCalendar({ 
		header: { left: 'prev,next today', 
		center: 'title', 
		right: 'month,basicWeek,basicDay' 
		}, 
		
		defaultDate: new Date(), 
		navLinks: true, 
		editable: false, 

	}); 
}); 

</script> 
<style> 
	body { 
		margin: 40px 10px; 
		padding: 0; 
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif; 
		font-size: 14px; 
	} 
	#calendar { 
		max-width: 900px; 
		margin: 0 auto; 
	} 
</style>


</head>
<body>
<div id="calendar" style="height:800px;"></div>
</body>
</html>