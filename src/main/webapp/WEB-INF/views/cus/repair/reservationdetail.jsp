<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>애플리케이션</title>
</head>
<body>
<c:set var="menu" value="repair" />
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
				<p>${reservation.customerEmail }</p>
				<p>으(로) 확인메일 보내드립니다.</p>
				<p><img src="/resources/images/calendar.png" width="100" height="100" class="img-thumbnail" style="border:0px;" alt="달력"/></p>
				<p><fmt:formatDate value="${reservation.reservationDate }" /></p>
				<p><strong>${reservation.locationName }</strong></p>
				<p>${reservation.locationBasicAddress }&nbsp;${reservation.locationDetailAddress }, ${reservation.zipcode }</p>
			</div>
		</div>
	</div>
	<hr	>
	<div class="row mb-3">
		<div class="col-4" align="center">
			<h2>문제</h2>
		</div>
		<div class="col-8">
			<p>기종 : ${reservation.deviceCategoryName }</p>
			<p>수리 내용 : ${reservation.serviceCatName }</p>
		</div>
	</div>
	<hr>
	<div class="row mb-3" align="center">
		<div class="col">
			<a href="" class="btn btn-warning btn-lg fs-4" data-bs-toggle="modal" data-bs-target="#modal-form-change">일정 변경하기</a>
			<a href="" class="btn btn-danger btn-lg fs-4" data-bs-toggle="modal" data-bs-target="#modal-form-cancel">예약 취소하기</a>
		</div>
	</div>
</div>
<div class="modal" tabindex="-1" id="modal-form-change">
	<div class="modal-dialog modal-lg">
		<form class="p-3" method="get" action="change">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" align="center">
				<h3 class="mb-3"><strong>예약일정 변경하기</strong></h3>
				<button type="submit" class="btn btn-primary btn-sm">지금 일정 변경하기</button>
			</div>
			<div class="modal-footer">
			</div>
		</div>
		</form>
	</div>
</div>
<div class="modal" tabindex="-1" id="modal-form-cancel">
	<div class="modal-dialog modal-lg">
		<form class="p-3" method="get" action="cancel">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" align="center">
				<h3 class="mb-3"><strong>예약을 취소할까요?</strong></h3>
				<button type="submit" class="btn btn-primary btn-lg">취소하기</button>
			</div>
			<div class="modal-footer">
			</div>
		</div>
		</form>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>