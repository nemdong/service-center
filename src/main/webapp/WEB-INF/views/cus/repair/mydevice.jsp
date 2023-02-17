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
			<h1 class="border bg-light p-2 fs-4">나의 기기</h1>
		</div>
	</div>
	<div class="row mb-5" align="center">
		<c:choose>
			<c:when test="${empty device }">
				<tr>
					<td class="text-center">현재 등록된 기기가 없습니다.</td>
				</tr>
			</c:when>
			<c:when test="${device.deviceCategoryProduct == 'pad' }">
				<div class ="col-md-5">
					<img src="/resources/images/ipad.jpeg" style="width: 80%" style="border:0px;" />
				</div>
			</c:when>
			<c:when test="${device.deviceCategoryProduct == 'earPhone' }">
				<div class ="col-md-5">
					<img src="/resources/images/airpod.jpg" style="width: 80%" style="border:0px;" />
				</div>
			</c:when>
			<c:when test="${device.deviceCategoryProduct == 'phone' }">
				<div class ="col-md-5">
					<img src="/resources/images/image1.png" style="width: 80%" style="border:0px;" />
				</div>
			</c:when>
		</c:choose>
			<div class="col-md-6" align="center">
				<h3>${device.deviceName }</h3>
				<p>${device.deviceCategoryName }</p>
				<p><b>구입일</b> : <fmt:formatDate value="${device.sellDate }" /></p>
			</div>
	</div>
	<hr>
	<div class="row mb-3" align="center">
		<div class="col">
			<h3>90일 이내의 최근활동</h3>
			<c:choose>
				<c:when test="${empty categoryHistory }">
						<p class="text-center">최근 90일 이내의 활동이 없습니다.</p>
				</c:when>
				<c:otherwise>
					<c:forEach var="categoryHistory" items="${categoryHistory }">
						<table class="table table-sm">
							<colgroup>
								<col width="30%">
								<col width="60%">
								<col width="*">
								<col width="*">
							</colgroup>
							<thead>
								<tr>
									<th>${device.deviceName } : ${categoryHistory.serviceCatName }</th>
									<th></th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><strong>접수 방법 </strong> : ${categoryHistory.locationWays } 접수</td>
									<td><strong>방문 매장 이름</strong> : ${categoryHistory.locationName }</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td><strong>수리 예약 및 접수 날짜</strong> : <fmt:formatDate value="${categoryHistory.registrationDate }"/></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td><strong>수리 완료 날짜</strong> : <fmt:formatDate value="${categoryHistory.processCompletedDate }"/></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>