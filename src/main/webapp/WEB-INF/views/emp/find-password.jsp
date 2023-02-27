<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<title>비밀번호 찾기</title>
</head>
<body>
<%@ include file="../emp/common/navbar.jsp" %>
<div class="container">
   <div class="row mt-5">
		<div class="col-6 offset-3">
			<div class="border bg-light p-3">
				<div class="row me-1 ms-1">
					<div class="bg-white">
						<div class="me-4 ms-4"> 
							<div class="row mt-4 align-middle">
								<h5 class="fw-bold">비밀번호 찾기</h4>
								<div class="row mt-1">
									<h6 class="fs-6 mb-4">비밀번호를 찾고자하는 사원번호를 입력해주세요</h6>
								</div>
								<div class="mb-4">
									<div id="fail-alert" class="alert alert-danger d-none">
										<strong>[실패]</strong> 일치하는 사원번호가 없습니다.
									</div>
									<form id="form-authentication" method="get" action="next">
										<input id="check-emp-no" type="text" name="empNo" class="mb-2 form-control border-secondary" placeholder="사원번호 입력">
										<button type="button" class="mb-1 form-control btn btn-primary" id="next">다음</button>
										<a href="/emp/login" type="button" class="form-control btn btn-dark">취소</a>
								</div>
								<div class="text-center mb-4">
									<span class="text-secondary text-center">사원번호가 기억나지 않는다면?</span>
									<span type="button" class="ms-1 text-secondary" id="click">클릭</span>
								</div>
							</div>
						</div>
					</div>
					<div class="bg-white d-none" id="detail">
						<div class="me-4 ms-4"> 
							<div class="row mt-4 align-middle">			
								<div class="p-4 border mb-3">
									<div class="mb-3">
										<input type="radio" id="authentication-tel" name="authentication">
										<span class="me-1">인사정보에 등록된 휴대전화로 인증</span>
										<span class="mt-2"><i type="button" id="again-tel" name="again-tel" class="bi bi-arrow-counterclockwise d-none"></i></span>
									</div>
									<div class="d-none" id="detail-authemtication-tel">
										<div class="ms-3 mb-1">
											<label class="ms-4">이름</label>
											<input id="name" type="text" class="ms-5 form-control-sm border border-secondary" style="width:50%;">
										</div>
										<div>
											<label class="ms-3">휴대전화 번호</label>
											<input id="tel" type="text" class="ms-1 form-control-sm border border-secondary" style="width:48%;">
											<span><button id="authentication-button-tel" name="button-tel" type="button" class="ms-1 btn btn-sm btn btn-secondary">인증</button></span>
											<span><button id="success-authentication-tel" type="button" class="ms-1 btn btn-sm btn btn-warning d-none" disabled>성공</button></span>
											<span><button id="fail-authentication-tel" type="button" class="ms-1 btn btn-sm btn btn-danger d-none" disabled>실패</button></span>
											<span><button id="reset-password-tel" name="reset-password" type="button" class="ms-1 btn btn-sm btn btn-primary d-none">초기화</button></span>
										</div>
									</div>
								</div>
								<div class="p-4 border mb-3">
									<div>
										<div class="mb-2">
											<input type="radio" id="authentication-email" name="authentication">
											<span class="me-2 mb-1">인사정보에 등록된 외부 이메일로 인증</span>
											<span class="mt-2"><i type="button" id="again-email" name="again-email" class="bi bi-arrow-counterclockwise d-none"></i></span>
										</div>
										<div class="ms-4 mb-1 d-none" id="detail-authemtication-email">
											<label class="ms-3">이메일</label>
											<input id="email" type="text" class="ms-5 form-control-sm border border-secondary" placeholder="hong@email.com" style="width:48%;">
											<span><button id="authentication-button-email" name="button-authemtication-email" type="button" class="ms-1 btn btn-sm btn btn-secondary">인증</button></span>
											<span><button id="success-authentication-email" type="button" class="ms-1 btn btn-sm btn btn-warning d-none" disabled>성공</button></span>
											<span><button id="fail-authentication-email" type="button" class="ms-1 btn btn-sm btn btn-danger d-none" disabled>실패</button></span>
											<span>
												<button id="reset-password-email" type="button" name="reset-password" class="ms-1 btn btn-sm btn btn-primary d-none">초기화</button>
											</span>
										</form>
									</div>
								</div>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>			
		</div>
	</div>	
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	
	// 클릭
	$("#click").click(function() {
		alert("인사팀에 문의하세요");
		
	})
	
	// 사원번호 찾기
	$("#next").click(function() {
		let checkEmpNo =  document.getElementById("check-emp-no").value;
		
		$.getJSON("/emp/checkSameEmpNo.json", {no : checkEmpNo})
		.done(function() {
			$("#detail").removeClass("d-none");
		})
		.fail(function() {
			$("#fail-alert").removeClass("d-none");
		})
	
	})
	
	// 인증 방법 선택
	$("#authentication-tel").change(function() {
		
		$("#detail-authemtication-tel").removeClass("d-none");
		$("#detail-authemtication-email").addClass("d-none");
		
		$("#authentication-email").prop("checked", "");
		$("#again-tel").addClass("d-none");
	})
	
	$("#authentication-email").click(function() {
		
		$("#detail-authemtication-email").removeClass("d-none");
		$("#detail-authemtication-tel").addClass("d-none");
		
		$("#authentication-tel").prop("checked", "");
		$("#again-tel").addClass("d-none");
	})
	
	// 동기화 - 전화번호
	$("#again-tel").click(function() {
		$("#authentication-button-tel").removeClass("d-none");
		$("#fail-authentication-tel").addClass("d-none");
		clearForm();
	})
	
	$("#again-email").click(function() {
		$("#authentication-button-email").removeClass("d-none");
		$("#fail-authentication-email").addClass("d-none");
		clearForm();
		$("#again-email").addClass("d-none");
	})
	
	// 클리어폼
	function clearForm() {
		$("#tel").val("");
		$("#name").val("");
		$("#email").val("");
	}
 	
	// 휴대폰 인증
	$("#authentication-button-tel").click(function() {
		
		let checkEmpNo =  document.getElementById("check-emp-no").value;
		let tel = document.getElementById("tel").value;
		let name = document.getElementById("name").value;
		
		$.getJSON("/emp/checkSameEmpNo.json", {no : checkEmpNo}, function(emp) {
			
			if (emp.mobileTel != tel || emp.name != name) {
				alert("이름과 휴대전화 번호가 일치하지 않습니다.");
				$("#authentication-button-tel").addClass("d-none");
				$("#fail-authentication-tel").removeClass("d-none");
				$("#again-tel").removeClass("d-none");
				return false;
				
			}

				$("#success-authentication-tel").removeClass('d-none');
				$(":button[name=button-tel]").addClass('d-none');
				$("#tel").prop("readonly", "readonly");
				$("#name").prop("readonly", "readonly");
				$(":button[name=reset-password]").removeClass("d-none");
				
				$("#reset-password-tel").click(function() {
					$("#form-authentication").attr("action", "authentication-tel").attr("method", "post").trigger('submit');
				});
			
			})
	
			
		})
		
	// 이메일 인증
	$("#authentication-button-email").click(function() {
		let checkEmpNo =  document.getElementById("check-emp-no").value;
		let email = document.getElementById("email").value;
		
		$.getJSON("/emp/checkSameEmpNo.json", {no : checkEmpNo}, function(emp) { 
			
			if (emp.externalEmail != email) {
				alert("등록된 이메일이 일치하지 않습니다.");
				$("#authentication-button-email").addClass("d-none");
				$("#fail-authentication-email").removeClass("d-none");
				$("#again-email").removeClass("d-none");
				return false;
			} 
			
			$("#authentication-button-email").addClass("d-none");
			$("#success-authentication-email").removeClass("d-none");
			$("#email").prop("readonly", "readonly");
			$("#reset-password-email").removeClass("d-none")
			
			$("#reset-password-email").click(function() {
				$("#form-authentication").attr("action", "authentication-tel").attr("method", "post").trigger('submit');
			});
		
		})
		
	})

})
</script>
</body>
</html>