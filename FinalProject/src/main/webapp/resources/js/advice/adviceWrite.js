$(document).ready(function(){
	//동행등록 유효성 체크
	var form = document.getElementById('registerform');
	form.onsubmit=function(){
		var today = new Date();
		var start = new Date(startdate.value);
		var end = new Date(enddate.value);
      
		if(today>start){
			alert("출발일은 오늘이후여야 합니다!");
			return false;
		}

		if(start>end){
			alert("출발일 도착일을 확인해주세요!");
			return false;
		}
	};
	
	//일정 상세 폼 생성
	$(document).on('click','.makePlan',function(){
		//날짜 value 가져오기
		var startdate_val = $('#startdate').val();
		var enddate_val = $('#enddate').val();

		//날짜를 -로 나누기
		var startdate_split = startdate_val.split('-');
		var enddate_split = enddate_val.split('-');
		
		//날짜셋팅
		var startdate = new Date(startdate_split[0], Number(startdate_split[1]-1), startdate_split[2]);
		var enddate = new Date(enddate_split[0], Number(enddate_split[1]-1), enddate_split[2]);
		
		//0부터 시작
		var between_date = (enddate.getTime() - startdate.getTime())/1000/60/60/24;
		
		//*********************************************날짜 선택 안했을 때 alert창 띄우기
		/*alert(startdate_val);
		alert(enddate_val);
		if($('#startdate').val() == null){
			alert('시작 날짜를 선택해주세요.');
			return false;
		}else if($('.enddate').val() == null){
			alert('종료 날짜를 선택해주세요.');
			alert(enddate_val);
			return false;
		}*/
		
		//글 번호
		//일정 상세테이블 폼
		var detailUI =  '<div class="form-group">';
			detailUI += '	<div class="form-group">';
			
		for(var i=0; i<=between_date; i++){
			detailUI += '		<h2>' + (i+1) + '일차</h2>';
			detailUI += '	</div>';
			detailUI += '	<div class="form-group">';
			detailUI += '		<div id="addPlan' + i + '">Ajax사용부분</div>';
			detailUI += '	</div>';
			detailUI += '	<div class="form-group">';
			detailUI += '		<input type="button" value="즐겨찾기 추가" class="btn btn-default" onclick="location.href=\'adviceList.do\'">';
		}
			
			detailUI += '	</div>';
			detailUI += '</div>';
		   
			$('.adv_Plan').append(detailUI);
			
			$(this).hide();
			$('.deletePlan').show();
	});
	
	//일정 상세 폼 삭제
	$(document).on('click','.deletePlan',function(){
		$('.adv_Plan').empty();
		
		$(this).hide();
		$('.makePlan').show();
	});
	
	
	
});