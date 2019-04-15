<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/share/share.reply.js"></script>









<!-- ============================================================================================================================================== -->
<!-- 중앙 컨텐츠 시작 -->
<div class="container">
	 <div class="row">
      <h1>${share.title}</h1>  
      <ul>
         <li>번호 : ${share.num}</li>
         <li>작성자 : ${share.email}</li>
         <li>등록일 : ${share.reg_date}</li>
      </ul>
      <hr size="1" width="100%">
	
	<div id="img" class="hn"></div>
		<div class="container">		
		<!--사진 시작-->
		 <c:if test="${!empty share.thumb || !empty share.photo2 || !empty share.photo3}">
			<div id="content2">
				<h2 class="hn">&nbsp;&nbsp;여행 사진이에요!</h2>
				<div class="border"></div>
				<div class="col-md-3 col-sm-6">
					<div class="dishes-item-container">
					    <c:if test="${!empty share.thumb}">
						<div class="img-frame">
							<img id="imageFile1" src="imageView1.do?num=${share.num}&photo_type=1" class="img-responsive" alt="" />
							<div class="img-frame-hover"></div>
						</div>
						</c:if>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="dishes-item-container">
					    <c:if test="${!empty share.photo2}">
						<div class="img-frame">
							<img id="imageFile1" src="imageView1.do?num=${share.num}&photo_type=2" class="img-responsive" alt="" />
							<div class="img-frame-hover"></div>
						</div>
						</c:if>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="dishes-item-container">
					    <c:if test="${!empty share.photo3}">
						<div class="img-frame">
							<img id="imageFile1" src="imageView1.do?num=${share.num}&photo_type=3" class="img-responsive" alt="" />
							<div class="img-frame-hover"></div>
						</div>
						</c:if>
					</div>
				</div>
				<br> <br> <br> <br>
			</div>
			</c:if>
			<!--사진끝 -->
			</div>
      <p>
         ${share.content}
      </p>
      <hr size="1" width="100%">
      <div class="align-right">
         <c:if test="${!empty user_email && user_email == share.email}">
         <input type="button" value="수정" onclick="location.href='update.do?num=${share.num}'"> <!-- get방식으로 primary key를 넘김 -->
         <input type="button" value="삭제" onclick="location.href='delete.do?num=${share.num}'">
         </c:if>
         <input type="button" value="목록" onclick="location.href='list.do'">
      </div>
      
      <div id="reply_div">
         <span class="reply-title">댓글 달기</span>
         <form id="sr_form" action="/share/writeReply.do">
            <input type="hidden" name="num" value="${share.num}" id="num">
            <input type="hidden" name="email" value="${user_email}" id="user_email">
            <textarea rows="3" cols="50" name="sr_content" id="sr_content" class="rep-content"
            <c:if test="${empty user_email}">disabled="disabled"</c:if>            
            ><c:if test="${empty user_email}">로그인해야 작성할 수 있습니다.</c:if></textarea>
            <c:if test="${!empty user_email}">
            <div id="sr_first">
               <span class="letter-count">300/300</span>
            </div>
            <div id="sr_second" class="align-right">
               <input type="submit" value="전송">
            </div>
            </c:if>
         </form>
      </div>
      <!-- 댓글 목록 출력 -->
      <div id="output"></div>
      <div class="paging-button" style="display: none;">
         <input type="button" value="다음글 보기">
      </div>
      
      </div>
   </div>
<!-- 중앙 컨텐츠 끝 -->