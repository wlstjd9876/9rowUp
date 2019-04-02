<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board.js"></script>
<script type="text/javascript">
	var result = '${result}';
	if(result == 'success'){
		alert('처리가 완료되었습니다.');
	}
</script>
<!-- 중앙 컨텐츠 시작 -->	
<div class="container">
	<div class="row">
		<h1>조언 목록</h1>
		<form action="adviceList.do" id="search_form" method="get">
			<ul class="search">
				<li>
					<select name="keyfield">
						<option value="adv_title">제목</option>
						<option value="email">이메일</option>
						<option value="all">전체</option>
					</select>				
				</li>
				<li>
					<input type="text" name="keyword" id="keyword">
				</li>
				<li>
					<input type="submit" value="찾기" class="btn btn-default">
				</li>
			</ul>
		</form>
		
		<c:if test="${count == 0}">
		<div class="align-center">등록된 게시물이 없습니다.</div>
		</c:if>
		<c:if test="${count > 0}">
		 <div class="table-responsive">
			<table class="table table-striped">
				<tr>
					<th>번호</th>
					<th width="400">제목</th>
					<th>이메일</th>
					<th>등록날짜</th>
					<th>추천S수</th>
				</tr>
				<c:forEach var="advice" items="${list}">
				<tr>
					<td>${advice.adv_num}</td>
					<td><a href="adviceDetail.do?num=${advice.adv_num}">${board.title}(${board.re_cnt})</a></td>
					<td>${advice.email}</td>
					<td>${advice.adv_date}</td>
					<td>${advice.adv_like}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		</c:if>
			<div class="align-center">
				<c:if test="${!empty user_email}">
					<input type="button" value="글쓰기" class="btn btn-default" onclick="location.href='write.do'">
				</c:if>
			</div>
		<div class="align-center">${pagingHtml}</div>
		
	</div>
</div>
<!-- 중앙 컨텐츠 끝 -->	
