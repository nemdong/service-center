<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
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
	<form class="p-3" method="get" action="cancel">
	<div class="row mb-5">
		<div class="row mb-3" align="center">
			<div class="col">
				<h3 class="text-center fs-4">고객님의 예약이 확인되었습니다.</h3>
				<p>hong@naver.com</p>
				<p>으(로) 확인메일 보내드립니다.</p>
				<p><img src="/resources/images/calendar.png" width="100" height="100" class="img-thumbnail" style="border:0px;" alt="달력"/></p>
				<p>2023년05월01일, 12:25PM</p>
				<p>Apple 명동</p>
				<p>중구 남대문로 2가 9-1 하이드파크 서울</p>
			</div>
		</div>
	</div>
	<hr	>
	<div class="row mb-3">
		<div class="col-4" align="center">
			<h2><strong>문제</strong></h2>
		</div>
		<div class="col-8 fs-5">
			<p>iPhone 14 Pro Max</p>
			<p>배터리 서비스</p>
		</div>
	</div>
	<hr>
	<div class="row mb-3">
		<div class="col-4" align="center">
			<h2><strong>예상비용</strong></h2>
		</div>
		<div class="col-8 fs-5">
			<p>￦79,200</p>
		</div>
	</div>
	<hr />
	<div class="row mb-3" align="center">
		<div class="col">
			<a href="" class="btn btn-warning btn-lg fs-4" data-bs-toggle="modal" data-bs-target="#modal-form-change">일정 변경하기</a>
			<a href="" class="btn btn-danger btn-lg fs-4" data-bs-toggle="modal" data-bs-target="#modal-form-cancel">예약 취소하기</a>
		</div>
	</div>
	</form>
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
				<span class="fs-5"><strong>변경하실 날짜를 선택하세요.</strong></span>
				<p>
					<input class="datepicker">
				</p>
				<p class="fs-5"><strong>시간</strong></p>
				<p>변경하실 시간을 선택하세요.</p>
				<select class="form-select form-select-sm mb-4" name="time">
					<option style="font-weight:bold; background-color: gray ">오전(AM)</option>
					<option value="" selected>오전 10:00</option>
					<option value="">오전 11:00</option>
					<option style="font-weight:bold; background-color: gray">오후(PM)</option>
					<option value="">오후 12:00</option>
					<option value="">오후 13:00</option>
					<option value="">오후 14:00</option>
					<option value="">오후 15:00</option>
					<option value="">오후 16:00</option>
					<option value="">오후 17:00</option>
					<option value="">오후 18:00</option>
					<option value="">오후 19:00</option>
					<option value="">오후 20:00</option>
					<option value="">오후 21:00</option>
				</select>
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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$.datepicker.setDefaults({
	  dateFormat: 'yy-mm-dd',
	  prevText: '이전 달',
	  nextText: '다음 달',
	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	  showMonthAfterYear: true,
	  yearSuffix: '년'
	});

	$(function () {
	  $('.datepicker').datepicker({ minDate: 0});
	});
</script>
</body>
</html>