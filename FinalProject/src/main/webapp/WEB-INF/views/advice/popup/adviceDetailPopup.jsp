<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script>
	window.opener.document.getElementById("adv_num").value=document.getElementById("adv_num").value;
	
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/advice/advice.reply2.js"></script>    
<h4> ${command.email}님께서 일정을 생성해주셨습니다. </h4>
<div class="sub-item">';
			<div class="col-md-10 col-md-offset-1" style="padding: 10px;">
				<div class="row">
					<label for="ar_comment" class="col-md-4">글 내용</label>
					${command.ar_comment}
				</div>
				<div class="row">
					<label for="startdate" class="col-md-4">출발 날짜</label>
           			<div class="col-md-8">
               			${command.startdate}
           			</div>
            	</div>
            	<div class="row">
					<label for="enddate" class="col-md-4">종료 날짜</label>
					<div class="col-md-8">
						${command.enddate}
					</div>
				</div>
			</div>

<input type="button" value="수정" onclick="location.href='adviceModify.do?ar_num=${command.ar_num}'" class="btn btn-default">
<input type="button" value="삭제" onclick="location.href='adviceDelete.do?ar_num=${command.ar_num}'" class="btn btn-default">

</div>
<div id="output">
</div>
