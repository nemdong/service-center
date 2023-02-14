<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>비밀번호 찾기</title>
</head>
<body>
<%@ include file="../emp/common/navbar.jsp" %>
<div class="container">
   <div class="row mt-5">
		<div class="col-6 offset-3">
			<form class="border bg-light p-3">
				<div class="row me-1 ms-1">
					<div class="bg-white">
						<div class="me-4 ms-4"> 
							<div class="row mt-4 align-middle">
								<h5 class="fw-bold">비밀번호 찾기</h4>
								<div class="row mt-1">
									<h6 class="fs-6 mb-4">비밀번호를 찾고자하는 사원번호를 입력해주세요</h6>
								</div>
								<div class="mb-4"> <!-- 아이디없으면 알림창 뜨게 구현 -->
									<form method="get" action="next">
										<input type="text" name="empNo" class="mb-1 form-control border-secondary" placeholder="사원번호 입력">
										<button type="button" class="form-control btn btn-primary" id="next">다음</button>
									</form>
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
										<input type="radio" id="authentication1" name="authentication">
										<form method="post" action="TelAuthetication">
											<!-- (변경) 로그인 구현되면 사원번호 hidden 추가 form 태그에 값 같이 이동(String -> int 처리하기) -->
											<hidden name="no" value="1008003"/>
											<span class="me-2">인사정보에 등록된 휴대전화로 인증
												<span name="mobileTel">(***-****-****)</span>
											</span>
										</div>
										<div class="d-none" id="detail-authemtication1">
											<div class="ms-3 mb-1">
												<label class="ms-4">이름</label>
												<input type="text" class="ms-5 form-control-sm border border-secondary" style="width:50%;">
											</div>
											<div>
												<label class="ms-3">휴대전화 번호</label>
												<input type="text" class="ms-1 form-control-sm border border-secondary" style="width:48%;">
												<span><button type="submit" class="ms-1 btn btn-sm btn btn-secondary">인증</button></span>
												<span><button type="button" class="ms-1 btn btn-sm btn btn-primary">초기화</button></span>
											</div>
										</form>
									</div>
								</div>
								<div class="p-4 border mb-3">
									<div>
										<div class="mb-2">
											<input type="radio" id="authentication2" name="authentication">
											<span class="me-2 mb-1">인사정보에 등록된 외부 이메일로 인증</span>
										</div>
										<form method="post" action="EmailAuthetication">
											<div class="ms-4 mb-1 d-none" id="detail-authemtication2">
												<!-- (변경) 로그인 구현되면 사원번호 hidden 추가 form 태그에 값 같이 이동(String -> int 처리하기) -->
												<hidden name="no" value="1008003"/>
												<input type="text" class="ms-5 form-control-sm border border-secondary" placeholder="hong@email.com" style="width:48%;">
												<span>
													<button type="button" class="ms-1 btn btn-sm btn btn-secondary">인증</button>
												</span>
												<span>
													<button type="button" class="ms-1 btn btn-sm btn btn-primary">초기화</button>
												</span>
											</div>
										</form>
									</div>
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
	
	$("#click").click(function() {
		alert("인사팀에 문의하세요");
		
	})
	
	// 다음 버튼
	$("#next").click(function() {
		
		// 사원번호 this.val를 $getJson으로 보내서 같은 값이 있으면 d-none해제.
		// 없으면 alert("사원번호를 확인하세요.")
		
		$("#detail").removeClass("d-none");
		
	})
	
	// 인증 방법
	$("#authentication1").change(function() {
		
		$("#detail-authemtication1").removeClass("d-none");
		$("#detail-authemtication2").addClass("d-none");
	})
	
	$("#authentication2").click(function() {
		
		$("#detail-authemtication2").removeClass("d-none");
		$("#detail-authemtication1").addClass("d-none");
	})
	
})
</script>
</body>
</html>