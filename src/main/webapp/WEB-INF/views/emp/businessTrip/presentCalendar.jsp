<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<title>출장 현황</title>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container mt-3">
	<div class="row">
		<div class="col-2">
			<c:set var="menu1" value="출장관리"/>
			<c:set var="menu2" value="출장현황"/>
			<%@ include file="../common/leftbar.jsp" %>
		</div>
		<div class="col-10">
			<div class="mb-2 border-bottom border-secondary">
				<h4 class="fw-bold">출장 현황</h4>
			</div>
 			<div class="text-center mb-2">
				<a href="" type="button" class="btn border-secondary text-dark ms-1" id="link-add-todo" style="width:20%">새 일정등록</a>
				<a href="/emp/businessTrip/myTripSearch" class="btn border-secondary text-dark" id="link-search-todos" style="width:20%">나의 출장 요청 내역</a>
			</div>
			<!-- 달력이 표시되는 엘리먼트다. -->
			<div id="calendar"></div>
		</div>
	</div>
</div>
<!-- 일정 등록/수정 모달 -->
<div class="modal" tabindex="-1" id="modal-todo-info">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">일정 정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="card">
					<div class="card-body">
						<form class="row g-3" modelAttribute="BusinessTripRegisterForm" method="post" action="insert">
						<input type="hidden" name="approvalStatus" value="미승인" />
							<div class="col-sm-4">
								<label class="form-label">출장 구분</label>
								<select class="form-select form-select-sm" name="catNo">
									<option value="100">단기 출장</option>
									<option value="101">장기 출장</option>
								</select>
							</div>
							<div class="col-sm-8">
								<label class="form-label">출장 목적</label>
								<input type="text" class="form-control form-control-sm" name="title">
							</div>
							<div class="col-sm-6 mb-2">
								<label class="form-label">시작 일자</label>
								<input type="date" class="form-control form-control-sm" name="startDate">
							</div>
							<div class="col-sm-6 mb-2">
								<label class="form-label">시작 시간</label>
								<input type="time" class="form-control form-control-sm" name="startTime">
							</div>
							<div class="col-sm-6 mb-2">
								<label class="form-label">종료 일자</label>
								<input type="date" class="form-control form-control-sm" name="endDate">
							</div>
							<div class="col-sm-6 mb-2">
								<label class="form-label">종료 시간</label>
								<input type="time" class="form-control form-control-sm" name="endTime">
							</div>
							<div class="col-sm-12">
								<label class="form-label">예상 경비</label>
								<input type="text" class="form-control" name="expenses" />
							</div>
							<div class="col-sm-12">
								<label class="form-label">장소</label>
								<input type="text" class="form-control" name="location"/>
							</div>
							<div class="col-sm-12">
								<label class="form-label">목적</label>
								<textarea rows="3" class="form-control" name="description"></textarea>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="btn-add-todo">등록</button>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js'></script>
<script src="https://momentjs.com/downloads/moment.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	// 모달객체를 생성합니다.
	let todoInfoModal = new bootstrap.Modal("#modal-todo-info");
	// 모달객체가 닫히면 실행할 이벤트 핸들러 함수를 등록한다.
	// 이벤트 핸들러 함수에서는 입력필드의 값을 초기화한다.
	$("#modal-todo-info").on('hidden.bs.modal', function(event) {
		$(":input[name=title]").val("");
		$("select[name=catNo] option:eq(0)").prop("selected", true);
		$(":checkbox[name=allDay]").prop("checked", false);
		$(":input[name=startDate]").val("");
		$(":input[name=startTime]").val("").prop("disabled", false);
		$(":input[name=endDate]").val("");
		$(":input[name=endTime]").val("").prop("disabled", false);
		$("textarea[name=description]").val("")
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
			let clickedDate = info.dateStr;
			openTodoModal(clickedDate);
		},
		// eventClick 프로퍼티에는 달력의 이벤트(일정)을 클릭했을 때 실행되는 함수를 등록한다.
		eventClick: function(info) {
			
		}
	});
	// Calendar를 렌더링한다.
	calendar.render();

	
	// 내 일정보기 링크를 클릭했을 때 실행될 이벤트핸들러 함수를 등록한다.
	$("#link-my-todos").click(function(event) {
		event.preventDefault();
	});
	
	// 부서 일정보기 링크를 클릭했을 때 실행될 이벤트핸들러 함수를 등록한다.
	$("#link-dept-todos").click(function(event) {
		event.preventDefault();
		function deptEvents(info, successCallback) {
			let startDate = moment(info.start).format("YYYY-MM-DD");
			let endDate = moment(info.end).format("YYYY-MM-DD");
		
			let param = {
				startDate: startDate,
				endDate: endDate
			};
			
			$.ajax({
				type: 'get',
				url: '/emp/businessTrip/deptEvents',
				data: param,
				dataType: 'json'
			})
			.done(function(events) {
				successCallback(events);
			})
		}
	})
	
	// 새 일정 등록 링크를 클릭했을 때 실행될 이벤트핸들러 함수를 등록한다
	// 새 일정 등록 링크를 클리했을 때는 현재 날짜와 시간을 일정 등록 모달에 입력필드에 입력한다.
	$("#link-add-todo").click(function(event) {
		event.preventDefault();
		
		let nowDate = moment().format("YYYY-MM-DD");
		openTodoModal(nowDate);
	});
	
	// 하루종일 스위치의 상태가 변경될 때 실행될 이벤트핸들러 함수를 등록한다.
	// 이벤트핸들러 함수에서는 하루종일이 활성화되면 시작시간, 종료시간 입력필드를 비활성화한다.
	$(":checkbox[name=allDay]").change(function() {
		
		if ($(this).prop('checked')) {
			$(":input[name=startTime]").prop("readOnly", true);
			$(":input[name=endTime]").prop("readOnly", true);
		} else {
			let startTime = moment().format('HH:mm');
			let endTime = moment().add('1', 'h').format('HH:mm');
			$(":input[name=startTime]").prop("readOnly", false).val(startTime);
			$(":input[name=endTime]").prop("readOnly", false).val(endTime);
		}
	});
	
	// 일정 등록 모달창의 등록버튼을 클릭했을 때 실행될 이벤트핸들러 함수를 등록한다.
	$("#btn-add-todo").click(function() {
		// 일등록 모달창에서 제목, 구분, 시작일, 종료일, 내용을 조회해서 객체를 생성한다.
		let todo = {
			title: $(":input[name=title]").val(),
			catNo: $("select[name=catNo]").val(),
			startDate: $(":input[name=startDate]").val(),
			startTime: $(":input[name=startTime]").val(),
			endDate: $(":input[name=endDate]").val(),
			endTime: $(":input[name=endTime]").val(),
			description: $("textarea[name=description]").val(),
			expenses : $(":input[name=expenses]").val(),
			location : $(":input[name=location]").val()
		};
		
		// addTdo(새일정)을 실행해서 ajax로 새 일정을 서버로 보낸다.
		addTodo(todo);
		todoInfoModal.hide();
	});
		
	// 일정 등록 모달을 표시한다.
	// 날짜와 시간을 전달받아서 시작일자, 시작시간, 종료일자, 종료시간을 입력한다.
	// 시작일자와 종료일자는 같은 날짜로 하고, 시작시간에 현재 시간을 입력하고, 종료시간은 현재 시간보다 1시간 후로 입력한다.
	function openTodoModal(date) {
		let startTime = moment().format('HH:mm');
		let endTime = moment().add('1', 'h').format('HH:mm');
		
		$(":input[name=startDate]").val(date);	
		$(":input[name=endDate]").val(date);
		$(":input[name=startTime]").val(startTime);
		$(":input[name=endTime]").val(endTime);
		
		todoInfoModal.show();
	}
	
	// 새 일정정보를 서버로 보내고, FullCalenader의 달력에 새 일정정보를 추가한다.
	function addTodo(todo) {
		// ajax로 새 일정정보를 서버로 보내서 등록시킨다.
		$.ajax({
			type: 'post',
			url: '/emp/businessTrip/add', 
			data: JSON.stringify(todo),
			contentType: 'application/json',
			dataType: 'json'
		})
		// done(함수)는 ajax 요청이 성공적으로 완료되면 실행되는 함수를 등록한다.
		.done(function(businessTripEvent) {				
			calendar.addEvent(businessTripEvent); 		
		})
		// fail(함수)는 ajax 요청이 실팽하면 실행되는 함수를 등록한다.
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
			url: '/emp/businessTrip/events',
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