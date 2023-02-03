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
		<div class="col-12">
			<h1 class="border bg-light p-2 fs-4">수리 및 문의/상담</h1>
		</div>
	</div>
	<div class="row mb-5">
		<div class="col-md-4">
	   		<img src="/resources/images/icon.png" width="150" height="150" class="img-thumbnail rounded mx-auto d-block" style="border:0px;" alt="사람모양"/>
	   	</div>
		<div class="col-8">
				<table class="table table-sm">
					<colgroup>
						<col width="14%">
						<col width="36%">
						<col width="14%">
						<col width="36%">
					</colgroup>
					<thead>
					</thead>
					<tbody>
						<tr>
							<th>사용자 이름 :</th>
							<td colspan="3">홍길동</td>
						</tr>
					</tbody>
					<tbody>
						<tr>
							<th>사용자 아이디 :</th>
							<td colspan="3">hong@naver.com</td>
						</tr>
					</tbody>
				</table>	
		</div>
	</div>
	<hr>
   	<div class="row mb-3">
   		<div class="col-12">
   			<p class="text-center">원하시는 요청을 선택하세요.</p>
			<div class="d-grid gap-2 col-6 mx-auto">
				<a href="request" class="btn btn-primary btn-sm">수리 요청 및 확인</a>
				<a href="" class="btn btn-primary btn-sm">문의 및 상담하기</a>
			</div>
   		</div>
   	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>