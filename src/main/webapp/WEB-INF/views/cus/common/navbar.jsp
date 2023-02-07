<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="tags.jsp" %>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-3">
	<div class="container">
		<ul class="navbar-nav me-auto">
			<li class="nav-item"><a href="/cus" class="nav-link ${menu eq 'home' ? 'active' : '' }" ><strong>서비스 센터</strong></a></li>
		</ul>
		<ul class="navbar-nav me-auto">
			<li class="nav-item"><a href="/repair/main" class="nav-link ${menu eq 'repair' ? 'active' : '' }" >접수</a></li>
			<li class="nav-item"><a href="" class="nav-link" >문의</a></li>
		</ul>
		<c:if test="${not empty loginCustomer }">
			<span class="navbar-text"><strong class="text-white">${loginCustomer.name }</strong>님 접속중</span>
		</c:if>
		<ul class="navbar-nav">
			<c:choose>
				<c:when test="${not empty loginCustomer }">
					<li class="nav-item"><a href="" class="nav-link">내 정보</a>
					<li class="nav-item"><a href="/logout" class="nav-link" onclick="logout(event)">로그아웃</a>
				</c:when>
				<c:otherwise>
					<li class="nav-item"><a href="/login-form" class="nav-link">로그인</a>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</nav>
<form method="post" action="logout" id="form-logout">
	<sec:csrfInput />
</form>
<script>
	function logout(event) {
		event.preventDefault();
		document.getElementById("form-logout").submit();
	}
</script>