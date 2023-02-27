<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>비밀번호 변경</title>
</head>
<body>
<%@ include file="../emp/common/navbar.jsp" %>
<div class="container">
   <div class="row mt-5">
		<div class="col-6 offset-3" id="form-password"> 
			<form class="border bg-light p-3"  method="post" action="password"> <!-- modelAttribute="EmpPasswordRegisterForm"  -->
				<div class="row me-1 ms-1">
					<div class="bg-white">
						<div class="me-4 ms-4"> 
							<div class="row mt-4 align-middle">
								<h5 class="fw-bold">비밀번호 변경</h4>
								<div class="row mt-1">
									<h6 class="fs-6">안전한 비밀번호로 내정보를 보호하세요</h6>
									<h6 class="fs-6">*<span class="text-danger"> 다른 아이디/사이트에서 사용한 적 없는 비밀번호</span></h6>
									<h6 class="fs-6">*<span class="text-danger"> 이전에 사용한 적 없는 비밀번호</span>가 안전합니다.</h6>
								</div>
							</div>
							<div class="row mt-4">
								<div class="me-1">
									<div class="alert alert-danger text-middle d-none" id="same-password">
										기존 비밀번호와 새 비밀번호가 동일합니다.
									</div>
									<div class="alert alert-danger text-middle d-none" id="different-password">
										새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다.
									</div>
								</div>
								<div class="mb-1">
									<input id="oldPassword" type="password" class="form-control border-secondary" name="oldPassword" placeholder="현재 비밀번호"/>
								</div>
								<div class="mb-1">
									<input id="new-password" type="password" class="form-control border-secondary" name="password" placeholder="새 비밀번호"/>
								</div>
								<div class="mb-3">
									<input type="password" class="form-control border-secondary" id="new-password-confirm" placeholder="새 비밀번호 확인"/>
								</div>
							</div>
								<div class="row mt-3">
									<div class="mb-3">
										가능하면 구현
									</div>
								</div>
							<div>
								<div class="mb-1">
									<button id="form-change-password" type="submit" class="form-control btn btn-primary">확인</button>
								</div>
								<div class="mb-4">
									<a href="/emp/" type="button" class="form-control btn btn-dark">취소</a>
								</div>
							</div>
						</div>
					</div>
				</div>	
			</form>
		</div>
	</div>	
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	

	$("#form-change-password").click(function() {
		let oldPassword = $("#oldPassword").val();
		let newPassword = $("#new-password").val();
		let newPasswordConfirm = $("#new-password-confirm").val();
		
		if (oldPassword == newPassword) {
			$("#same-password").removeClass('d-none');
			$("#different-password").addClass('d-none');
			return false;
		}
		
		if (newPassword != newPasswordConfirm) {
			$("#different-password").removeClass('d-none');
			$("#same-password").addClass('d-none');
			return false;
		}
		
		return true;
	})

})
</script>
</body>
</html>
