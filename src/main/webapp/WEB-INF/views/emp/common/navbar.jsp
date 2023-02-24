<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="tags.jsp" %>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-3">
	<div class="container">
		<ul class="navbar-nav me-auto">
			<li class="nav-item"><a class="nav-link" ><strong>서비스 센터</strong></a></li>
		</ul>
		
		<sec:authorize access="isAuthenticated()">
			<span class="navbar-text"><strong class="text-white"><sec:authentication property="principal.name" /></strong>님 안녕하세요.</span>
		</sec:authorize>
		
		<sec:authorize access="hasAnyRole('ROLE_관리자', 'ROLE_사원', 'ROLE_대리')">
			<ul class="navbar-nav">
				<li class="nav-item"><a href="/emp/change-password" class="nav-link">비밀번호 변경</a>
				<li class="nav-item"><a href="/logout" class="nav-link">로그아웃</a>
			</ul>
		</sec:authorize>
	</div>
</nav>