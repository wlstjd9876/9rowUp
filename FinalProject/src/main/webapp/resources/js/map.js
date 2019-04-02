
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var marker = new daum.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
//지도에 클릭 이벤트를 등록합니다
//지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
 
 // 클릭한 위도, 경도 정보를 가져옵니다 
 var latlng = mouseEvent.latLng;
 
 var lat = latlng.getLat();
 var lon = latlng.getLng();
 marker.setPosition(latlng);
 alert("lat : " +lat + " and  lon : " +lon);
 
	$.ajax({        
	      url: '../publicData',
	      data:{lat:lat,lon:lon},
	      type: 'get',
	      dataType: 'json',
	      cache:false,
	         timeout:30000,
	      success: function(data){
	    	  console.log(data);
//	          console.log(data.response.body.items.item);
	          var myItem = data.response.body.items.item;
	          $('#output').empty();
	     
	         if(myItem){
	        	    for(var i=0; i<myItem.length; i++){
	  	              var output = '';
	  	              console.log(myItem.length);
	  /* 	              output += '<h3>'+ i+'번째 ' + '여행지정보' +'</h3>'; */
	  	              output += '<div style="  border:3px solid white; width:80%;">';
	  	              output += '<img src="' + myItem[i].firstimage + '" style=" width: 99.9%; height: 300px;">';
	  	              output += '<h3>'+myItem[i].title+'</h3>';
	  	              output += '<h4>'+myItem[i].addr1+'</h4>';
	  	              output += '<input type="button" padding-left:100px; value="일정추가"  onclick="location.href=\'#\'" />';
	  	              output += '<br>';
	  	              output += '</div>';
	  	            /*  document.span.innerHTML += output;  */
	  	              $('#output').append(output); 
	  	              
	  	          }
	         }else{
	        	 alert('관광지 정보가 없습니다.');
	        	 
	         }	       
	      },
  	error: function(XMLHttpRequest, textStatus, errorThrown) { 
      	alert("Status: " + textStatus +" and "+ "Error: " + errorThrown); 
  	}  
});
});




// ======================================================마커이미지 표시

var imageSrc = '../resources/img/yap2.png', // 마커이미지의 주소입니다  
			
    imageSize = new daum.maps.Size(34, 39), // 마커이미지의 크기입니다
    imageOption = {offset: new daum.maps.Point(10, 40)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
    markerPosition = new daum.maps.LatLng(33.452278, 126.567803); // 마커가 표시될 위치입니다

// 마커를 생성합니다
var marker = new daum.maps.Marker({
    position:map.getCenter() , 
    image: markerImage // 마커이미지 설정 
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);  
 