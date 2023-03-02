<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>애플리케이션</title>
</head>
<body>
<c:set var="menu" value="login" />
<%@ include file="common/navbar.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light p-2 fs-4">로그인</h1>
		</div>
	</div>
	<div class="row mb-3" style="float: none; margin:100 auto;">
		<div class="col-4" style="float: none; margin:0 auto;">
			
			<p>아이디와 비밀번호를 입력하고 로그인 버튼을 클릭하세요</p>
			<c:if test="${param.error eq 'fail'}">
			     <p class="text-danger"> 아이디 또는 비밀번호가 일치하지 않습니다.</p>
			</c:if>
			<c:if test="${param.error eq 'expired'}">
			     <p class="text-danger"> 탈퇴한 사용자입니다.</p>
			</c:if>
			<form id="form-register" class="border bg-light p-3" method="post" action="/login">
				<input type="hidden" name="userType" value="사용자" />
				<div class="mb-3">
					<label class="form-label">아이디</label>
					<input type="text" class="form-control form-control-sm" name="id"/>
				</div>
				<div class="mb-3">
					<label class="form-label">비밀번호</label>
					<input type="password" class="form-control form-control-sm" name="password" />
				</div>
				<div class="text-end">
					<a href="/cus" class="btn btn-secondary btn-sm">취소</a>
					<button type="submit" class="btn btn-primary btn-sm">로그인</button>
				</div>
			</form>
		</div>
	</div>
</div>
  <div class="m-4 bg-danger"></div>
  <div class="d-grid gap-2 col-3 mix-auto" style="float: none; margin:0 auto;">
  <a href="/cus/search-id" class="btn btn-secondary btn-sm">아이디 찾기</a>
  <a href="/cus/search-pw" class="btn btn-secondary btn-sm">비밀번호 찾기</a>
  <a href="/cus/register" class="btn btn-secondary btn-sm">회원가입</a>
  </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

$(function() {
	$("#form-register").submit(function() {
		let id = $("#form-register :input[name=id]").val();
		let password = $("#form-register :input[name=password]").val();
		
		if (id == "") {
			alert("아이디를 입력해주세요.");
			return false;
		}
		if (password == "") {
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		return true;
	});
	
	
});

	</script>
	</body>
	</html>
