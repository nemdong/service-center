<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title></title>
</head>
<body>
<c:set var="menu" value="customer" />
<%@ include file="../common/navbar.jsp"%>

<div class="container">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light p-2 fs-4">마이페이지</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<a href="/customer/mydevice" class="btn btn-secondary">나의 기기 확인</a> 
			<a href="/customer/modify" class="btn btn-primary">내 정보 수정</a> 
			<a href="/customer/password" class="btn btn-warning">비밀번호 변경</a> 
			<button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modal-cus-delete">회원 탈퇴</button>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>[나의 정보]</p>
			<table class="table table-bordered">
				<colgroup>
					<col width="25%">
					<col width="25%">
					<col width="25%">
					<col width="25%">
				</colgroup>
				<tbody>
					<tr>
						<th>아이디</th>
						<td>${customer.id }</td>
						<th>생일</th>
						<td><fmt:formatDate value="${customer.birthday }" /></td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${customer.name }</td>
						<th>이메일</th>
						<td>${customer.email }</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${customer.phone }</td>
						<th>우편번호</th>
						<td>${customer.zipcode}</td>
					</tr>
					<tr>
						<th>기본주소</th>
						<td>${customer.basicAddress}</td>
						<th>상세주소</th>
						<td>${customer.detailAddress}</td>						
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light p-2 fs-4">서비스 이력</h1>
		</div>
	</div>
	<div class="row mb-5">
		<div class="col-12">
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">진행</button>
					<button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">완료</button>
 				</div>
 			</nav>
	  		<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
					<div class="row mb-1">
						<div class="col-12">
							<h3>진행 중 리스트</h3>
							<table class="table">
								<thead>
									<tr>
										<th scope="col">접수번호</th>
										<th scope="col">접수일자</th>
										<th scope="col">처리상태</th>
										<th scope="col">서비스구분</th>
										<th scope="col">제품명</th>
										<th scope="col">모델명</th>
										<th scope="col">처리예정일</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${empty dtos }">
											<tr>
												<td>접수이력이 없습니다.</td>
											</tr>	
										</c:when>
										<c:otherwise>
											<c:forEach var="dto" items="${dtos }">
												<c:if test="${dto.processStatus ne '서비스완료' }">
													<tr>                     
													    <td scope="row">${dto.registrationNo}</td>
														<td scope="row"><fmt:formatDate value="${dto.registrationDate}" /> </td>
														<td scope="row">${dto.processStatus}</td>
														<td scope="row">${dto.serviceCatName}</td>
														<td scope="row">${dto.deviceName}</td>
														<td scope="row">${dto.deviceCategoryName}</td>
														<td scope="row"><fmt:formatDate value="${dto.processExpectedDate}" /></td>
													</tr>
												</c:if>
											
											</c:forEach>
										</c:otherwise>
									</c:choose>
				        
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="tab-pane fade " id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
					<div class="row mb-1">
						<div class="col-12">
							<h3>완료 리스트</h3>
							<table class="table">
								<thead>
									<tr>
										<th scope="col">접수번호</th>
										<th scope="col">접수일자</th>
										<th scope="col">처리상태</th>
										<th scope="col">서비스구분</th>
										<th scope="col">제품명</th>
										<th scope="col">모델명</th>
										<th scope="col">처리완료일</th>
									</tr>
								</thead>
								<tbody>
									
									<c:forEach var="dto" items="${dtos }">
											<c:if test="${dto.processStatus eq '서비스완료' }">
												<tr>                     
												    <td scope="row">${dto.registrationNo}</td>
													<td scope="row"><fmt:formatDate value="${dto.registrationDate}" /> </td>
													<td scope="row">${dto.processStatus}</td>
													<td scope="row">${dto.serviceCatName}</td>
													<td scope="row">${dto.deviceName}</td>
													<td scope="row">${dto.deviceCategoryName}</td>
													<td scope="row"><fmt:formatDate value="${dto.processCompletedDate}" /></td>
												</tr>
											</c:if>
										
										</c:forEach>
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
 		</div>
 	</div>	
</div>
<!----------------------- 회원탈퇴 모달폼 ------------------------>
<div class="modal" tabindex="-1" id="modal-cus-delete">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">회원 탈퇴</h5>
			</div>
			<div class="modal-body">
				<p><strong><sec:authentication property="principal.name" /></strong>님의 비밀번호와 탈퇴이유를 입력해주세요.</p>
				<form id="form-delete-customer" class="border bg-light p-3" method="post" action="delete">
					<div class="mb-3">
						<label class="form-label">비밀번호</label>
						<input type="password" class="form-control" name="password">
						<label class="form-label">탈퇴 이유</label>
							<select class="form-select form-select-sm" name="deleteReason">
								<option value="">탈퇴 이유를 선택해주세요.</option>
								<option value="개인정보유출우려">개인정보 유출 우려</option>
								<option value="이용빈도저조">이용빈도 저조</option>
								<option value="서비스불편">고객서비스에 대한 불편,기타</option>
						    </select>		
					</div>
					<div class="text-end">
					    <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-primary btn-sm">탈퇴</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

$(function() {
	
	$("#form-delete-customer").submit(function() {
		let password = $("#modal-cus-delete :input[name=password]").val();
		let deleteReason = $("#modal-cus-delete :input[name=deleteReason]").val();
		
		if (deleteReason == "") {
			alert("탈퇴사유를 선택해주세요.");
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