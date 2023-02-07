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
			<h1 class="border bg-light p-2 fs-4">방문 예약 서비스 신청하기</h1>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<p><img src="/resources/images/calendar.png" width="100" height="100" class="img-thumbnail" style="border:0px;" alt="달력"/><strong class="fs-4">&nbsp; 방문 일정 예약하기</strong></p>
			<p><strong class="fs-4">서비스 받을 센터 선택하기</strong></p>
			<button type="submit" class="btn btn-secondary btn-sm mb-5" aria-pressed="false">
				<span>예약 가능 매장</span>
			</button>
		</div>
	</div>
	<div class="row">
		<div class="col-6">
			<div class="row">
				<div class="col">
					<a href="reservationdate" class="border m-3 p-3" style="color:black; text-decoration:none; display:inline-block; height:200px; width:570px;">
						<p>
							<strong>Apple 명동</strong>
							<span style="float:right; color:#008000"><strong>예약 가능</strong></span>
						</p>
						<p>1.6km 서울</p>
						<p>중구 남대문로2가9-1 하이드파크</p>
						<hr />
						<p>* 예상비용 : ￦79,200</p>
					</a>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<a href="center?" class="border m-3 p-3" style="color:black; text-decoration:none; display:inline-block; height:200px; width:570px;">
						<p>
							<strong>Apple 명동</strong>
							<span style="float:right; color:#008000"><strong>예약 불가능</strong></span>
						</p>
						<p>1.6km 서울</p>
						<p>중구 남대문로2가9-1 하이드파크</p>
						<hr />
						<p>* 예상비용 : ￦79,200</p>
					</a>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<a href="center?" class="border m-3 p-3" style="color:black; text-decoration:none; display:inline-block; height:200px; width:570px;">
						<p>
							<strong>Apple 명동</strong>
							<span style="float:right; color:#008000"><strong>예약 가능</strong></span>
						</p>
						<p>1.6km 서울</p>
						<p>중구 남대문로2가9-1 하이드파크</p>
						<hr />
						<p>* 예상비용 : ￦79,200</p>
					</a>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<a href="center?" class="border m-3 p-3" style="color:black; text-decoration:none; display:inline-block; height:200px; width:570px;">
						<p>
							<strong>Apple 명동</strong>
							<span style="float:right; color:#008000"><strong>예약 불가능</strong></span>
						</p>
						<p>1.6km 서울</p>
						<p>중구 남대문로2가9-1 하이드파크</p>
						<hr />
						<p>* 예상비용 : ￦79,200</p>
					</a>
				</div>
			</div>
		</div>
		<div class="col-6" id="map" style="width:500px;height:600px;"></div>
		<div class="row">
			<div class="col">
				<button type="button" class="btn btn-link fs-4" id="btn_toggle">더보기 ></button>
			</div>
		</div>
	</div>
	<hr />
	<p>푸터부</p>
	<p>푸터부</p>
	<p>푸터부</p>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b1e58dd5f8d7b285c02485610e447db4&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.559722, 126.975278), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

</script>
</body>
</html>