<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>근태 관리</title>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
   <div class="row mb-3">
   		<div class="col-2">
			<c:set var="menu1" value="근태관리"/>
			<c:set var="menu2" value="근태확인"/>
			<%@ include file="../common/leftbar.jsp" %>
   		</div>
   		<div class="col-10">
   			<div class="row mb-1">
				<div class="col-12"><h4 class="fw-bold fs-5">근태 확인</h4></div>
			</div>
			<form id="form-attendances" method="get" action="current"> <!-- 여기 -->
				<div class="row mb-3">
					<div class="col-12">
						<div class="bg-light p-2">
							<div class="d-flex justify-content-between">
								<table>
									<tr class="align-middle">
										<th>
											<h6 class="mt-2 ms-2 me-2"><span class="text-danger">* </span>근무일자</h6>
										</th>
										<td>
											<input id="workDate" type="hidden" name="workDate" value=""/>
											<select class="form-select form-select-xs" name="workDateYear" id="work-date-year">
											</select>
										</td>
										<td>
											<select class="form-select form-select-xs" name="workDateMonth" id="work-date-month">
												<option value="01-01" ${param.workDateMonth eq '01-01' ? 'selected' : '' }>1월</option>
												<option value="02-01" ${param.workDateMonth eq '02-01' ? 'selected' : '' }>2월</option>
												<option value="03-01">3월</option>
												<option value="04-01">4월</option>
												<option value="05-01">5월</option>
												<option value="06-01">6월</option>
												<option value="07-01">7월</option>
												<option value="08-01">8월</option>
												<option value="09-01">9월</option>
												<option value="10-01">10월</option>
												<option value="11-01">11월</option>
												<option value="12-01">12월</option>
											</select>
										</td>
									</tr>
								</table>
								<div>
								<button type="button" class="btn btn-dark btn-xs" id="search-form">검색</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row mb-4">
					<div class="col-12">
					</div>
					<div class="col-12 border-bottom mb-2">
						<h4 class="fw-bold fs-6 mt-2">근태 등록</h4>
					</div>
					<div class="col-12">
						<c:if test="${param.error eq 'dup' }">
							<div class="alert alert-danger">
								이미 출근 체크를 하셨습니다.
							</div>
						</c:if>
						<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-2">
							<button id="work-start-time" class="btn btn-dark me-md-2 btn-sm" type="button" name="workStartTime">출근</button>
							<button id="work-end-time" class="btn btn-dark btn-sm" type="button" name="workEndTime">퇴근</button>
						</div>
					</div>
					<div class="col-12">	
						<table class="table table-sm bg-light">
							<thead class="text-center table-secondary">
								<tr class="align-middle">
									<th>사원번호</th>
									<th>성명</th>
									<th>출근시각</th>
									<th>퇴근시각</th>
									<th>근무시간</th>
									<th>휴일근로</th>
									<th>연장근로</th>
									<th>지각시간</th>
									<th>조퇴시간</th>
								</tr>
							</thead>
							<tbody class="text-center">
								<tr class="align-middle">
									<td>${empNo }</td>
									<sec:authorize access="isAuthenticated()">
										<td><sec:authentication property="principal.name" /></td>
									</sec:authorize>	
									<td>${todayAtt.workStartTime }</td>
									<td>${todayAtt.workEndTime }</td>
									<td>${todayAtt.weekDayWorkTimes }</td>
									<td>${todayAtt.weekendWorkTimes }</td>
									<td>${todayAtt.overTimeWorkTimes }</td>
									<td>${todayAtt.tardinessTimes }</td>
									<td>${todayAtt.earlyTimes }</td>
								</tr>
							</tbody>	
						</table>
					</div>
				</div>
				
			<div class="row mb-4">
				<div class="col-6 border-bottom mb-2">
					<h4 class="fw-bold fs-6 mt-2">월 근태 확인</h4>
				</div>
				<div class="col-6 text-end"> <!-- 나중에 지우던가 하기 -->
					<button id="delete-button" class="mt-1 mb-1 text-end btn btn-outline-secondary btn-sm">행 삭제</button>
				</div>
				<div class="col-12">
					<div style="overflow-y:auto !important; width:100%; max-height:200px !important; display:block !important;">	
						<table class="table table-sm table-bordered bg-light">
							<thead class="text-center table-secondary">
								<tr class="align-middle">
									<th></th>
									<th>근무일자</th>
									<th>출근시각</th>
									<th>퇴근시각</th>
									<th>근무시각</th>
									<th>휴일근로</th>
									<th>연장근로</th>
									<th>지각시간</th>
									<th>조퇴시간</th>
								</tr>
							</thead>
							<tbody class="text-center">
								<c:forEach var="att" items="${attendancesList }" >
									<tr class="align-middle">
										<td><input name="deleteCheck" type="checkbox" value="${att.workDate }"/></td>
										<td><fmt:formatDate value="${att.workDate }" pattern="yyyy-MM-dd"/></td>
										<td>${att.workStartTime }</td>
										<td>${att.workEndTime }</td>
										<td>${att.weekDayWorkTimes }</td>
										<td>${att.weekendWorkTimes }</td>
										<td>${att.overTimeWorkTimes }</td>
										<td>${att.tardinessTimes }</td>
										<td>${att.earlyTimes }</td>
									</tr>
								</c:forEach>	
							</tbody>	
						</table>
					</div>	
				</div>
			</div>
		</form>
		
			<div class="row mb-4">
				<div class="col-12 border-bottom mb-2">
				<sec:authorize access="isAuthenticated()">
					<h4 class="fw-bold fs-6 mt-2"><sec:authentication property="principal.name" />님의 총 근태 일수</h4>
				</sec:authorize>	
				</div>
				<div class="col-12 bg-light">
					<table class="table table-sm mt-3">
						<thead class="text-center">
							<tr class="align-middle">
								<th class="table-secondary">총근무일수</th>
								<td class="form-control bg-white" style="width: 100px;">${monthlyAtt.totalWorkedDays }</td>
								<th class="table-secondary">평일근무일수</th>
								<td class="form-control bg-white" style="width: 100px;">${monthlyAtt.weekDayWorkedDays }</td>
								<th class="table-secondary">휴일근무일수</th>
								<td class="form-control bg-white" style="width: 100px;">${monthlyAtt.weekendWorkedDays }</td>
								<th class="table-secondary">결근일수</th>
								<td class="form-control bg-white" style="width: 100px;">${absentDay }</td>
							</tr>
						</thead>
					</table>
				</div>				
			</div>		
   		</div>
   </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://momentjs.com/downloads/moment.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	
	// 근무일자년/월/일
	let currentYear = parseInt(moment().format('YYYY'));
	let currentMonthFirstDay = moment().format("MM") + "-01";
	
	for (let i=0; i<5; i++) {
		let year = currentYear - i;
		let option = `<option value="\${year}" \${i==0 ? 'selected' : ''}>\${year}년</option>`;
		$("#work-date-year").append(option);
	}
	
		$("#work-date-month").val(currentMonthFirstDay);
	
	// 출근
	$("#work-start-time").click(function() {
		$("#form-attendances").attr("action", "checkStartTime").trigger('submit');
		
	})
	
	// 퇴근
	$("#work-end-time").click(function() {
		$("#form-attendances").attr("action", "checkEndTime").trigger('submit');
		
	})
	
	// 월 근태 확인
	$("#search-form").click(function() {
		
		let workDate = currentYear + "-" + currentMonthFirstDay;

		$("#form-attendances").attr("action", "att").trigger('submit');
	})
	
	// 체크박스 - 근태 삭제
	$("#delete-button").on('click', function() {
		let $deleteCheck = $(":input[name=deleteCheck]:checked");
		if ($deleteCheck.length == 0) {
			alert("삭제할 게시글을 선택하세요.");
			return;
		}
		
		$("#form-attendances").attr("action", "deleteAttendances").trigger('submit');
	})
	
})
</script>
</body>
</html>