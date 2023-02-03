<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<title>서비스 센터</title>
</head>
<body>
<c:set var="menu" value="home" />
<%@ include file="../emp/common/navbar.jsp" %>
<style>
	
</style>
<div class="container">
	<div class="row mt-5">
		<div class="col-6 offset-3">
			<form class="border bg-light p-3">
				<h5>
					<div class="fw-bold mb-1">로그인</div>
				</h4>
					<div class="input-group mb-1">
					     <div class="input-group-text bg-white"><i class="bi bi-person-circle"></i></div>
					     <input type="text" class="form-control" name="empNo" placeholder="사원번호">
				    </div>
					<div class="input-group mb-2">
					     <div class="input-group-text bg-white"><i class="bi bi-lock-fill"></i></div>
					     <input type="password" class="form-control" name="password" placeholder="비밀번호">
				    </div>
				    <div>
				    	<button type="button" class="form-control btn btn-primary">로그인</button>
				    </div>
				    <div class="mt-2 text-end">
				    	<a href="/emp/change-password" class="me-2 text-decoration-none text-secondary">비밀번호 변경</a>
				    	<a href="/emp/find-password" class="text-decoration-none text-secondary">비밀번호 찾기</a>
				    </div>
			</form>	
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>