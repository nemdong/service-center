<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
				
				<p>고객님은 현재 <strong>ㅇㅇㅇㅇ</strong> 계정으로 접속 중입니다</p>
			</div>
			<div class="col-10 mb-5 border-top"></div>
			
			<div class="row">
				<div class="col-12 mb-3">
					<p><strong>나의 기기</strong></p>
					
					<a href="reason" class="border text-center m-3 p-3" style="color:black; text-decoration:none; display:inline-block; height:200px; width:250px;">
						<strong>"이름"의 phone</strong>
						<br>샘플폰1
					</a>
					<a href="reason" class="border text-center m-3 p-3" style="color:black; text-decoration:none; display:inline-block; height:200px; width:250px;">
						<strong>"이름"의 earPhone</strong>
						<br>공기팟 Pro
					</a>
					<a href="reason" class="border text-center m-3 p-3" style="color:black; text-decoration:none; display:inline-block; height:200px; width:250px;">
						<strong>"이름"의 pad</strong>
						<br>심플패드 Air
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