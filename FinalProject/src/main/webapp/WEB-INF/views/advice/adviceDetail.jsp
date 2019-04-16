<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/advice/adviceDetail.js"></script>
<!-- 중앙 컨텐츠 시작 -->
<div class="container">
	<div class="row">
		<h2>${advice.adv_title}</h2>
		<input type="hidden" name="adv_num" class="adv_num" value="${advice.adv_num}">
		<div class="form-group">
			<label>여행기간</label>
			${advice.startdate} ~ ${advice.enddate}
		</div>
		<div class="form-group">
			<!-- 일정 상세 목록 출력 -->
			<div class="adv_detail"></div>
		</div>
		<!-- 버튼 -->
		<div class="form-group" style="text-align: center;">
			<c:if test="${!empty user_email && user_email == advice.email}">
				<input type="button" value="글수정" class="btn btn-default" id="adviceUpdate" name="adviceUpdate" onclick="location.href='adviceModify.do?adv_num=${advice.adv_num}'">
				<input type="button" value="글삭제" class="btn btn-default" id="adviceDelete" name="adviceDelete" onclick="location.href='adviceDelete.do?adv_num=${advice.adv_num}'">
			</c:if>
			<c:if test="${!empty user_email && user_email != advice.email}">
   				<input type="button" class="btn btn-default" id="writeReply" value="댓글쓰기">
   			</c:if>
		</div>
		
		<!-- 댓글 -->
		
		
	</div>
</div>
<!-- 중앙 컨텐츠 끝 -->