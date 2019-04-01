//================== 서치 시작=====================//
$.fn.toggleState = function(b) {
	$(this).stop().animate({
		width : b ? "300px" : "50px"
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

function doChange(srcE, targetId){
	var val = srcE.options[srcE.selectedIndex].value;
	var targetE = document.getElementById(targetId);
	$.ajax({
		url : "/data/sigunguAjax.do",
		type: "post",
		dataType: "json",
		data : {val :val},
		success:function(data){	 

		},
		error:function(request,status,error){
			alert("uniteCommonAjax:request:"+request+"status:"+status+"error:"+error);
		}
	});	
	alert(val);
	removeAll(targetE);
	if(val == 'languages'){
		addOption('C++', targetE);
		addOption('Java', targetE);
		addOption('Scheme', targetE);
	}
	else if(val == 'tools'){
		addOption('Visual Studio', targetE);
		addOption('Netbeans', targetE);
		addOption('Eclipse', targetE);
	}
}

function addOption(value, e){
	var o = new Option(value);
	try{
		e.add(o);
	}catch(ee){
		e.add(o, null);
	}
}

function removeAll(e){
	for(var i = 0, limit = e.options.length; i < limit - 1; ++i){
		e.remove(1);
	}
}




//=================셀렉 끝======================//