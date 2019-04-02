//================== 서치 시작=====================//
$.fn.toggleState = function(b) {
	$(this).stop().animate({
		width : b ? "494px" : "50px"
	}, 600, "easeOutElastic");
};

$(document).ready(function() {
	var container = $(".container");
	var boxContainer = $(".search-box-container");
	var submit = $(".submit");
	var searchBox = $(".search-box");
	var response = $(".response");
	var isOpen = false;
	submit.on("mousedown", function(e) {
		e.preventDefault();
		boxContainer.toggleState(!isOpen);
		isOpen = !isOpen;
		if (!isOpen) {
			handleRequest();
		} else {
			searchBox.focus();
		}
	});
	searchBox.keypress(function(e) {
		if (e.which === 13) {
			boxContainer.toggleState(false);
			isOpen = false;
			handleRequest();
		}
	});
	searchBox.blur(function() {
		boxContainer.toggleState(false);
		isOpen = false;
	});
	function handleRequest() {
		// You could do an ajax request here...
		var value = searchBox.val();
		searchBox.val("");
		if (value.length > 0) {
			response.text('Searching for "' + value + '" . . .');
			response.animate({
				opacity : 1
			}, 300).delay(2000).animate({
				opacity : 0
			}, 300);
			//=================검색 시작====================//
			var target = document.getElementById("areacode");
			var target2 = document.getElementById("sigungucode");
			$.ajax({        
				url: contextPath+'/searchAjax',
				data:{areaCode:target.options[target.selectedIndex].value, sigunguCode:target.options[target.selectedIndex].value, keyword:value},
				type: 'get',
				dataType: 'json',
				cache:false,
				timeout:30000,
				success: function(data){
					console.log(data);
					var myItem = data.response.body.items.item;
					$('#output').empty();
					var output = '';
					output += '<div class="row align-center">';
					if(myItem!=undefined){
						for(var i=0; i<myItem.length; i++){
							if(myItem[i].firstimage==undefined)
								var image = contextPath+"/resources/img/data/No_Image_Available.jpg";
							else
								var image = myItem[i].firstimage;
							console.log(myItem.length);
							output += '<div class="col-sm-6 col-md-3 align-center padd-both">';
							output += '	<div class="thumbnail">';
							output += '		<img src="' + image + '" style="width: 100%; height: 300px;">';
							output += '			<div class="caption">';
							output += '				<h3 class="hn">'+myItem[i].title+'</h3>';
							output += '				<h4 class="hn">'+myItem[i].addr1+'</h4>';
							output += '				<p><a href="#" class="btn btn-primary hn">자세히 보기</a></p>';
							output += '			</div>';
							output += '	</div>';
							output += '</div>';
						}

					}else{
							output += '<h3 class="hn">검색 결과가 없습니다!</h3>';
					}
					output += '</div>';
					$('#output').append(output); 
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) { 
					alert("Status: " + textStatus +"and "+ "Error: " + errorThrown); 
				}  
			});
			//=================검색 끝=====================//
		}

	}

});
//================== 서치 끝 ======================//
//==================셀렉 시작======================//

function doChange(srcE){
	var val = srcE.options[srcE.selectedIndex].value;
	$.ajax({
		url : "sigunguAjax.do",
		type: "post",
		dataType: "json",
		data : {val :val},
		success:function(data){
			$("#sigungucode").find("option").remove().end().append("<option value=''>시군구</option>");
			$(data.list).each(function(index, result){
				$("#sigungucode").append("<option value='"+(index+1)+"'>"+result+"</option>");
			});
		},
		error:function(request,status,error){
			alert("uniteCommonAjax:request:"+request+"status:"+status+"error:"+error);
		}
	});	
}
//=================셀렉 끝======================//