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
			<div class ="col-md-5">
				<img src="/resources/images/image1.png" style="width: 80%" style="border:0px;" />
			</div>
			<div class="col-md-6" align="center">
				<h3>홍길동 iPhone</h3>
				<p>디바이스 설명</p>
				<p><b>구일일</b> : 2023년05월01일</p>
			</div>
	</div>
	<hr>
	<div class="row mb-3" align="center">
		<div class="col">
			<h3>최근활동</h3>
			<p>최근 90일 이내의 활동이 없습니다.</p>
			<table class="table table-sm">
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
						<td></td>
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
	<div class="row mb-5" align="center">
		<div class="col">
			<table class="table table-sm">
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
						<td></td>
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
			여기에 테이블 형식으로 수리내용이면 수리내용, 채팅했으면 채팅했다는 기록, 예약했으면 예약내용
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>