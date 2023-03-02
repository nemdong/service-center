<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<title>직원 로그인</title>
</head>
<body>
<c:set var="menu" value="home" />
<%@ include file="../emp/common/navbar.jsp" %>
<div class="container">
   <div class="row mt-5">
		<div class="col-6 offset-3">
			<c:if test="${param.error eq 'fail'}">
				<div class="alert alert-danger">
					<strong>로그인 실패</strong> 아이디 혹은 비밀번호가 올바르지 않습니다.
				</div>
			</c:if>
			<form id="form-register" class="border bg-light p-3" method="post" action="/login">
				<input type="hidden" name="userType" value="직원" />
				<h5>
					<div class="fw-bold mb-3">직원 로그인</div>
				</h5>
				<div class="input-group mb-1">
				     <div class="input-group-text bg-white"><i class="bi bi-person-circle"></i></div>
				     <input id="empNo" type="text" class="form-control" name="id" value="" placeholder="사원번호">
			    </div>
				<div class="input-group mb-2">
				     <div class="input-group-text bg-white"><i class="bi bi-lock-fill"></i></div>
				     <input type="password" class="form-control" name="password" value="" placeholder="비밀번호">
			    </div>
			    <div>
			    	<button id="login" type="submit" class="form-control btn btn-primary">로그인</button>
			    </div>
			    <div class="mt-2 text-end">
			     <span class="border-end border-secondary">
			     	<a href="/emp/find-password" class="me-1 text-decoration-none text-secondary">비밀번호 찾기</a>
			     </span>
			   	 	<a href="../admin/login" class="ms-2 text-decoration-none text-secondary">관리자 로그인</a>
			    </div>
			</form>	
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>