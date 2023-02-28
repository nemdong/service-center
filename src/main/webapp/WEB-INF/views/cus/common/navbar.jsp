<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="tags.jsp" %>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-3">
	<div class="container">
		<ul class="navbar-nav me-auto">
			<li class="nav-item"><a href="/cus" class="nav-link" ><strong>서비스 센터</strong></a></li>
		</ul>
		<sec:authorize access="isAuthenticated()">
			<ul class="navbar-nav me-auto">
				<li class="nav-item"><a href="/reservation/device" class="nav-link" >접수</a></li>
				<li class="nav-item"><a href="" class="nav-link" >문의</a></li>
			</ul>
		
		</sec:authorize>

	<sec:authorize access="isAuthenticated()">
			<span class="navbar-text"><strong class="text-white"><sec:authentication property="principal.name"/></strong>님 환영합니다.</span>
		</sec:authorize>
		<ul class="navbar-nav">
			<sec:authorize access="isAuthenticated()">
				<sec:authorize access="hasRole('ROLE_CUSTOMER')">
					<li class="nav-item"><a class="nav-link ${menu eq 'customer' ? 'active' : '' }" href="/customer/info">내정보 보기</a></li>
				</sec:authorize>
				<li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
			</sec:authorize>
			<sec:authorize access="!isAuthenticated()">
				<li class="nav-item"><a class="nav-link ${menu eq 'login' ? 'active' : '' }" href="/cus/login">로그인</a></li>
				<li class="nav-item"><a class="nav-link ${menu eq 'register' ? 'active' : '' }" href="/cus/register">회원가입</a></li>				
			</sec:authorize>
				<li class="nav-item"><a class="nav-link" href="/emp/login">업무 페이지</a></li>

		
		 <c:if test="${not empty loginUser }">
			<span class="navbar-text"><strong class="text-white">${loginUser.name }</strong>님 접속중</span>
		</c:if>
		
		<!-- <ul class="navbar-nav">
			<li class="nav-item"><a href="" class="nav-link">내 정보</a>
			<li class="nav-item"><a href="/logout" class="nav-link" onclick="logout(event)">로그아웃</a>
			<li class="nav-item"><a href="/login-form" class="nav-link">로그인</a>
		</ul>  -->
	
	
	
	
	
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