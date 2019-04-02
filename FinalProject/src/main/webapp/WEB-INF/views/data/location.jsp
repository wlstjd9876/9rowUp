<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h3{color:blue;
	font-family: sans-serif;
	}
	h4{
	font-family: sans-serif;
	color: black;
	}
	
	.left-box {
 
  float: left;
  width: 58%;
}
.right-box {

  float: right;
  width: 40%;
}
	
</style>
 <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script> 
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=073c048326b3580b4c7257b8e804ee6b"></script>
<!-- public.js ->관관지 정보를 불러오는 js 입니다. -->
<%-- <script src="${pageContext.request.contextPath}/resources/js/public.js"></script> --%>
</head>
<body>
<!-- 
<form action="publicData.do" method="get">
<input type="submit" value="데이터보기"/> 
</form> -->
<!-- 왼쪽에 보여지는 창  -->
<div class='left-box'>
<div id='map' style=" margin-top:40px; margin-left:40px; width:100%;height:600px; z-index: 1;">
<!-- 맵 여기에 넣음 -->
<script src="${pageContext.request.contextPath}/resources/js/map.js"></script>
</div>
<div style="z-index: 2;">

</div>
</div>
<!-- 오른쪽에 보여지는 창 -->
<div class='right-box'>
<div id='output' style="overflow:scroll; width:600px; height:600px; margin-top:40px; margin-left: 20px;"></div>
</div>
</body>
</html>