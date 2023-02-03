<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-3">
	<div class="container">
		<ul class="navbar-nav me-auto">
			<li class="nav-item"><a href="/" class="nav-link ${menu eq 'home' ? 'active' : '' }" ><strong>서비스 센터</strong></a></li>
		</ul>
		<ul class="navbar-nav me-auto">
			<li class="nav-item"><a href="/repair/main" class="nav-link ${menu eq 'main' ? 'active' : '' }" >접수</a></li>
			<li class="nav-item"><a href="" class="nav-link" >문의</a></li>
		</ul>
		<span class="navbar-text"><strong class="text-white">ㅇㅇㅇ</strong>님 접속중</span>
		<ul class="navbar-nav">
			<li class="nav-item"><a href="" class="nav-link">내 정보</a>
			<li class="nav-item"><a href="" class="nav-link">로그아웃</a>
			<li class="nav-item"><a href="" class="nav-link">로그인</a>
		</ul>
	</div>
</nav>