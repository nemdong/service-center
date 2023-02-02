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
			
			<div class="row">
				<div class="col-2 mb-4">
					<span class="border" style="display:inline-block; height:120px; width:150px;">그림</span>
				</div>
				<div class="col-10">
					<h2><strong>"이름"의 phone</strong></h2>
					<p>샘플폰1</p>
					<a href="device" style="text-decoration:none;"><strong>기기 변경</strong></a>
				</div>
				<div class="col-10 border-bottom mb-5"></div>
			</div>
			
			<p><strong>어떤 주제의 도움이 필요하십니까?</strong></p>
			
			<div class="row">
				<div class="col-12">
					<a href="way" class="border mt-2 mx-4 p-3" style="text-decoration:none; color:black; display:inline-block; height:100px; width:400px;">배터리 교체</a>
					<a href="way" class="border  p-3" style="text-decoration:none; color:black; display:inline-block; height:100px; width:400px;">액정 수리</a>
					<a href="way" class="border mt-3 mx-4 p-3" style="text-decoration:none; color:black; display:inline-block; height:100px; width:400px;">후면 수리</a>
					<a href="way" class="border  p-3" style="text-decoration:none; color:black; display:inline-block; height:100px; width:400px;">충전 단자 수리</a>
					<a href="way" class="border mt-3 mx-4 p-3" style="text-decoration:none; color:black; display:inline-block; height:100px; width:400px;">침수</a>
					<a href="way" class="border  p-3" style="text-decoration:none; color:black; display:inline-block; height:100px; width:400px;">카메라 수리</a>
					<a href="way" class="border mt-3 mx-4 p-3" style="text-decoration:none; color:black; display:inline-block; height:100px; width:400px;">전원 문제</a>
					<a class="border p-3" style="text-decoration:none; color:black; display:inline-block; height:100px; width:400px;">직접 입력</a>
				</div>
			</div>	
		
		</div>
		
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>