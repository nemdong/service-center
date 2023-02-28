<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>출장요청내역</title>
</head>
<body>
<div class="container">
   <%@ include file="../common/navbar.jsp" %>
<div class="container">
   <div class="row mb-3">
   		<div class="col-2">
			<%@ include file="../common/leftbar.jsp" %>
   		</div>
   		<div class="col-10">
   			<div class="row mb-1">
				<div class="col-12"><h4 class="fw-bold fs-5">나의 출장 요청 내역</h4></div>
			</div>
			<form mehtod="get" action="myTripSearch">
				<div class="row mb-3">
					<div class="col-12">
						<div class="bg-light p-2">
							<div class="row">
								<div class="col-6">
									<select id="inputState" class="form-select" name="approvalStatus">
										<option value="미승인" selected="selected">미승인</option>
										<option value="승인">승인</option>
										<option value="반려">반려</option>
									</select>
								</div>
								<div class="col-6 mt-1 text-end">
									<button type="submit" class="mb-1 btn btn-dark btn-sm" id="search-form">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="mb-1 me-1 bi bi-search" viewBox="0 0 16 16">
											<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
										</svg>검색
									</button>
								</div>
							</div>
						</div>	
					</div>
					<div class="col-12 mt-3">
					<div>
						<h6 class="fw-bold">나의 요청 내역</h6>
					</div>	
						<table class="table table-sm bg-light" id="business-trip-list">
							<thead class="text-center table-secondary">
								<tr class="align-middle">
									<th>사원번호</th>
									<th>성명</th>
									<th>목적</th>
									<th>장소</th>
									<th>시작일</th>
									<th>종료일</th>
									<th>전자 결제 상태</th>
								</tr>
							</thead>
							<tbody class="text-center">
								<c:forEach var="trip" items="${allTripByEmpNo }">
									<tr class="align-middle" data-req-no="${trip.reqNo }" style="cursor: pointer;" class="text-center">
										<td>${trip.empNo }</td>
										<td>${trip.empName }</td>
										<td>${trip.title }</td>
										<td>${trip.location }</td>
										<td>${trip.startDate }</td>
										<td>${trip.endDate }</td>
										<td>${trip.approvalStatus }</td>
									</tr>
								</c:forEach>
							</tbody>	
						</table>
					</form>
					<div class="text-end">
						<a href="/emp/businessTrip/calendar" type="button" class="btn btn-primary btn-sm">뒤로</a>
					</div>
				</div>
				<div class="modal" tabindex="-1" id="modal-trip-info">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">일정 정보</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="card">
									<div class="card-body">
										<form modelAttribute="businessTripRegisterForm" id="modal-form" class="row g-3" method="post" action="insert">
										<input type="hidden" id="reqNo" name="reqNo" value="" />
										<input type="hidden" name="approvalStatus" value="미승인" />
											<div class="col-sm-6 mb-2">
												<label class="form-label">성명</label>
												<input type="text" class="form-control form-control-sm" id="emp-name" name="empName" readonly="readonly">
											</div>
											<div class="col-sm-6 mb-2">
												<label class="form-label">사원번호</label>
												<input type="text" class="form-control form-control-sm" id="emp-no" name="empNo" readonly="readonly">
											</div>
											<div class="col-sm-4">
												<label class="form-label">출장 구분</label>
												<select class="form-select form-select-sm" name="catNo">
													<option value="100">단기 출장</option>
													<option value="101">장기 출장</option>
												</select>
											</div>
											<div class="col-sm-8">
												<label class="form-label">출장 목적</label>
												<input type="text" class="form-control form-control-sm" id="title" name="title">
											</div>
											<div class="col-sm-6 mb-2">
												<label class="form-label">시작 일자</label>
												<input type="date" class="form-control form-control-sm" id="start-date" name="startDate">
											</div>
											<div class="col-sm-6 mb-2">
												<label class="form-label">시작 시간</label>
												<input type="time" class="form-control form-control-sm" id="start-time" name="startTime">
											</div>
											<div class="col-sm-6 mb-2">
												<label class="form-label">종료 일자</label>
												<input type="date" class="form-control form-control-sm" id="end-date" name="endDate">
											</div>
											<div class="col-sm-6 mb-2">
												<label class="form-label">종료 시간</label>
												<input type="time" class="form-control form-control-sm" id="end-time" name="endTime">
											</div>
											<div class="col-sm-12">
												<label class="form-label">예상 경비</label>
												<input type="text" class="form-control" id="expenses" name="expenses" />
											</div>
											<div class="col-sm-12">
												<label class="form-label">장소</label>
												<input type="text" class="form-control" id="location" name="location"/>
											</div>
											<div class="col-sm-12">
												<label class="form-label">목적</label>
												<textarea rows="3" class="form-control" id="description" name="description"></textarea>
											</div>
										</form>
									</div>
								</div>
							</div>
							<div class="modal-footer test-end">
								<button id="modify" type="button" class="btn btn-warning btn-sm">수정</button>
								<button id="delete" type="button" class="btn btn-dark btn-sm">삭제</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>				
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	let todoInfoModal = new bootstrap.Modal("#modal-trip-info");
	
	// 출장 상세 모달
	$("#business-trip-list tbody tr").click(function() {
		
		let reqNo = $(this).attr("data-req-no");
		$.getJSON("/emp/businessTrip/modalDetail.json", {no : reqNo}, function(trip) {
			
			$("#reqNo").val(trip.reqNo);
			$("#emp-name").val(trip.empName)
			$("#emp-no").val(trip.empNo)
			$("#catNo").val(trip.catNo);
			$("#title").val(trip.title);
			$("#start-date").val(trip.startDate);
			$("#start-time").val(trip.startTime);
			$("#end-date").val(trip.endDate);
			$("#end-time").val(trip.endTime);
			$("#expenses").val(trip.expenses);
			$("#location").val(trip.location);
			$("#description").val(trip.description);
		})
		
		todoInfoModal.show();
	})
	
	$("#modify").click(function() {
		$("#modal-form").attr("action", "modify").trigger("submit");
		
	})
	
	$("#delete").click(function() {
		$("#modal-form").attr("action", "delete").trigger("submit");
		
	})
})
</script>
</body>
</html>