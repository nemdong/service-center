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
		<div class="col-12">
			<h1 class="border bg-light p-2 fs-4">원하시는 서비스를 선택하세요</h1>
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
   								<td><strong>사용자 이름 :</strong></td>
   								<td colspan="3"><sec:authentication property="principal.name"/> </td>
   							</tr>
   						</tbody>
   						<tbody>
   							<tr>
   								<td><strong>사용자 아이디 :</strong></td>
   								<td colspan="3"><sec:authentication property="principal.id"/> </td>
   							</tr>
   						</tbody>
   					</table>
   				</div>
   				<div class="row">
   					<table class="table table-sm">
   						<tbody>
   							<td></td>
   						</tbody>
   					</table>
   				</div>
   				<div class="row">
   					<div class="col-md-6">
   						<img src="/resources/images/image1.png" width="250" height="250" class="img-thumbnail rounded mx-auto d-block" style="border:0px;" alt="아이폰"/>
	 				<div class="row mb-5">
	 					<table class="table table-sm">
	 						<tbody>
	 							<tr>
	 								<td colspan="3" class="text-center"><strong>제품 확인/선택하기</strong></td>
	 							</tr>
	 						</tbody>
	 					</table>
	 					<div class="d-grid gap-2 col-6 mx-auto">
	 						<a href="../reservation/device" class="btn btn-primary btn-lg">수리 요청 및 예약하기</a>
	 					</div>
	 				</div>
   				</div>
   				<div class="col-md-6">
   					<img src="/resources/images/image1.png" width="250" height="250" class="img-thumbnail rounded mx-auto d-block" style="border:0px;" alt="아이폰"/>
		   				<div class="row mb-5">
		   					<table class="table table-sm">
		   						<tbody>
		   							<tr>
		   								<td colspan="3" class="text-center"><strong>나의 수리찾기</strong></td>
		   							</tr>
		   						</tbody>
		   					</table>
				   			<div class="d-grid gap-2 col-6 mx-auto">
				   				<a href="mysupport" class="btn btn-secondary btn-lg">나의 지원들어가기</a>
				   			</div>
		   				</div>
   				</div>
   			</div>
   		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>