<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>애플리케이션</title>
</head>
<body>
<c:set var="menu" value="main" />
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col">
			<h1 class="border bg-light p-2 fs-4">예약 현황 상세페이지</h1>
		</div>
	</div>
	<div class="row mb-5">
		<div class="row mb-3" align="center">
			<div class="col">
				<h3 class="text-center fs-4">고객님의 예약이 확인되었습니다.</h3>
				<p>hong@naver.com</p>
				<p>으(로) 확인메일 보내드립니다.</p>
				<p><img src="/resources/images/calendar.png" width="100" height="100" class="img-thumbnail" style="border:0px;" alt="달력"/></p>
				<p>2023년05월01일, 12:25PM</p>
				<p>Apple 명동</p>
				<p>중구 남대문로 2가 9-1 하이드파크 서울, 04534</p>
			</div>
		</div>
	</div>
	<hr	>
	<div class="row mb-3">
		<div class="col-4" align="center">
			<h2>문제</h2>
		</div>
		<div class="col-8">
			<p>iPhone 14 Pro Max</p>
			<p>배터리 서비스</p>
		</div>
	</div>
	<hr>
	<div class="row mb-3" align="center">
		<div class="col-12">
			<a href="modify?" class="btn btn-warning btn-lg fs-4">일정 변경하기</a>
			<a href="cancel?" class="btn btn-danger btn-lg fs-4">취소하기</a>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>