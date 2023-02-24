<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title></title>
</head>
<body>
<c:set var="menu" value="repair" />
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-2"></div>
		
		<div class="col-10">
			<div class="row mb-5">
				<div class="col-12 mb-3">
					<h1>접수하기</h1>
				</div>
				<div class="col-10 border-bottom"></div>
			</div>
			
			<div class="row">
				<div class="col-2 mb-4">
					<span class="p-2" style="display:inline-block; height:120px; width:150px;">	
						<c:choose>
							<c:when test="${device.deviceCategoryProduct == 'phone' }">
								<image src="/resources/images/samplePhone-1.png" width="110" height="110" class="img-thumnail rounded mx-auto d-block">
							</c:when>
							<c:when test="${device.deviceCategoryProduct == 'pad' }">
								<image src="/resources/images/simplePad-1.png" width="110" height="110" class="img-thumnail rounded mx-auto d-block">
							</c:when>
							<c:otherwise>
								<image src="/resources/images/earphone-pro.png" width="110" height="110" class="img-thumnail rounded mx-auto d-block">
							</c:otherwise>
						</c:choose>
					</span>
				</div>
				<div class="col-10">
					<h2><strong><strong>(문제) ${serviceInfo.serviceCatName }</strong></h2>
					<p class="text-danger">${device.deviceCategoryName }</p>
					<a href="device" style="text-decoration:none;"><strong>기기 변경</strong></a>
				</div>
				<div class="col-10 border-bottom mb-5"></div>
			</div>
			
			<p><strong>해결 방법</strong><p>
			
			<div class="row">
				<div class="col-12">
					<a href="visitingCenter" class="border me-5 text-center p-4 mt-2" style="text-decoration:none; color:black; display:inline-block; height:300px; width:250px;">
						<image src="/resources/images/건물.png" width="200" height="200" class="img-thumnail rounded mx-auto d-block">
						<br>
						<strong>매장에 직접 방문</strong>
					</a>
					<a href="appointmentPlace?way=appoint" class="border me-5 text-center p-4" style="text-decoration:none; color:black; display:inline-block; height:300px; width:250px;">
						<image src="/resources/images/장소.png" width="200" height="200" class="img-thumnail rounded mx-auto d-block">
						<br>
						<strong>지정 장소 접수</strong>
					</a>
					<a href="pickUp" class="border text-center p-4" style="text-decoration:none; color:black; display:inline-block; height:300px; width:250px;">
						<image src="/resources/images/택배.png" width="200" height="200" class="img-thumnail rounded mx-auto d-block">
						<br>
						<strong>픽업 서비스</strong>
					</a>
				</div>
			</div>	
		</div>
		
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>