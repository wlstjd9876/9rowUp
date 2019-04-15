<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);

.hn {
	font-family: 'Hanna', sans-serif;
}

h1 {
	text-align: center;
}

#content {
	width: 600px;
	height: 300px;
	background-color: white;
	margin-left: 285px;
	border: 1px solid;
}

#img {
	text-align: center;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/gowith/gowithRegister.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/gowith/gowitRegister.css">
<br>

<div class="container">
	<div>
		<h1 class="hn">
			<b>동행 정보를 입력해주세요!</b>
		</h1>
	</div>
	<br>
	<div id="img" class="hn">
		<img src="${pageContext.request.contextPath}/resources/img/team2.png" width="100">
	</div>
	<br><br>
	<div id="content">상세일정 가져올 거에요~</div>
	<br>
	<div id="img" class="hn">
		<div>
			<button type="button" class="btn btn-default btn-lg" value="일정가져오기">나의 일정 가져오기!</button>
		</div>
	</div>
	<br> <br>
	<div class="col-sm-4 col-md-offset-4">
		<form:form commandName="command" action="gowithRegister.do" id="registerform" enctype="multipart/form-data">
				<form:hidden path="email"/>
			<div class="form-group">
				<label for="go_num"></label>
				<form:input path="go_num" type="hidden"/>
			</div>
			<div class="form-group">
				<label for="go_member" class="hn">모집 인원</label>
				<form:input path="go_member" type="number" class="form-control hn"
					min="1" max="9" placeholder="모집인원을 입력하세요!" />
			</div>

			<div class="form-group hn">
				<label for="go_age">모집 연령대</label>
				<form:select path="go_age" class="form-control hn">
					<form:option value="연령대를 선택하세요!"/>
					<form:option value="10대만"/>
					<form:option value="20대만"/>
					<form:option value="30대만"/>
					<form:option value="연령무관"/>
				</form:select>
			</div>
			<div class="form-group hn">
				<label for="go_age">모집 성별</label>
				<form:select path="go_gen" class="form-control hn">
					<form:option value="성별을 선택하세요!"/>
					<form:option value="여자만"/>
					<form:option value="남자만"/>
					<form:option value="성별무관"/>
				</form:select>
			</div>
			<div class="form-group hn">
				<label for="go_type" class="hn">여행 타입</label> 
				<form:select path="go_type" class="form-control hn">
					<form:option value="여행타입을 선택하세요!"/>
					<form:option value="힐링여행"/>
					<form:option value="먹방여행"/>
					<form:option value="레저여행"/>
					<form:option value="가성비여행"/>
					<form:option value="출사여행"/>
					<form:option value="자유여행"/>
				</form:select>
			</div>
			<div class="form-group hn">
				<label for="go_area">여행지</label> 
				<form:input maxlength="10" path="go_area" type="text" class="form-control hn" placeholder="여행지를 10자 이내로 입력하세요!" autocomplete="false"/>
			</div>
													
			<div class="form-group hn">
				<label for="go_startdate">여행 출발일</label> 
				<form:input path="go_startdate" type="date" class="form-control hn"/>
			</div>
			<div class="form-group hn">
				<label for="go_enddate">여행 도착일</label> 
				<form:input path="go_enddate" type="date" class="form-control hn"/>
			</div>
			<div class="form-group hn">
				<label for="go_deadline">신청 마감일</label> 
				<form:input path="go_deadline" type="date" class="form-control hn"/>
			</div>
			<div class="form-group hn">
				<label for="go_photofile1">등록자 사진1</label> 
				<input name="go_photofile1" id="go_photofile1" type="file" class="form-control hn"/>
			</div>
			<div class="form-group hn">
				<label for="go_photofile2">등록자 사진2</label> 
				<input name="go_photofile2" id="go_photofile2" type="file" class="form-control hn"/>
			</div>
			<div class="form-group hn">
				<label for="go_photofile3">등록자 사진3</label> 
				<input name="go_photofile3" id="go_photofile3" type="file" class="form-control hn"/>
			</div>
			<div class="form-group hn">
				<label for="go_photofile4">등록자 사진4</label> 
				<input name="go_photofile4" id="go_photofile4" type="file" class="form-control hn"/>
			</div>
			<div class="form-group hn">
				<label for="go_say">※&nbsp;당부의 말</label>
				<form:textarea path="go_say" style="width:100%;" rows="7"/>
			</div>
			<br>
			<br>
			<div class="form-group text-center">
				<button type="submit" class="btn btn-primary-lg hn">동행등록</button>
				&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-warning-lg hn"
					onclick="location.href='${pageContext.request.contextPath}/gowith/gowithList.do'">목록으로</button>
			</div>
		</form:form>
	</div>
</div>


