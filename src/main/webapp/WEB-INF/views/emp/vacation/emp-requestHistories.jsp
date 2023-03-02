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
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col-2">
			<c:set var="menu1" value="휴가관리" />
			<c:set var="menu2" value="요청내역"/>
			<%@ include file="../common/leftbar.jsp" %>
		</div>
		<div class="col-10">
			<table class="table">
				<colgroup>
					<col width="*">
					<col width="*">
					<col width="*">
					<col width="*">
				</colgroup>
				<thead>
					<tr>
						<th>요청종류</th>
						<th>요청사항</th>
						<th>요청사유</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty reqHistories }">
						<c:forEach var="history" items="${reqHistories }">
							<tr>
								<td>${history.requestType }</td>
								<td>
									<span class="badge bg-warning py-1 px-2">${history.catName }</span>
   									${history.start} ~ ${history.end }
								</td>
								<td>${history.note }</td>
								<td>
									<c:if test="${history.approvalStatus eq '대기중' }"><span class="badge text-bg-success py-2 px-2">${history.approvalStatus }</span></c:if>
									<c:if test="${history.approvalStatus eq '승인됨' }"><span class="badge text-bg-primary py-2 px-2">${history.approvalStatus }</span></c:if>
									<c:if test="${history.approvalStatus eq '거절됨' }"><span class="badge text-bg-secondary py-2 px-2">${history.approvalStatus }</span></c:if>
								</td>
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
			<c:if test="${not empty reqHistories }">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center pagination-sm">
						<li class="page-item">
							<a class="page-link ${pagination.first ? 'disabled' : '' }" 
								href="reqHistories?page=${pagination.prevPage }">이전</a>
						</li>	
						<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
							<li class="page-item">
								<a class="page-link ${pagination.page eq num ? 'active' : '' }" href="reqHistories?page=${num }">${num }</a>
							</li>	
						</c:forEach>
						
						<li class="page-item">
							<a class="page-link ${pagination.last ? 'disabled' : '' }" 
								href="reqHistories?page=${pagination.nextPage }">다음</a>
						</li>	
					</ul>
				</nav>
			</c:if>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>