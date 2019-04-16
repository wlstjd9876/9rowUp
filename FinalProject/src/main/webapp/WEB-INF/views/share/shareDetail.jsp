<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/share/share.reply.js"></script>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);

.hn {
	font-family: 'Hanna', sans-serif;
}
</style>
<script>
function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" w3-opacity-off", "");
  }
  x[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " w3-opacity-off";
}
</script>
<!-- ============================================================================================================================================== -->
<!-- 중앙 컨텐츠 시작 -->
<div class="container">
	<br>
	<h2 class="hn" align="center">${share.title}</h2>	
	<!-- 캐러셀 시작 -->
	<div class="image hn col-lg-12">
         <div class="w3-content" align="center" style="width: 500px; height: 350px;">
         <br>
            <img class="mySlides" width="450px" height="300px"
               id="imageFile1" src="imageView1.do?num=${share.num}&photo_type=1" style="display: block;">
               <c:if test="${share.photo2!=null}">
               <img class="mySlides" width="450px" height="300px"
               id="imageFile1" src="imageView1.do?num=${share.num}&photo_type=2" style="display: none;">
               </c:if>
               <c:if test="${share.photo2==null}">
               <img class="mySlides" width="450px" height="300px" 
               src="${pageContext.request.contextPath}/resources/img/noimage.png" style="display: none;">
               </c:if>
               <c:if test="${share.photo3!=null}">
               <img class="mySlides" width="450px" height="300px" 
               id="imageFile1" src="imageView1.do?num=${share.num}&photo_type=3" style="display: none;">
               </c:if>
               <c:if test="${share.photo3==null}">
               <img class="mySlides" width="450px" height="300px"
               src="${pageContext.request.contextPath}/resources/img/noimage.png" style="display: none;">
               </c:if>
               
            <div class="w3-row-padding w3-section">
               <div class="w3-col s4">
                  <img class="demo w3-opacity w3-hover-opacity-off" width="120px" height="80px"
                     id="imageFile1" src="imageView1.do?num=${share.num}&photo_type=1" style="cursor: pointer; align-items: center;" align="middle"
                     onclick="currentDiv(1)">
               </div>
               <div class="w3-col s4">
                  <c:if test="${share.photo2==null}">
                  <img class="demo w3-opacity w3-hover-opacity-off" width="120px" height="80px"
                     src="${pageContext.request.contextPath}/resources/img/noimage.png" style="cursor: pointer; align-items: center;" align="middle"
                     onclick="currentDiv(2)">
                  </c:if>
                  <c:if test="${share.photo2!=null}">
                  <img class="demo w3-opacity w3-hover-opacity-off" width="120px" height="80px"
                     id="imageFile1" src="imageView1.do?num=${share.num}&photo_type=2" style="cursor: pointer; align-items: center;" align="middle"
                     onclick="currentDiv(2)">
                  </c:if>
               </div>
               <div class="w3-col s4">
                  <c:if test="${share.photo3==null}">
                  <img class="demo w3-opacity w3-hover-opacity-off" width="120px" height="80px"
                     src="${pageContext.request.contextPath}/resources/img/noimage.png" style="cursor: pointer; align-items: center;" align="middle"
                     onclick="currentDiv(3)">
                  </c:if>
                  <c:if test="${share.photo3!=null}">
                  <img class="demo w3-opacity w3-hover-opacity-off" width="120px" height="80px"
                     id="imageFile1" src="imageView1.do?num=${share.num}&photo_type=3" style="cursor: pointer; align-items: center;" align="middle"
                     onclick="currentDiv(3)">
                  </c:if>
               </div>
            </div>
            <br><br>
         </div>
      </div>
	<!-- 캐러셀 끝 -->
	
	 <div class="row hn col-lg-12">
      <div>작성자 : ${share.td_nickname}</div>
      
      <div class="col-lg-12" align="center" style="margin-top: 20px;">
      <br><br><br><br>
         ${share.content}
      <br><br>
      </div>
      <div align="right">
         <c:if test="${!empty user_email && user_email == share.email}">
         <input type="button" value="수정" onclick="location.href='update.do?num=${share.num}'"> <!-- get방식으로 primary key를 넘김 -->
         <input type="button" value="삭제" onclick="location.href='delete.do?num=${share.num}'">
         </c:if>
         <input type="button" value="목록" onclick="location.href='list.do'">
      </div>
      
      <div align="center" class="col-lg-12">
         <div align="center" class="col-lg-12"><span class="reply-title">댓글 달기</span><br></div>
         <form id="sr_form" action="/share/writeReply.do">
         <div class="col-lg-7" align="right">
            <input type="hidden" name="num" value="${share.num}" id="num">
            <input type="hidden" name="email" value="${user_email}" id="user_email">
            <textarea rows="3" cols="50" name="sr_content" id="sr_content" class="rep-content"
            <c:if test="${empty user_email}">disabled="disabled"</c:if>            
            ><c:if test="${empty user_email}">로그인해야 작성할 수 있습니다.</c:if></textarea>
         </div>
            <div align="left" class="col-lg-5">
            <c:if test="${!empty user_email}">
            <div id="sr_first">
               <span class="letter-count">300/300</span>
            </div>
            <div id="sr_second" class="align-right">
               <input type="submit" value="전송">
            </div>
            </c:if>
            </div>
         </form>
      </div>
      
      <!-- 댓글 목록 출력 -->
      <div id="output"></div>
      <!-- 페이징 -->
      <div class="paging-button" style="display: none;">
         <input type="button" value="다음글 보기">
      </div>
      
   </div>
</div>
<!-- 중앙 컨텐츠 끝 -->