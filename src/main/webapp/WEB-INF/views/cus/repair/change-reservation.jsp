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
			<h1 class="border bg-light p-2 fs-4">예약 변경 완료페이지</h1>
		</div>
	</div>
	<form class="p-3" method="get" action="cancel">
	<div class="row mb-5">
		<div class="row mb-3" align="center">
			<div class="col">
				<h3 class="text-center fs-4">고객님의 예약이 변경되었습니다.</h3>
				<p>${reservationDto.customerEmail }</p>
				<p>으(로) 확인메일 보내드립니다.</p>
				<p><img src="/resources/images/calendar.png" width="100" height="100" class="img-thumbnail" style="border:0px;" alt="달력"/></p>
				<p><fmt:formatDate value="${reservationDto.reservationDate }" pattern="YYYY년 M월 dd일"/>&nbsp;${reservationDto.reservationHour }</p>
				<p>${reservationDto.locationName }</p>
				<p>${reservationDto.locationBasicAddress }&nbsp;${reservationDto.locationDetailAddress }</p>
			</div>
		</div>
	</div>
	<hr	>
	<div class="row mb-3">
		<div class="col-4" align="center">
			<h2><strong>문제</strong></h2>
		</div>
		<div class="col-8 fs-5">
			<p>${reservationDto.deviceCategoryName }</p>
			<p>${reservationDto.serviceCatName }</p>
		</div>
	</div>
	<hr>
	<div class="row mb-3" align="center">
		<div class="col">
			<button type="button" class="btn btn-warning btn-lg fs-4" id="btn-open-modal">일정 변경하기</button>
			<a href="" class="btn btn-danger btn-lg fs-4" data-bs-toggle="modal" data-bs-target="#modal-form-cancel">예약 취소하기</a>
		</div>
	</div>
	</form>
</div>
<div class="modal" tabindex="-1" id="modal-form-change">
	<div class="modal-dialog modal-lg">
		<form class="p-3" method="post" action="change-reservation" id="form-changeReserv">
		<input type="hidden" name="registrationNo" value="${reservationDto.registrationNo }">
		<input type="hidden" name="locationNo" value="${reservationDto.locationNo }">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" align="center">
				<h3 class="mb-3"><strong>예약일정 변경하기</strong></h3>
				<span class="fs-5"><strong>변경하실 날짜를 선택하세요.</strong></span>
				<p>
					<input class="datepicker form-control form-control-sm" name="reservationDate">
				</p>
				<p class="fs-5"><strong>시간</strong></p>
				<p>변경하실 시간을 선택하세요.</p>
				<select class="form-select form-select-sm mb-4" name="reservationHour" id="select-hour"></select>
				<button type="button" class="btn btn-primary btn-sm" id="btn-add-change" disabled>지금 일정 변경하기</button>
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
		<input type="hidden" name="registrationNo" value="${reservationDto.registrationNo }">
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

$(function() {
	
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

	  $('.datepicker').datepicker({ minDate: 0});

 $("#select-hour").change(function() {
	if($(this).val() == '') {
		$("#btn-add-change").prop("disabled", true)
	} else {
		$("#btn-add-change").prop("disabled", false)
	}
})	  

 $(":input[name=reservationDate]").change(function() {
	let $selectHour = $("#select-hour").empty();
	var dateValue = $(":input[name=reservationDate]").val();
	// param.locationNo 하면 url에있는 locationNo도 가져올 수 있다.
	$.ajax({
		type:"get",
		url: "hours",
		data: {date: dateValue, locationNo:${param.locationNo}},
		dataType: 'json',
		success:function(items) {
			$selectHour.append("<option value=''> 예약시간을 선택하세요</option>");
			// 여기에 매장의 예약가능한 시간 부분이 들어가야한다
			$.each(items, function(index, item) {
				let row = `
					<option value="\${item}">\${item}</option>
				`
				$selectHour.append(row);
				
			})
		}
	})
})

	var modal = new bootstrap.Modal("#modal-form-change");
 
	$("#btn-open-modal").click(function() {
	  // 선택한날짜와시간을 모달창에표시하는코드
		modal.show();
	});
	
	$("#btn-add-change").click(function() {
	  
	  // 폼을 서버로제출하는코드
	  $("#form-changeReserv").trigger("submit");
	});

});
</script>
</body>
</html>