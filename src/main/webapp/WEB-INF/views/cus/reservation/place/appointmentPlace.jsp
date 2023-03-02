<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title></title>
</head>
<body>
<c:set var="menu" value="reservation" />
<%@ include file="../../common/navbar.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-2"></div>
		
		<div class="col-10">
			<div class="row mb-4">
				<div class="col-12 mb-3">
					<h1>지정 장소 접수</h1>
				</div>
				<div class="col-10 border-bottom"></div>
			</div>
			
			<div class="row mb-4">
				<div class="col-12 mb-2">
					<p><strong>${device.deviceCategoryName }</strong> <strong class="text-danger" style="font-size:30px;">${serviceInfo.serviceCatName }</strong></p>
					<p>
						지정 장소 선택 후 접수
						</br>- 일 2회 회수 <a class="ms-3" href="device" style="text-decoration:none;"><strong>(기기 변경)</strong></a>
					</p>
				</div>
				<div class="col-10 border-bottom"></div>
			</div>
			
			<p>지정 장소 찾기</p>
			
			<div class="row">
				<div class="col-12 mb-3">
					<table>
						<col width="20%">
						<col width="30%">
						<col width="10%">
						<col width="40%">
						<tbody>
							<tr>
								<th class="pe-1">
									<select class="form-select form-select-sm" aria-label=".form-select-sm example">
										<option selected>도/시 선택</option>
										<c:forEach var="region" items="${regions }">
											<option value="${region.no }">${region.regionName }</option>
										</c:forEach>
									</select>
								</th>
								<th class="pe-3">
									<select class="form-select form-select-sm" aria-label=".form-select-sm example">
										<option selected>구 선택</option>
										<option value="1">One</option>
										<option value="2">Two</option>
										<option value="3">Three</option>
									</select>
								</th>
								<th>
									<button type="button" class="btn btn-outline-secondary btn-xs" id="find-location">찾기</button>
								</th>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="row ">
					<div class="col-5" style="height:500px; overflow-y:scroll;" id="change-map">
					
						<c:forEach var="location" items="${locations }">
							<form id="send-location" method="get" action="choiceDay">
								<div class="border mt-2 pt-1 ps-2" style="cursor:Pointer" data-lat="${location.locationLatitude }" data-lon="${location.locationLongitude }">
									<input type="hidden" value="${location.locationNo }" name="locationNo" id="location-info" />
									<div><span><strong style="font-size:20px;">${location.locationName }</strong></span></div>
									<div class="pt-2"><span>주소: ${location.locationBasicAddress }</span></div>
									<div class="d-flex justify-content-between pt-1">
										<span>회수 시간 - ${location.pickupDescription }</span>
										<button type="submit" class="btn btn-outline-secondary btn-xs">선택</button>
									</div>
								</div>
							</form>
						</c:forEach>
						
					</div>
					<div class="col-7 ms-3" id="map" style="width:500px;height:500px;" id="appoint-map"></div>
				</div>
				
			</div>
			
		</div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6688b3635c7bb0e03ca4f33c55d156ba"></script>
<script>
	// 찾기 버튼
	$("#find-location").click(function() {
		
		//...
		///
		a = 경
		
		receiveData(a, b);
		
	});
	
	// 박스 클릭시
	$("#send-location").click(function() {
		
	});
	
	var map;
	function receiveData(a, b){
		
		var data = {way : "appoint"};
		if (a && b) {
			data.sido = a;
			data.gugun = b;
		}
		
	   	$.ajax({
			url : "appointmentPlace",
			type : "post",
			data : data,
			dataType : "json",
			success : function(data){
				console.log(data);
				
				var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
				var options = { //지도를 생성할 때 필요한 기본 옵션
					center: new kakao.maps.LatLng(data[0].locationLatitude, data[0].locationLongitude), //지도의 중심좌표.
					level: 3 //지도의 레벨(확대, 축소 정도)
				};
				
				map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
				
				for(var i=0; i<data.length; i++){
				
					// title과 위치를 json으로 전달받아 지도에 마커 표시
					var marker = new kakao.maps.Marker({
						map : map,	// 마커를 표시할 지도
						title : data[i].locationName,	// 마커 이름
						position : new kakao.maps.LatLng(data[i].locationLatitude, data[i].locationLongitude)	// 마커 위치
					});
				}
				
			},
			error : function(error){
			   alert("지도 오류");
			}
			
	   	});
	}
	
	receiveData();
	
	// 지도 중심 마커 변경
	$("#change-map").on('click', 'div[data-lat]', function() {
		let latitude = $(this).attr("data-lat");
		let longitude = $(this).attr("data-lon")
		
		var moveLatLon = new kakao.maps.LatLng(latitude, longitude);
		map.setCenter(moveLatLon);
		
	})
	
</script>
</body>
</html>