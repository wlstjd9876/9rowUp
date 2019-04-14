<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/advice/adviceDetail.js"></script>
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










<%-- 
<style>
	@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
	.hn{
		font-family: 'Hanna', sans-serif;
   	}
</style>
<div class="hn" style="padding: 60">

	<!-- 즐겨찾기한 장소 시작 -->
	<div class="col-lg-4" align="center" style="padding-right: 50;">
		<h3 style="background-color: #d1d2d3;" align="center">1일차</h3>
		<c:forEach var="advice" items="${list}">
			<div class="col-md-3">
				<div class="col-md-12">
					<div style="width: 250px; height: 300px; "></div>
				</div>
				<div class="col-md-12">
					<input type="button" value="상세일정보기" class="btn btn-default"  onclick="location.href='adviceDetail.do?adv_num=${advice.adv_num}'">
					<input type="button" value="삭제" class="btn btn-default" style="width: 50px; height: 34px;" onclick="location.href='${pageContext.request.contextPath}/advice/adviceDelete.do?adv_num=${advice.adv_num}'">
					<div class="col-md-12">
						<input type="hidden">${advice.adv_title}
					</div>
				</div>
			</div>
		</c:forEach>
		<br>
		<!-- 모달창 클릭 버튼 -->
		<div class="col-md-12" align="center">
			<button type="button" class="hn btn btn-info btn-sm" id="placeBtn">즐겨찾기한 장소 더보기</button>
		</div>
	</div>
	<!-- 즐겨찾기한 장소 끝 -->
	
	<!-- 즐겨찾기한 일정 시작 -->
	<div class="col-lg-4" align="center" style="padding-right: 50">
		<h3 style="background-color: #d1d2d3;" align="center">2일차</h3>
		<br>
		<c:forEach var="fav" items="${list}" begin="0" end="3">
		<div class="w3-card-4 w3-margin" align="center" style="width:90%">
			<div class="w3-container">
				<div style="width: 25%; height: 12%; float: left;">
					<img class="card-img-top" width="60" height="60" src="${pageContext.request.contextPath}/images/icon/boy.png" alt="장소 이미지">
				</div>
				<input type="hidden" name="adv_title" id="adv_title" value="${advice.adv_title}">${advice.adv_title}
				<div class="card-body" style="width: 75%; height: 12%; float: right;">
					<h5 align="left" class="card-title">일정 번호 : ${user_nickname}</h5>
					<p align="left" class="card-text">작성자 닉네임</p>
					<div align="right">
						<button class="btn btn-default btn-sm" onclick="location.href=''">일정 상세 보기</button>
						<button class="btn btn-primary btn-sm" onclick="location.href=''">내 일정에 추가</button>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
		<br>
		<!-- 모달창 클릭 버튼 -->
		<div align="center">
			<button type="button" class="hn btn btn-info btn-sm" >즐겨찾기한 일정 더보기</button>
		</div>
	</div>
	<!-- 즐겨찾기한 일정 끝 -->

	<!-- 즐겨찾기한 회원 시작 -->
	<div class="col-lg-4" align="center">
		<h3 style="background-color: #d1d2d3;" align="center">3일차</h3>
		<br>
			<input type="hidden" name="adv_title" id="adv_title" value="${advice.adv_title}">${advice.adv_title}
		<br>
		<!-- 모달창 클릭 버튼 -->
		<div align="center">
			<button type="button" class="hn btn btn-info btn-sm" id="memberBtn">즐겨찾기한 회원 더보기</button>
		</div>
	</div>
	<!-- 즐겨찾기한 회원 끝 -->
</div>   
<!-- 중앙 컨텐츠 끝 -->   
 --%>

<!-- 모달창 시작 -->

<%-- <!-- 장소 모달창 시작 -->
<div class="modal fade hn" id="placeModal" tabindex="-1" role="dialog" aria-labelledby="placeModalTitle" aria-hidden="true">
   <div class="modal-dialog" role="document">
   <div class="modal-content">
   <div class="modal-body" align="center">
      <img align="middle" src="${pageContext.request.contextPath}/images/placeholder.png">
      <h3 style="background-color: #d1d2d3;" align="center">즐겨찾기한 장소</h3>
      <br>
      
   <br>
   <div id="output1"></div>
   <hr>
   <c:forEach var="fav" items="${Paginglist1}">
   <div class="w3-card-4 w3-margin" align="center" style="width:90%">
   <div class="w3-container">
      <div style="width: 25%; height: 12%; float: left;">
      <img class="card-img-top" align="middle" src="#" alt="장소 이미지">
      </div>
      <div class="card-body" style="width: 75%; height: 12%; float: right;">
         <h5 align="left" class="card-title">장소 코드 : ${fav.f_code}</h5>
         <p align="left" class="card-text">주소</p>
         <div align="right"><button class="btn btn-primary btn-sm" onclick="location.href=''">내 일정에 추가</button></div>
      </div>
   </div>
   </div>
   </c:forEach>
   <br>
   <div class="align-center">${pagingHtml}</div>
   </div>
   
   <div class="modal-footer">
   <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
   </div>
    </div>
  </div>
</div>
<!-- 장소 모달창 끝 --> --%>

	<%-- <form id="re_form" action="/advice/replyWrite.do">
		<input type="hidden" name="adv_num" value="${advice.adv_num}" id="adv_num">
		<input type="hidden" name="email" value="${user_email}" id="user_email">
		<div align="center">
		<c:if test="${!empty user_email && user_email == advice.email}">
			<input type="button"  class="hn btn btn-info btn-sm" value="글수정" onclick="location.href='adviceModify.do?adv_num=${advice.adv_num}'">
			<input type="button"  class="hn btn btn-info btn-sm" value="글삭제" onclick="location.href='adviceDelete.do?adv_num=${advice.adv_num}'">
		</c:if>

		<c:if test="${empty user_email}">로그인 해야 작성할 수 있습니다.</c:if>
		<c:if test="${!empty user_email && user_email != advice.email}">
   		<input type="submit" class="hn btn btn-info btn-sm" id="writeReply" value="댓글쓰기">
   		</c:if>
		</div>
	</form>
	<ul class="paging_button"></ul>
	<div id="wrap"></div>
	<ul class="paging_button"></ul>
 --%>