<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>애플리케이션</title>
</head>
<body>
<c:set var="menu" value="main" />
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
				<p class="text-center"><strong>나의 기기 선택하기</strong></p>
			</div>
		</div>
		<div class="col-md-4" align="center">
				<a href="">
					<img src="/resources/images/image1.png" width="300" height="300" class="img-thumbnail rounded mx-auto d-block" style="border:0px;" alt="패드"/>
				</a>
				<h3>iPad Pro 12.9</h3>
				<p>홍길동의 아이패드</p>
			</p>
		</div>
		<div class="col-md-4" align="center">
				<a href="">
					<img src="/resources/images/image1.png" width="300" height="300" class="img-thumbnail rounded mx-auto d-block" style="border:0px;" alt="에어팟"/>
				</a>
				<h3>AirPods</h3>
				<p>홍길동의 에어팟</p>
		</div>
		<div class="col-md-4" align="center">
				<a href="mydevice">
					<img src="/resources/images/image1.png" width="300" height="300" class="img-thumbnail rounded mx-auto d-block" style="border:0px;" alt="아이폰"/>
				</a>
				<h3>iPhone 14 Pro Max</h3>
				<p>홍길동의 아이폰</p>
		</div>
	</div>
	
	<div class="row mb-3 text-bg-light p-3">
		<div class="col-12">
			<table class="table table-sm">
				<h3 class="mb-5">예약현황</h3>
				<thead>
					<tr>
						<th>예약날짜</th>
						<th>예약장소</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2023년 1월 29일 오후 12:25</td>
						<td>Apple 명동</td>
					</tr>
					<tr>
						<td><a href="reservationdetail">세부사항보기></a></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
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
	<div class="row mb-3 text-bg-light p-3">
		<div class="col-12">
			<table class="table table-sm">
				<h3 class="mb-5">나의 수리 내역</h3>
				<colgroup>
					<col width="20%">
					<col width="*%">
				</colgroup>
				<thead>
					<tr>
						<th>iPhone 14 Pro Max</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><strong>서비스명 :</strong> 배터리 서비스</td>
						<td></td>
					</tr>
					<tr>
						<td><strong>비용 :</strong> 90,000원</th>
						<td></td>
					</tr>
					<tr>
						<td><a href="">더보기></a></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>