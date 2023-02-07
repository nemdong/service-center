<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<title>애플리케이션</title>
</head>
<body>
<c:set var="menu" value="repair" />
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col">
			<h1 class="border bg-light p-2 fs-4">예약하기</h1>
		</div>
	</div>
	<div class="row mb-5">
		<div class="row mb-3">
			<div class="col">
				<h3 class="fs-1 fw-bolder">Apple 명동</h3>
				<p><img src="/resources/images/store1.jpg" width="980" height="550" class="img-thumbnail rounded mx-auto d-block" style="border:0px;" alt="명동 스토어"/></p>
			</div>
		</div>
	</div>
	<hr	>
	<div class="row mb-3">
		<div class="col">
			<h3 class="fs-3 fw-bolder">예약하기</h3>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-7">
			<div class="border m-3 p-3 text-bg-light" style="color:black; text-decoration:none; display:inline-block; height:300px; width:600px;">
				<span class="fs-5"><strong>일(예약하실 날짜를 선택하세요.)</strong></span>
				<p>
					<input class="datepicker">
				</p>
				<p class="fs-5"><strong>시간</strong></p>
				<p>매장의 현지 시간</p>
				<select class="form-select form-select-sm mb-4" name="time">
					<option style="font-weight:bold; background-color: gray ">오전(AM)</option>
					<option value="" selected>오전 10:00</option>
					<option value="">오전 11:00</option>
					<option style="font-weight:bold; background-color: gray">오후(PM)</option>
					<option value="">오후 12:00</option>
					<option value="">오후 13:00</option>
					<option value="">오후 14:00</option>
					<option value="">오후 15:00</option>
					<option value="">오후 16:00</option>
					<option value="">오후 17:00</option>
					<option value="">오후 18:00</option>
					<option value="">오후 19:00</option>
					<option value="">오후 20:00</option>
					<option value="">오후 21:00</option>
				</select>
				<a href="" class="btn btn-primary btn-sm fs-6" data-bs-toggle="modal" data-bs-target="#modal-form-reservation">계속하기</a>
			</div>
		</div>
		<div class="col-5">
			<div class="border m-3 p-3 text-bg-light" align="center" style="color:black; text-decoration:none; display:inline-block; height:300px; width:500px;">
				<span class="fs-5"><strong>수리세부사항</strong></span>
				<p><img src="/resources/images/image1.png" class="img-thumbnail rounded mx-auto d-block" width="20%" height="20%" style="border:0px;" alt="명동 스토어"/></p>
				<span class="fs-5"><strong>iPhone 14 Pro Max</strong></span>
				<hr style="width: 50%">
				<p>배터리 서비스</p>
				<p>예상 비용: ￦79,200</p>
			</div>
		</div>
	</div>
	<hr>
	<div class="row mb-3">
		<div clss="col">
			<h3>매장위치</h3>
			<p>서울 중구 남대문로 2가 9-1 하이드파크</p>
			<div id="map" style="width:80%;height:350px;"></div>
			<p class="fs-6"><strong>매장 영업시간</strong></p>
			<p>월 오전10:00-오후10:00</p>
			<p>화 오전10:00-오후10:00</p>
			<p>수 오전10:00-오후10:00</p>
			<p>목 오전10:00-오후10:00</p>
			<p>금 오전10:00-오후10:00</p>
			<p>토 오전10:00-오후10:00</p>
			<p>일 오전10:00-오후10:00</p>
		</div>
	</div>
	<hr />
	<p>푸터</p>
	<p>푸터</p>
	<p>푸터</p>
	<p>푸터</p>
</div>
<div class="modal" tabindex="-1" id="modal-form-reservation">
	<div class="modal-dialog modal-lg">
		<form class="p-3" method="get" action="reservation-success">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title text-center">고객님의 예약 세부 사항을 검토해 주세요. </h3>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" align="center">
				<div class="row mb-2">
					<div class="col-sm-12">
						<p><img src="/resources/images/calendar.png" width="100" height="100" class="img-thumbnail" style="border:0px;" alt="달력"/></p>
						<p><strong class="fs-4">5월 1일 일요일, 12:25 PM</strong></p>
					</div>
				</div>
				<div class="row mb-2">
					<div class="col-sm">
						<p>Apple 명동</p>
						<p>중구 남대문로2가9-1 하이드파크</p>
					</div>
				</div>
				<hr/>
				<div class="row">
					<div class="col-sm-3" align="center">
						<h3><strong>문제</strong></h3>
					</div>
					<div class="col-sm-9">
						<p>iPhone 14 Pro Max</p>
						<p>배터리 서비스</p>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary btn-xs">지금 예약하기</button>
			</div>
		</div>
		</form>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b1e58dd5f8d7b285c02485610e447db4&libraries=services"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('중구 남대문로 2가 9-1 하이드파크 영등포구', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">Apple 명동</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});
$.datepicker.setDefaults({
	  dateFormat: 'yy-mm-dd',
	  prevText: '이전 달',
	  nextText: '다음 달',
	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	  showMonthAfterYear: true,
	  yearSuffix: '년'
	});

	$(function () {
	  $('.datepicker').datepicker({ minDate: 0});
	});
</script>
</body>
</html>