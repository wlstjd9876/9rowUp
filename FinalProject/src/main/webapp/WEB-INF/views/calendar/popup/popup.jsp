<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<script>
window.opener.document.getElementById("sd_num").value=document.getElementById("sd_num").value;
</script>
<!-- 중앙 컨텐츠 시작 -->
<div class="container">
	<div class="row">
		<h1>메모,예산</h1>
		<form:form commandName="scheduleDetailCommand" action="popup.do" id="popup_form">
			<form:errors element="div" cssClass="error-color"/>
			<ul>
				<li>
					<input type="hidden" id="sd_num" value="1">
				</li>
				<li>
					<label for="sd_code">관광지 코드</label>
					<input type="text" name="sd_code" id="sd_code">
				</li>			
				<li>
					<label for="sd_memo">일정 메모</label>
					<textarea rows="5" cols="30" name="sd_memo" id="sd_memo" style="resize: none;" readonly="readonly">값 넣기관광지 코드${scheduleDetailCommand.sd_code}</textarea>
				</li>
				<li>
					<label for="sd_money">여행 경비</label>
					<input type="number" name="sd_money" id="sd_money" min="0">원
				</li>	
			</ul>
			<div class="align-center">
				<input type="submit" value="전송">
				<input type="button" value="목록" onclick="location.href='main.do'">
			</div>
		</form:form>
	</div>	
</div>