<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/share.js"></script>
<script type="text/javascript">
	var result = '${result}';
	if(result == 'success'){
		alert('처리가 완료되었습니다.');
	}
</script>
<!-- 중앙 컨텐츠 시작 -->	
<div class="container">
	<div class="row">
		<h1>공유하기 게시판 목록</h1>
		<form action="list.do" id="search_form" method="get">
			<ul class="search">
				<li>
					<select name="keyfield">
						<option value="title">제목</option>
						<option value="email">이메일</option>
						<option value="content">내용</option>
						<option value="all">전체</option>
					</select>				
				</li>
				<li>
					<input type="text" name="keyword" id="keyword">
				</li>
				<li>
					<input type="submit" value="찾기">
					<input type="button" value="목록" onclick="location.href='list.do'">
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
					<th>아이디</th>	
					<th>등록날짜</th>
				</tr>
				<c:forEach var="share" items="${list}">
				<tr>
					<td>${share.num}</td>
					<td><a href="detail.do?num=${share.num}">${share.title}(${share.re_cnt})</a></td>
					<td>${share.email}</td>
					<td>${share.reg_date}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		</c:if>
		<div>
			<c:if test="${empty user_email}">
			로그인 하셔야 글쓰기가 가능합니다.
			</c:if>
			<c:if test="${!empty user_email}">
				<input type="button" value="글쓰기" onclick="location.href='write.do'">
			</c:if>
		</div>
		<div class="align-center">${pagingHtml}</div>
	</div>
</div>
<!-- 중앙 컨텐츠 끝 -->	
