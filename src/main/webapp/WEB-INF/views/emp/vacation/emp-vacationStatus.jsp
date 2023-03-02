<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<title>애플리케이션</title>
</head>
<style>
#modal-note-vacation .modal-dialog {
  max-width: 30%;
}

.modal-body {
  height: 60px;
}
</style>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col-2">
			<c:set var="menu1" value="휴가관리" />
			<c:set var="menu2" value="연차현황" />
			<%@ include file="../common/leftbar.jsp" %>
		</div>
		<div class="col-10">
			<table class="table table-bordered table-secondary">
				<colgroup>
					<col width="*">
					<col width="*">
					<col width="*">
				</colgroup>
				<c:choose>
					<c:when test="${not empty vacCount }">
						<tr>
							<th>부여 연차일수</th><td>${vacCount.totalCount }</td>
							<th>사용 연차일수</th><td>${vacCount.usedCount }</td>
							<th>잔여 연차일수</th><td>${vacCount.remainingCount }</td>
						</tr>
					</c:when>
				</c:choose>
			</table>
			<div class="row mb-3">
				<div class="col-12">
					<table class="table" id="table-history-list">
						<colgroup>
							<col width="*">
							<col width="*">
							<col width="*">
							<col width="*">
							<col width="*">
							<col width="*">
						</colgroup>
						<thead>
							<tr>
								<th>대상자</th>
								<th>휴가기간</th>
								<th>휴가구분</th>
								<th>소요시간</th>
								<th>차감일수</th>
								<th>사유</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${not empty vacStatus }">
								<c:forEach var="history" items="${vacStatus }">
									<tr>
										<td>${history.empName }</td>
										<td>
											<span class="badge bg-warning py-1 px-2">${history.catName }</span>
		   									${history.start} ~ ${history.end }
										</td>
										<td>${history.catName }</td>
										<td>
										<c:choose>
										    <c:when test="${history.catNo eq 100}">
										      ${history.consumptionTimes}h
										    </c:when>
										    <c:otherwise>
										     ${history.minusTimes }h
										    </c:otherwise>
										  </c:choose>
										</td>
										<td>
										  <c:choose>
										    <c:when test="${history.catNo eq 100}">
										      ${history.period}일
										    </c:when>
										    <c:otherwise>
										      ${history.minusDays}일
										    </c:otherwise>
										  </c:choose>
										</td>
										<td><i class="bi bi-chat-square-dots" data-vacation-note="${history.note }"></i></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
   								<tr>
   									<td colspan="5" class="text-center">요청내용이 없습니다.</td>
   								</tr>
   							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
					<c:if test="${not empty vacStatus }">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center pagination-sm">
								<li class="page-item">
									<a class="page-link ${pagination.first ? 'disabled' : '' }" 
										href="vacStatus?page=${pagination.prevPage }">이전</a>
								</li>	
								<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
									<li class="page-item">
										<a class="page-link ${pagination.page eq num ? 'active' : '' }" href="vacStatus?page=${num }">${num }</a>
									</li>	
								</c:forEach>
								
								<li class="page-item">
									<a class="page-link ${pagination.last ? 'disabled' : '' }" 
										href="vacStatus?page=${pagination.nextPage }">다음</a>
								</li>	
							</ul>
						</nav>
					</c:if>
				</div>
			</div>
			<div class="modal" id="modal-note-vacation">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">요청 사유</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">닫기</button>
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
$(function(){
	
	let vacationNoteModal = new bootstrap.Modal("#modal-note-vacation");
	
	$("#table-history-list tbody i[data-vacation-note]").click(function() {
	  let note = $(this).attr("data-vacation-note");
	  if (!note) {
		  $("#modal-note-vacation .modal-body").text("요청 사유가 없습니다.");
	  } else {
		  $("#modal-note-vacation .modal-body").text(note);
	  }
	  vacationNoteModal.show();
	});
	
});
</script>
</body>
</html>