<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>애플리케이션</title>
<style>
	#calendar td a.fc-event {color: white;}
	
.fc-day-sun a {
  color: red;
  text-decoration: none;
}
.fc-day-sat a {
  color: blue;
  text-decoration: none;
}
.fc-day-mon a{
	color:black;
	text-decoration: none;
}
.fc-day-tue a{
	color:black;
	text-decoration: none;
}
.fc-day-wed a{
	color:black;
	text-decoration: none;
}
.fc-day-thu a{
	color:black;
	text-decoration: none;
}
.fc-day-fri a{
	color:black;
	text-decoration: none;
}
</style>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container mt-3">
   	<div class="row">
		<div class="col-2">
			<c:set var="menu1" value="휴가관리" />
   			<c:set var="menu2" value="휴가신청" />
   			<%@include file="../common/leftbar.jsp" %>
		</div>
		<div class="col-10">
			<!-- 달력이 표시되는 엘리먼트다. -->
			<div id="calendar"></div>
		</div>
	</div>
</div>
<!-- 휴가 등록/수정 모달 -->
<div class="modal" tabindex="-1" id="modal-vacation-add">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">휴가신청</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="card">
					<div class="card-body">
						<form class="row g-3">
							<div class="col-sm-12">
								<label class="form-label">휴가구분</label>
								<select class="form-select form-select-sm" name="catNo">
									<c:forEach var="cat" items="${categories }">
										<option value="${cat.catNo }"> ${cat.catName } (${cat.minusTimes}h, ${cat.minusDays }일)</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-sm-6 mb-2">
								<label class="form-label">시작일자</label>
								<input type="date" class="form-control form-control-sm" name="startDate">
							</div>
							<div class="col-sm-6 mb-2">
								<label class="form-label">시작시간</label>
								<input type="time" class="form-control form-control-sm" name="startHour">
							</div>
							<div class="col-sm-6 mb-2">
								<label class="form-label">종료일자</label>
								<input type="date" class="form-control form-control-sm" name="endDate">
							</div>
							<div class="col-sm-6 mb-2">
								<label class="form-label">종료시간</label>
								<input type="time" class="form-control form-control-sm" name="endHour">
							</div>
							<div class="col-sm-12">
								<label class="form-label">요청사유</label>
								<textarea rows="3" class="form-control" name="note"></textarea>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="btn-add-vacation">요청</button>
			</div>
		</div>
	</div>
</div>
<!-- 휴가 수정 모달 -->
<div class="modal" tabindex="-1" id="modal-vacation-modify">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">휴가수정</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="card">
					<div class="card-body">
						<form class="row g-3">
							<div class="col-sm-12">
								<label class="form-label">휴가구분</label>
								<select class="form-select form-select-sm" name="catNo">
									<c:forEach var="cat" items="${categories }">
										<option value="${cat.catNo }"> ${cat.catName } (${cat.minusTimes}h, ${cat.minusDays }일)</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-sm-6 mb-2">
								<label class="form-label">시작일자</label>
								<input type="date" class="form-control form-control-sm" name="startDate" >
							</div>
							<div class="col-sm-6 mb-2">
								<label class="form-label">시작시간</label>
								<input type="time" class="form-control form-control-sm" name="startHour">
							</div>
							<div class="col-sm-6 mb-2">
								<label class="form-label">종료일자</label>
								<input type="date" class="form-control form-control-sm" name="endDate">
							</div>
							<div class="col-sm-6 mb-2">
								<label class="form-label">종료시간</label>
								<input type="time" class="form-control form-control-sm" name="endHour">
							</div>
							<div class="col-sm-12">
								<label class="form-label">요청사유</label>
								<textarea rows="3" class="form-control" name="note"></textarea>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="btn-update-vacation">요청</button>
			</div>
		</div>
	</div>
</div>
<!-- 상세정보 -->
<div class="modal" tabindex="-1" id="modal-vacation-detail">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="catName">제목</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table class="table table-bordered">
					<tr>
						<th class="form-label">직원</th>
						<td class="" id="detail-empName"></td>
					</tr>
					<tr class="col-sm-6 mb-2">
						<th class="form-label">유급 시간</th>
						<td class="" id="detail-minusTimes"></td>
					</tr>
					<tr class="col-sm-6 mb-2">
						<th class="form-label">차감 일수</th>
						<td class="" id="minusDays"></td>
					</tr>
					<tr class="col-sm-6 mb-2">
						<th class="form-label">사유</th>
						<td class="" id="note"></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">삭제요청</button>
				<button type="button" class="btn btn-primary" id="btn-modify-vacation">수정요청</button>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js'></script>
<script src="https://momentjs.com/downloads/moment.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	
	
	
	// 모달객체를 생성합니다.
	let todoAddModal = new bootstrap.Modal("#modal-vacation-add");
	let vacationDetailModal = new bootstrap.Modal("#modal-vacation-detail");
	// 모달객체가 닫히면 실행할 이벤트 핸들러 함수를 등록한다.
	// 이벤트 핸들러 함수에서는 입력필드의 값을 초기화한다.
	$("#modal-vacation-add").on('hidden.bs.modal', function(event) {
		$("select[name=catNo] option:eq(0)").prop("selected", true);
		$(":input[name=startDate]").val("");
		$(":input[name=startHour]").val("").prop("disabled", false);
		$(":input[name=endDate]").val("");
		$(":input[name=endHour]").val("").prop("disabled", false);
		$("textarea[name=note]").val("")
	})
	
	// FullCalendar의 Calender객체를 생성한다.
	// new FullCalendar.Calendar(엘리먼트객체, 옵션객체)
	// new FullCalendar.Calendar(document.getElementById("calendar"), {
	//		locale: "ko",
	//		initialView: "dayGridMonth",
	//		events: function(int, successCallback, failureCallback) { ... }
	//		dateClick: function(info) { ... }
	// })
	let calendar = new FullCalendar.Calendar(document.getElementById("calendar"), {
		// 달력의 월, 요일정보가 한글로 표시되도록 한다.
		locale: 'ko',
		// 달력의 초기화면을 월별로 일정이 표시되게 한다.
		initialView: 'dayGridMonth',
		// events 프로퍼티에는 달력이 변경될 때마다 실행되는 함수를 등록한다.
		// info는 화면에 표시되는 달력의 시작일, 종료일을 제공한다.
		// 일정정보를 조회하고, successCallback(이벤트배열)함수의 매개변수로 일정정보를 제공하고 실행하면 화면에 반영된다.
		events: function(info, successCallback, failureCallback) {
			refreshEvents(info, successCallback);
		},
		// dateClick 프로퍼티에는 달력의 날짜를 클릭했을 때 실행되는 함수를 등록한다.
		// info는 클릭한 날짜의 날짜정보를 제공한다.
		dateClick: function(info) {
		
			if (moment(info.date).add(1, 'd').isAfter(moment())) {
				let clickedDate = info.dateStr;
				openTodoAddModal(clickedDate);
			} else {
				alert("현재 날짜보다 이전 날짜에 대해서는 휴가신청을 할 수 없습니다.");
			}
			
		},
		eventClick: function(info) {
			info.jsEvent.preventDefault(); // don't let the browser navigate
			//alert(info.event.id);
			//console.log(info.event.start, info.event.end)
			openvacationDetailModal(info.event);
		}
	});
	// Calendar를 렌더링한다.
	calendar.render();
	
	// 일정 등록 모달창의 등록버튼을 클릭했을 때 실행될 이벤트핸들러 함수를 등록한다.
	$("#btn-add-vacation").click(function() {
		// 일등록 모달창에서 제목, 구분, 시작일, 종료일, 내용을 조회해서 객체를 생성한다.
		let vacation = {
			catNo: $("#modal-vacation-add select[name=catNo]").val(),
			startDate: $("#modal-vacation-add :input[name=startDate]").val(),
			endDate: $("#modal-vacation-add :input[name=endDate]").val(),
			note: $("#modal-vacation-add textarea[name=note]").val(),
			startHour: $("#modal-vacation-add :input[name=startHour]").val(),
			endHour:  $("#modal-vacation-add :input[name=endHour]").val()
		};
	
		// addTdo(새일정)을 실행해서 ajax로 새 일정을 서버로 보낸다.
		addVacation(vacation);
		todoAddModal.hide();
	});
		
	// 일정 등록 모달을 표시한다.
	// 날짜와 시간을 전달받아서 시작일자, 시작시간, 종료일자, 종료시간을 입력한다.
	// 시작일자와 종료일자는 같은 날짜로 하고, 시작시간에 현재 시간을 입력하고, 종료시간은 현재 시간보다 1시간 후로 입력한다.
	function openTodoAddModal(date) {	// 날짜 클릭 후 첫 화면
		$("select[name=catNo]").val("100");
		
		$("#modal-vacation-add :input[name=startDate]").val(date).prop("readOnly", true);	
		$("#modal-vacation-add :input[name=endDate]").val(date);
		$("#modal-vacation-add :input[name=startHour]").val("09:00").prop("readOnly", true);
		$("#modal-vacation-add :input[name=endHour]").val("18:00").prop("readOnly", true);
		
		todoAddModal.show();
	}
	
	$("select[name=catNo]").change(function() {
		let catNo = $("select[name=catNo]").val();
		if (catNo == 100) { //  연차
			$("#modal-vacation-add :input[name=endDate]").prop("readOnly", false)	
			$("#modal-vacation-add :input[name=startHour]").val("09:00");
			$("#modal-vacation-add :input[name=endHour]").val("18:00");
			
		} else if (catNo == 101) { // 오전반차
			$("#modal-vacation-add :input[name=endDate]").prop("readOnly", true)
			$("#modal-vacation-add :input[name=startHour]").val("09:00");
			$("#modal-vacation-add :input[name=endHour]").val("13:00");
			
		} else if (catNo == 102) { // 오후반차
			$("#modal-vacation-add :input[name=endDate]").prop("readOnly", true);
			$("#modal-vacation-add :input[name=startHour]").val("14:00");
			$("#modal-vacation-add :input[name=endHour]").val("18:00");
			
		} else if (catNo == 103) { // 오전첫번째 반반차
			$("#modal-vacation-add :input[name=endDate]").prop("readOnly", true);
			$("#modal-vacation-add :input[name=startHour]").val("09:00");
			$("#modal-vacation-add :input[name=endHour]").val("11:00");
			
		} else if (catNo == 104) {	// 오전두번째 반반차
			$("#modal-vacation-add :input[name=endDate]").prop("readOnly", true);
			$("#modal-vacation-add :input[name=startHour]").val("11:00");
			$("#modal-vacation-add :input[name=endHour]").val("13:00");
			
		} else if (catNo == 105) {	// 오후첫번째 반반차
			$("#modal-vacation-add :input[name=endDate]").prop("readOnly", true);
			$("#modal-vacation-add :input[name=startHour]").val("14:00");
			$("#modal-vacation-add :input[name=endHour]").val("16:00");
			
		} else if (catNo == 106) {	// 오후두번째 반반차
			$("#modal-vacation-add :input[name=endDate]").prop("readOnly", true);
			$("#modal-vacation-add :input[name=startHour]").val("16:00");
			$("#modal-vacation-add :input[name=endHour]").val("18:00");
			
		};
		
		
	})
	
	// 휴가일정 상세보기
	function openvacationDetailModal(eventObject) {
		
		$.ajax({
			type: 'post',
			url: '/vacation/detail', 
			data: {no: eventObject.id},
			dataType: 'json'
		})
		.done(function(vacEventDetail) {	
				
			
				$("#modal-vacation-detail #catName").text(vacEventDetail.catName);
				$("#modal-vacation-detail #detail-empName").text(vacEventDetail.empName);
				if (vacEventDetail.catNo === 100) {
					$("#modal-vacation-detail #detail-minusTimes").text(vacEventDetail.consumptionTimes);
				} else {
					$("#modal-vacation-detail #detail-minusTimes").text(vacEventDetail.minusTimes);
				}
			 	if (vacEventDetail.catNo === 100) {
		            $("#modal-vacation-detail #minusDays").text(vacEventDetail.period);
		        } else {
		            $("#modal-vacation-detail #minusDays").text(vacEventDetail.minusDays);
		        }
			 	if (!vacEventDetail.note) {
					$("#modal-vacation-detail #note").text("요청 사유가 없습니다.");
			 	} else {
					$("#modal-vacation-detail #note").text(vacEventDetail.note);
			 	}
				
			vacationDetailModal.show();
		})
	}
	
	// 새 일정정보를 서버로 보내고, FullCalenader의 달력에 새 일정정보를 추가한다.
	function addVacation(vacation) {
		// ajax로 새 일정정보를 서버로 보내서 등록시킨다.
		$.ajax({
			type: 'post',
			url: '/vacation/add', 
			data: JSON.stringify(vacation),
			contentType: 'application/json',
			dataType: 'json'
		})
		// done(함수)는 ajax 요청이 성공적으로 완료되면 실행되는 함수를 등록한다.
		.done(function(vacationEvent) {		//
			calendar.addEvent(vacationEvent); 
		})
		// fail(함수)는 ajax 요청이 실패하면 실행되는 함수를 등록한다.
		.fail(function() {
			 
		});
	}
	
	function refreshEvents(info, successCallback) {
		let startDate = moment(info.start).format("YYYY-MM-DD");
		let endDate = moment(info.end).format("YYYY-MM-DD");
	
		let param = {
			startDate: startDate,
			endDate: endDate
		};
		
		$.ajax({
			type: 'get',
			url: '/vacation/events',
			data: param,
			dataType: 'json'
		})
		.done(function(events) {
			successCallback(events);
		})
	}
});
</script>
</body>
</html>