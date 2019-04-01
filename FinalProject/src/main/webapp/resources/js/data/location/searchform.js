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