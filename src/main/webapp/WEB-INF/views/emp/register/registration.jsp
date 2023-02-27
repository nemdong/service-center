<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<title>인사 조회/등록</title>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<style>
	
	[name="upfile"] {
		position: absolute;
		width: 1px;
		height: 0;
		margin: -1px;
		overflow: hidden;
		clip:rect(0,0,0,0);
		border:0;
	}
</style>
<div class="container">
	<div class="row mb-3">
		<div class="col-2">
			<h1>leftbar 넣기</h1>
		</div>	
		<div class="col-10">
			<div class="row mb-1">
				<div class="col-12"><h4 class="fw-bold fs-5">인사 조회/등록</h4></div>
			</div>
			<div class="row mb-3">
				<div class="col-12">
					<div class="bg-light p-2">
						<form method="get" action="registeration">
							 <div class="input-group">
								<select class="form-select " style="max-width: 150px !important;" name="opts" id="inputGroupSelect04" aria-label="Example select with button addon">
									<option value="empNo" ${param.opts eq 'empNo' ? 'selected' : '' }>사원번호</option>
									<option value="name" ${param.pots eq 'name' ? 'selected' : '' }>성명</option>
									<option value="department" ${param.opts eq 'department' ? 'selected' : '' }>부서</option>
								</select>
								<input type="text" class="form-control" name="keyword" value="${param.keyword }"/>
								<button type="submit" class="btn btn-dark btn-xs" id="search-form">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="mb-1 me-1 bi bi-search" viewBox="0 0 16 16">
  										<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
									</svg>검색
								</button>	
							</div>
						</form>
					</div>
				</div>
			</div>
	
			<div class="row mb-4">
				<div class="col-6">
					<h4 class="fw-bold fs-6 mt-2">전체 사원 기본 정보</h4>
				</div>
				<sec:authorize access="hasRole('ROLE_관리자')">
					<div class="col-6 text-end">
						<a href="/emp/register/empInsert" class="mt-1 mb-1 text-end btn btn-primary btn-sm" id="emp-registration">인사 등록</a>
					</div>
				</sec:authorize>
				<div class="col-12">
					<div class="bg-light p-2">
						<div style="overflow-y:auto !important; width:100%; max-height:400px !important; display:block !important;">
							<table class="table table-sm table-bordered"  id="table-emp-list">
								<thead class="table-secondary">
									<tr class="text-center">
										<th>사원번호</th>
										<th>성명</th>
										<th>부서</th>
										<th>직책</th>
										<th>입사일자</th>
										<th>사내 전화번호</th>
										<th>회사이메일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="emp" items="${empList }">
										<tr data-emp-no="${emp.no }" style="cursor: pointer;" class="text-center">
											<td>${emp.no }</td>
											<td>${emp.name }</td>
											<td>${emp.deptName }</td>
											<td>${emp.positionName }</td>
											<td><fmt:formatDate value="${emp.hireDate }" pattern="yyyy-MM-dd"/></td>
											<td>${emp.companyTel }</td>
											<td>${emp.companyEmail } </td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>	
				</div>
			</div>
				
			<div class="row mb-2 d-none" id="detail-info">
				<div class="col-6">
					<h4 class="fw-bold fs-6">상세 정보</h4>
				</div>
				<form:form modelAttribute="employeeRegisterForm" id="form-emp" method="post" action="insert" enctype="multipart/form-data">
				<div class="col-12">
					<div class="row mb-1">
						<div class="col-12 border border-secondary-subtle">
							<table class="table table-sm" id="table-emp-detail">
								<colgroup>
									<col width="10%">
									<col width="24%">
									<col width="10%">
									<col width="23%">
									<col width="10%">
									<col width="23%">
								</colgroup>
								<tbody class="text-center">
									<tr class="align-middle">
										<td colspan="2" rowspan="6">
											<img id="image-profile" src="/resources/images/default.png" style="width: 50%; hight: 50%;">
										</td>
									</tr>
									<tr class="align-middle">
										<th class="table-secondary"><span class="text-danger">* </span>사원번호</th>
										<td colspan="3">
											<form:input type="text" class="form-control" path="no" id="emp-no" readonly="true"/>
										</td>
									</tr>
									<tr class="align-middle">
										<th class="table-secondary" id="name-label"><span class="text-danger">* </span>성명</th>
										<td colspan="3">
											<form:input type="text" class="form-control" path="name" id="name"/>
											<form:errors path="name" cssClass="text-danger"/>
										</td>
									</tr>
									<tr class="align-middle">
										<th class="table-secondary">주민번호</th>
										<td>
											<div class="row">
											 	<div class="col ms-2">
											   	 	<form:input type="text" class="form-control" path="citizenNo1" id="citizen-no-front" />
											 	</div>
											 	<div class="col me-2">
											    	<form:input type="password" class="form-control" path="citizenNo2" id="citizen-no-second" />
											  	</div>
											  	<form:errors path="citizenNo1" cssClass="text-danger"/>
											  	<form:errors path="citizenNo2" cssClass="text-danger"/>
											</div>
										</td>
										<th class="table-secondary"><span class="text-danger">* </span>성별</th>
										<td>
											<span class="me-2 text-center">
												<form:radiobutton class="form-check-input me-1" path="gender" value="M" id="male"/>
												<label class="form-check-label">남</label>	
											</span>
											<span class="me-2">
												<form:radiobutton class="form-check-input me-1"  path="gender" value="F" id="female"/>
												<label class="form-check-label">여</label>
											</span>
											<form:errors path="gender" cssClass="text-danger"/>
										</td>
									</tr>
									<tr class="align-middle">
										<th class="table-secondary"><span class="text-danger">* </span>부서</th>
										<td>
											<form:select class="form-select form-select-xs" path="deptNo" id="department">
												<option value="" selected="selected"> 부서를 선택하세요</option>
												<option value="100"> 인사팀</option>
												<option value="101"> 서비스팀</option>
												<option value="102"> 부품팀</option>
											</form:select>
											<form:errors path="deptNo" cssClass="text-danger"/>
										</td>
										<th class="table-secondary"><span class="text-danger">* </span>입사일자</th>
										<td style="text-align: center;">
											<form:input type="date" class="form-control" path="hireDate" id="hire-date"/>
											<div class="vertical-align: middle;">
												<form:errors path="hireDate" cssClass="text-danger"/>
											</div>
										</td>
									</tr>
									<tr class="align-middle">
										<th class="table-secondary"><span class="text-danger">* </span>직책</th>
										<td>
											<form:select class="form-select form-select-xs" path="positionNo" id="position">
												<option value="" selected="selected"> 직책을 선택하세요</option>
												<option value="10"> 사원</option>
												<option value="11"> 대리</option>
												<option value="12"> 관리자</option>
											</form:select>
											<form:errors path="positionNo" cssClass="text-danger"/>
										</td>
										<th class="table-secondary">퇴사일자</th>
										<td style="text-align: center;"><form:input type="date" class="form-control" path="retirementDate" id="retirement-date"/></td>
									</tr>
									<tr  class="align-middle">
										<th class="table-secondary"><span class="text-danger">* </span>회사전화</th>
										<td>
											<form:input type="text" class="form-control" path="companyTel" id="company-tel"/>
											<form:errors path="companyTel" cssClass="text-danger"/>
										</td>
										<th class="table-secondary">자택전화</th>
										<td>
											<form:input type="text" class="form-control" path="homeTel" id="home-tel"/>
											<form:errors path="homeTel" cssClass="text-danger"/>
										</td>
										<th class="table-secondary"><span class="text-danger">* </span>핸드폰</th>
										<td>
											<form:input type="text" class="form-control" path="mobileTel" id="mobile-tel"/>
											<form:errors path="mobileTel" cssClass="text-danger"/>
										</td>
									</tr>		
									<tr class="align-middle">
										<th class="table-secondary"><span class="text-danger">* </span>회사이메일</th>
										<td colspan="5">
											<form:input type="email" class="form-control" path="companyEmail" id="company-email"/>
											<form:errors path="companyEmail" cssClass="text-danger"/>
										</td>
										
									</tr>
									<tr class="align-middle">
										<th class="table-secondary"><span class="text-danger">* </span>외부이메일</th>
										<td colspan="5">
											<form:input type="email" class="form-control" path="externalEmail" id="external-email"/>
											<form:errors path="externalEmail" cssClass="text-danger"/>
										</td>
										
									</tr>
									<tr class="align-middle">
										<th rowspan="3" class="table-secondary">자택주소</th>
										<td><form:input type="text" class="form-control" path="postcode" readonly="readonly" id="zipCode"/></td>
										<td colspan="3"><button type="button" class="btn btn-secondary btn-sm" id="btn-search-postcode">우편번호검색</button></td>
									</tr>
									<tr class="align-middle">
										<td colspan="5">
											<form:input type="text" class="form-control" path="basicAddress" id="basic-address"/>
										</td>
									<tr class="align-middle">
										<td colspan="5">
											<form:input type="text" class="form-control" path="detailAddress" id="detail-address"/>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
					<div class="col-12 text-end mt-1">
						<a href="" class="btn btn-primary btn-sm">엑셀업로드</label></a>
						<label form="file">
							<div class="btn-upload btn btn-warning btn-sm">프로필 등록</div>
						    <form:input id="file-profile" type="file" path="upfile"/>
						</label>
						<button id="delete-emp" type="button" class="btn btn-secondary btn-sm">삭제</button>
						<button id="modify-emp" type="button" class="btn btn-dark btn-sm">수정</button>
					</div>					
				</form:form>
			</div>
		</div>
	</div>					
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function() {
	
	let fileProfile = document.querySelector("#file-profile");
	let imageProfile = document.querySelector("#image-profile");
	
	fileProfile.addEventListener("change", function(event) {
		let reader = new FileReader();
		
		reader.readAsDataURL(event.target.files[0]);
		
		reader.onload = function() {
			imageProfile.src = reader.result;
		}
	})
	
	$("#delete-emp").click(function() {
		$("#form-emp").attr("action", "delete").trigger('submit');
	})
	
	$("#modify-emp").click(function() {
		$("#form-emp").attr("action", "modify").trigger('submit');
	})
	
	// 직원 상세정보
	$("#table-emp-list tbody tr").click(function() {
		
		let empNo = $(this).attr("data-emp-no");
		
		$.getJSON("/emp/register/detail.json", {no: empNo}, function(emp) {

			$("#emp-no").val(emp.no);
			$("#name").val(emp.name);
			$("#hire-date").val(emp.hireDate);
			$("#retirement-date").val(emp.retirementDate);
			$("#company-tel").val(emp.companyTel);
			$("#home-tel").val(emp.homeTel);
			$("#mobile-tel").val(emp.mobileTel);
			$("#company-email").val(emp.companyEmail);
			$("#zipCode").val(emp.zipcode);
			$("#external-email").val(emp.externalEmail);
			$("#basic-address").val(emp.basicAddress);
			$("#detail-address").val(emp.detailAddress);
			
			if (emp.fileName != null) {
				$("#image-profile").attr("src", "/resources/images/" + emp.fileName.fileName);
			}
			
			if(emp.fileName == null) {
				$("#image-profile").attr("src", "/resources/images/default.png");
			}
			
			$(":input[name=positionNo]").val(emp.positionNo);
			$(":input[name=deptNo]").val(emp.deptNo);
			
			if (emp.gender == 'M') {
				$("#male").prop("checked", "checked");
				
			}
			if (emp.gender == 'F') {
				$("#female").prop("checked", "checked");
				
			}
			
			let str = emp.citizenNo;
			if (emp.citizenNo != null) {
				citizenNoFirst = str.substr(0, 6);
				citizenNoSecond = str.substr(7, 14);
				$("#citizen-no-front").val(citizenNoFirst);
				$("#citizen-no-second").val(citizenNoSecond);
			} else {
				$("#citizen-no-front").val("");
				$("#citizen-no-second").val("");
			}
			
		})
		
		$(this).addClass("table-info").siblings().removeClass("table-info")
		$("#detail-info").removeClass("d-none");
		
	})
	
})

</script>
</body>
</html>