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
			<button id="reservation-status" class="btn ${param.status eq '예약가능' ? 'btn-success' : 'btn-secondary'} btn-sm mb-5" aria-pressed="false" >
				<span>예약 가능 매장</span>					<!--예약가능한지를 사용하려면 구분하는 조건을 사용해서 status가 예약가능 인지를 확인하는 코드를 하나 사용해줘야함  -->
			</button>
		</div>
	</div>
	<form id="form-search" action="visitreservation" method="get">
	<div class="row">
		<div class="col-4">
			<p><strong class="fs-4">서비스 받을 센터 검색하기</strong></p>
			<input type="hidden" name="status" value="예약가능" ${param.status eq '예약가능' ? '' : 'disabled'}> 
			<input type="hidden" name="way" value="${param.way }"> 
			<!-- false면 disabled로 값 안넘겨줌, 예약가능 조건과 검색을 두개 다 이용하려면 구분이 되는 조건을 걸어줘야함 여긴 disabled로 표시, 위에 a태그는 btn-success secondary로 표시-->
 			<input type="text" class="form-control form-control-xs w-150" name="keyword" value="${param.keyword }"> <!-- value를 사용함으로써 입력값 유지 -->
			<button type="btn-search" id="btn-search" class="btn btn-outline-secondary btn-xs">검색</button>
		</div>
	</div>
	</form>
	<div class="row mb-3">
		<div class="col-6">
			<c:forEach var="locations" items="${locations }">
			<div class="row">
				<div class="col">
					<a href="reservationdate?locationNo=${locations.locationNo }" class="border m-3 p-3" style="color:black; text-decoration:none; display:inline-block; height:200px; width:570px;">
						<p>
							<strong>${locations.locationName }</strong>
							<span id="status-category" style="float:right; color:#008000"><strong>${locations.status }</strong></span>
						</p>
						<p>${locations.locationBasicAddress }</p>
						<p>${locations.locationDetailAddress }</p>
						<hr />
						<p>예상 비용: ￦<fmt:formatNumber value="${serviceInfo.serviceAmount }" pattern="#,###" /> 원</p>
					</a>
				</div>
			</div>
			</c:forEach>
		</div>
		<div class="col-6" id="map" style="width:500px;height:600px;"></div>
	</div>
	<hr />
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b1e58dd5f8d7b285c02485610e447db4&libraries=services"></script>
<script>
$(function() {
	// status가 예약가능 이거나 아니면 예약가능&예약불가능 두가지 경우, keyword로 검색한 지도의 마커 위치를 조회 
	// 처음 페이지를 들어가면 둘다 값이 비어있는 상태.
	var statusValue = $(":input[name=status]:not(:disabled)").val(); //버튼이 눌러져있으면 예약가능, 안눌러져있으면 undefined
	var keywordValue = $(":input[name=keyword]").val();
	var wayValue = $(":input[name=way]").val();
	let param = {keyword: keywordValue};
	if (statusValue) { //true일 때, 즉 예약가능 매장보기 버튼을 눌렀을 때만 값이 들어가도록.
		param['status'] = statusValue;			// let param = {keyword: keywordValue} keyword라는 key에 value를 넣는것. param['status'] = statusValue;	status 키워드에 value를 담는 표현식임. 
	}
	$.ajax({
		url : "locations",
		type : "get",
		data: param, 
		dataType : "json",
		success : function(data){
			console.log(data);
			
			var mapContainer = document.getElementById('map');// 지도를 표시할 div 
			var mapOption = {
				center: new kakao.maps.LatLng(data[0].locationLatitude, data[0].locationLongitude), //지도의 중심좌표 설정
				level: 3 // 지도의 확대 레벨
			};
			
			var map = new kakao.maps.Map(mapContainer, mapOption); //지도 생성 및 객체 리턴
			
			for(var i=0; i<data.length; i++){
				
				// json으로 값을 받아서 마커 생성
				var marker = new kakao.maps.Marker({
					map : map,
					position : new kakao.maps.LatLng(data[i].locationLatitude, data[i].locationLongitude)	// 마커 위치를 위도 경도로
				});
				
				// 마커에 표시할 인포윈도우를 생성합니다 
			    var infowindow = new kakao.maps.InfoWindow({
			    	content : '<div style="width:150px;text-align:center;padding:6px 0;">' + data[i].locationName + '</div>'
			    });

			    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
			    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
				
			}
			
			
			// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
			function makeOverListener(map, marker, infowindow) {
			    return function() {
			        infowindow.open(map, marker);
			    };
			}

			// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
			function makeOutListener(infowindow) {
			    return function() {
			        infowindow.close();
			    };
			}
			
		},
		error : function(error){
		   alert("지도 오류");
		}
	});
	
}); 


//.prop("disabled", false); 버튼 활성화
//.prop("disabled", true); 버튼 비활성화
// 예약가능 버튼을 누른 상태가 아닐 때는 btn-secondary 상태 , disabled를 활성화 처리
$('#reservation-status').click(function() {
	if ($(this).hasClass('btn-secondary')) {
		$(":input[name=status]").prop("disabled", false);
	}
	// 예약가능 매장 보는 버튼이 success면 disabled 처리, 눌러져있는데 또 누르면 해제(disabled 조건으로 바꿔준다.)
	if ($(this).hasClass('btn-success')) {
		$(":input[name=status]").prop("disabled", true);
	}
		
	$("#form-search").trigger("submit");	//visitreservation으로 submit
		
});

</script>
</body>
</html>