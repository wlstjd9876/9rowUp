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

.article_div{
	width:80%;
	text-align:center;
	margin:0 auto;
}

#substance{
	height: 300px;
	border:1px solid #CCC;
	text-align:left;
	padding:10px;
}
div#reply_div{
	padding:5px 10px 40px 10px;
	margin-top:10px;
	background-color:#eeeeee;
	height:150px;
	

}
div#re_first{
	float:left;
	width:79%;
	margin-bottom:10px;
	text-align:left;
}

div#re_second{
	float:left;
	width:20%;
	margin-bottom:10px;
}
span.letter-count{
	font-size:10pt;
	color:#999;
}
.align-right{
	text-align:right;
}

form#re_form{
	width:650px;
	margin:0 auto;
}
textarea.rep-content{
	width:97%;
	height:50px;
	margin:10px 10px;
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
<br>
<div class="container">
    <div class="article_div">
	<br>
	<h2 class="hn" align="center">${share.title}</h2>	 
	<br>
	<!-- 캐러셀 시작 -->
	<div class="image hn col-lg-12">
         <div class="w3-content" align="center" style="width: 500px; height: 450px; background-color: white;">
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
            </div><br>
         </div>
    </div>
     <!-- 캐러셀 끝 --> 
    <br>
	 <div class="hn" align="right" style="margin-right: 20px; marbackground-color: yellow;">작성자 : ${share.td_nickname}</div><br>
     
	 <!--(수정, 삭제, 목록 )버튼 시작 -->
	 <div align="right">
         <c:if test="${!empty user_email && user_email == share.email}">
         <input type="button" class="btn btn-primary btn-sm hn" value="수정" onclick="location.href='update.do?num=${share.num}'"> <!-- get방식으로 primary key를 넘김 -->
         <input type="button" class="btn btn-danger btn-sm hn" value="삭제" onclick="location.href='delete.do?num=${share.num}'">
         </c:if>
         <input type="button" class="btn btn-primary btn-sm hn" value="목록" onclick="location.href='list.do'">
      </div>
      <!-- 수정, 삭제, 목록 버튼 끝 -->    
 
	 
	    <!-- 내용시작 -->
      	 	<div id="substance" class="col-lg-12" align="center" style="margin-top: 20px;">
      	 		상세일정가져올거에요~  
      	 	</div>  
        <!-- 내용 끝 -->
        <!-- 내용시작 -->
      	 	<div id="substance" class="col-lg-12" align="center" style="margin-top: 20px;">
      	 		${share.content}
      	 	</div>    
        <!-- 내용 끝 -->
 <div class="row">      	
	
	<!-- 댓글 시작 -->
       <div align="center" class="col-lg-12" >
         <div id=reply_div>
         <form id="re_form" action="writeReply.do">
         	<input type="hidden" name="num" value="${share.num}" id="num">
            <input type="hidden" name="email" value="${user_email}" id="user_email">
            <textarea rows="3" cols="60" name="sr_content" id="sr_content" class="rep-content"><c:if test="${empty user_email}">로그인해야 작성할 수 있습니다.</c:if></textarea>
         		<c:if test="${!empty user_email}">
           			<div id="re_first">
             		  <span class="letter-count">300/300</span>
            	    </div>
           			 <div id="re_second" class="align-right">
              		 	<input class="btn btn-primary btn-sm hn" type="submit" value="등록">
            		</div>
            	</c:if>
           
         </form>
      </div>
      
      <!-- 댓글 목록 출력 -->
      <div id="output"></div>
      <!-- 댓글 목록 출력 끝 -->
		
     <!-- 페이징 -->
      <div class="paging-button" style="display: none;">
         <input type="button" value="다음글 보기">
      </div>
     <!-- 페이징끝 -->  
     
     
     
	   </div>   
</div>
	<!-- 중앙 컨텐츠 끝 -->
	</div>
</div>
