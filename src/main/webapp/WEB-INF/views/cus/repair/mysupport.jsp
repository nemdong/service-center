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
			<h1 class="border bg-light p-2 fs-4">나의 지원</h1>
		</div>
	</div>
	<div class="row mb-5">
		<div class="row mb-3">
			<div class="col">
				<p class="text-center fs-4"><strong>나의 기기 선택하기</strong></p>
			</div>
		</div>
		<c:choose>
			<c:when test="${empty device }">
				<tr>
					<td class="text-center">현재 등록된 기기가 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="device" items="${device }">
					<div class="col-md-4" align="center">
						<c:choose>
							<c:when test="${device.deviceCategoryProduct == 'pad' }">
								<a href="mydevice?deviceNo=${device.deviceNo }">
									<img src="/resources/images/ipad.jpeg" width="300" height="350" class="img-thumbnail rounded mx-auto d-block" style="border:0px;" alt="패드"/>
								</a>
								<h3>${device.deviceCategoryName }</h3>
								<p>${device.deviceName }</p>
							</c:when>
							<c:when test="${device.deviceCategoryProduct == 'earPhone' }">
								<a href="mydevice?deviceNo=${device.deviceNo }">
									<img src="/resources/images/airpod.jpg" width="300" height="500" class="img-thumbnail rounded mx-auto d-block" style="border:0px;" alt="패드"/>
								</a>
								<h3>${device.deviceCategoryName }</h3>
								<p>${device.deviceName }</p>
							</c:when>
							<c:when test="${device.deviceCategoryProduct == 'phone' }">
								<a href="mydevice?deviceNo=${device.deviceNo }">
									<img src="/resources/images/image1.png" width="300" height="300" class="img-thumbnail rounded mx-auto d-block" style="border:0px;" alt="패드"/>
								</a>
								<h3>${device.deviceCategoryName }</h3>
								<p>${device.deviceName }</p>
							</c:when>
						</c:choose>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="row mb-3 text-bg-light p-3">
		<div class="col-12">
			<table class="table table-sm">
				<c:choose>
					<c:when test="${empty reservation }">
						<tr>
							<td class="text-center">현재 등록된 예약이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<h3 class="mb-5">예약현황</h3>
						<c:forEach var="reservation" items="${reservation }">
								<thead>
									<tr>
										<th>예약날짜</th>
										<th>예약장소</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><fmt:formatDate value="${reservation.reservationDate }" /></td>
										<td>${reservation.locationName }</td>
									</tr>
									<tr>
										<td><a href="reservationdetail?registrationNo=${reservation.registrationNo }">세부사항보기></a></td>
										<td></td>
									</tr>
								</tbody>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
	</div>
	
	<hr />
	<!-- 최근활동은 뺄지 말지 고민중 -->
	<div class="row mb-5">
		<div class="col-12">
			<table class="table table-sm">
				<h3 class="mb-5 text-center">최근활동</h3>
				<colgroup>
					<col width="30%">
					<col width="60%">
					<col width="*">
					<col width="*">
				</colgroup>
				<thead>
					<tr>
						<th>홍길동 iPhone : 배터리 서비스</th>
						<th></th>
						<th></th>
					</tr>
					
				</thead>
				<tbody>
					<tr>
						<td><strong>방문 매장 이름</strong> : Apple 명동</td>
						<td></td>
						<td class="text-end"><a href="">세부사항보기></a></td>
						<td></td>
					</tr>
					<tr>
						<td><strong>방문 날짜</strong> : 2023.05.10</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<hr />
	<div class="row mb-3 text-bg-light p-3" id="device-history">
		<div class="col-12">
			<table class="table table-sm d-none" id="table-history">
				<c:choose>
				<c:when test="${empty history }">
					<tr>
						<td class="text-center">수리내역이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<h3 class="mb-5 text-center">나의 수리 내역</h3>
						<colgroup>
							<col width="20%">
							<col width="*%">
						</colgroup>
					<c:forEach var="history" items="${history }">
						<thead>
							
						</thead>
						<tbody>
							<tr>
								<td class="bg-secondary text-white"><strong>기기 종류 :</strong>${history.deviceCategoryName}</td>
								<td></td>
							</tr>
		  					<tr>
								<td><strong>서비스명 :</strong>${history.serviceCatName}</td>
								<td></td>
							</tr>
							<tr>
								<td><strong>비용 :</strong> ${history.serviceCost} 원</th>
								<td></td>
							</tr>
						</tbody>
					</c:forEach>
				</c:otherwise>
				</c:choose>
			</table>
			<a href="" class="btn btn-primary" id="btn-toggle-display">나의 수리내역 보기</a>
		</div>
	</div>
	<hr />
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
/* $(function (){
	$("#device-history a").click(function(){
  		event.preventDefault();
  		var id = $(this).attr("data-customer-id");
  	
  		$.getJSON("/repair/mysupport.json", {customerId: id}, function(histories){
  			
  			$.each(histories, function(index, item) {
  				var row = `
  					<tr>
						<td><strong>기기 종류 :</strong> <span id="device-categoryName">\${item.deviceCategoryName}</span></td>
						<td></td>
					</tr>
  					<tr>
						<td><strong>서비스명 :</strong> <span id="device-serviceCatName">\${item.serviceCatName}</span></td>
						<td></td>
					</tr>
					<tr>
						<td><strong>비용 :</strong> <span id="service-cost">\${item.serviceCost} 원</span></th>
						<td></td>
					</tr>
  				`;
  				
  				$("#table-history tbody").append(row);
  			})
  			
  		})
  			
  		
  	});
	
}); */
$(function () {
	var $tableHistory = $("#table-history");
	
	$("#btn-toggle-display").click(function(event) {
		event.preventDefault();
		$tableHistory.toggleClass("d-none");

		if ($tableHistory.hasClass("d-none")) {
			$(this).text("나의 수리내역 보기 ");
		} else {
			$(this).text("닫기")
		}
	});
})
</script>
</body>
</html>