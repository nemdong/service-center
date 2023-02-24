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
			
			<div class="row mb-2">	
				<div class="col-12 mb-3">
					<h2><strong>지원 선택</strong></h2>
				</div>
				
				<p>고객님은 현재 <strong class="text-danger">${loginCustomer.id }</strong> 계정으로 접속 중입니다</p>
			</div>
			<div class="col-10 mb-5 border-top"></div>
			
			<div class="row">
				<div class="col-12 mb-3">
					<p><strong>나의 기기</strong></p>
					
						<c:forEach var="device" items="${deviceInfos}">
								<a href="reason?deviceCategoryNo=${device.deviceCategoryNo }" class="border text-center m-3 p-3" style="color:black; text-decoration:none; display:inline-block; height:210px; width:250px;">
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
									<br><strong>"${loginCustomer.name }"의</strong>
									<br>${device.deviceName }
								</a>
						</c:forEach>
						
				</div>
			</div>
		</div>
		
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>