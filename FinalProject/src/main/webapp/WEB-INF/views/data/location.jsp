<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h3{color:blue;}
</style>
 <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script> 

<script>
	$.ajax({        
	      url: 'publicData.do',
	      type: 'get',
	      dataType: 'json',
	      success: function(data){
	    	  console.log(data);
// 	          console.log(data.response.body.items.item);
	          var myItem = data.response.body.items.item;
	           
	          for(var i=0; myItem.length; i++){
	              var output = '';
	              console.log(myItem.length);
/* 	              output += '<h3>'+ i+'번째 ' + '여행지정보' +'</h3>'; */
 	              output += '<h3>'+myItem[i].title+'</h3>';
	              output += '<h4>'+myItem[i].addr1+'</h4>';
	              output += '<img src="' + myItem[i].firstimage + '" style="width: 300px; height: 300px;">';
	              output += '<br>';
	              output += '위도 : ' +'<h4>'+myItem[i].mapy+'</h4>';
	              output += '경도 : ' +'<h4>'+myItem[i].mapx+'</h4>';
	              output += '<input type="button" value="일정추가"  onclick="location.href=\'#\'" />';
	             document.span.innerHTML += output; 
	             /*  $('#output').append(output); */
	          }
	          
	      },
    	error: function(XMLHttpRequest, textStatus, errorThrown) { 
        	alert("Status: " + textStatus); alert("Error: " + errorThrown); 
    	}  
});
	
</script>
</head>
<body>
<form action="publicData.do" method="get">
<input type="submit" value="데이터보기"/> 
<div id="output"></div>
</form>
</body>
</html>