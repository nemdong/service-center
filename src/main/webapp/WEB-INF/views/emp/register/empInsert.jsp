<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<title>인사 신규 등록</title>
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
	<div class="row mb-2" id="detail-info">
		<div class="col-6">
			<h4 class="fw-bold fs-6">신규 등록</h4>
		</div>
		<div class="col-12 bg-light mb-3" id="save-emp-manual">
			<div class="mt-2 mb-2">
				<h6 class="fs-6 mb-2 fw-bold">[인사 등록 주의사항]</h6>
				<h6 class="fs-6">- <span class="text-danger">*</span>은 필수 정보입니다.</h6>
				<h6 class="fs-6 mb-1">- 필수 정보 입력 후, 번호 부여 버튼을 눌러 사원 번호를 등록하세요</h6>
			</div>
		</div>
		<form:form modelAttribute="employeeRegisterForm" id="form-emp" method="post" action="inquiry" enctype="multipart/form-data">
		<form:hidden path="password" value="1234"/>
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
										<img id="image-profile" src="/resources/images/default.png" style="width: 50%; hight: 50%;"/> <!-- 프로필 -->
									</td>
								</tr>
								<tr class="align-middle">
									<th class="table-secondary"><span class="text-danger">* </span>사원번호</th>
									<td colspan="2">
										<form:input type="text" class="form-control" path="no" id="emp-no" readonly="true"/>
									</td>
									<td>
										<button type="button" class="mt-1 btn btn-secondary btn-sm btn-sm" id="give-emp-no">번호 부여</button>
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
									 		<form:option value="0" label="부서를 선택하세요"/>
											<form:option value="100" label="인사팀"/>
											<form:option value="101" label="서비스팀"/>
											<form:option value="102" label="부품팀"/>
										</form:select>
										<form:errors path="deptNo" cssClass="text-danger"/>
									
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
											<form:option value="0" label="직책을 선택하세요"/>
											<form:option value="10" label="사원"/>
											<form:option value="11" label="대리"/>
											<form:option value="12" label="관리자"/>
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
					<label form="file">
						<div class="btn-upload btn btn-warning btn-sm">프로필 등록</div>
					    <form:input id="file-profile" type="file" path="upfile"/>
					</label>
				<button id="save-emp" type="submit" class="btn btn-dark btn-sm">저장</button>
			</div>					
		</form:form>
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
	
	// 다음 주소
	$("#btn-search-postcode").click(function() {
		new daum.Postcode({
			oncomplete: function(data) {
				let address;
				if (data.userSelectedType === 'R') {
					address = data.roadAddress;
				} else {
					address = data.jibunAddress;
				}
				
				$(":input[name=postcode]").val(data.zonecode);
				$(":input[name=basicAddress]").val(address);
				$(":input[name=detailAddress]").focus();
			}
		}).open();
	});
	
	// 사원번호 부여
	$("#give-emp-no").click(function() {
		let deptNo = $("#department").val();
		if (deptNo == "") {
			alert("부서를 선택하세요");
			return false;
			
		}
		$.getJSON("/emp/register/getEmpNo.json", {deptNo: deptNo}, function(no) {
			let empNo = deptNo + no
			$("#emp-no").val(empNo);
		})
		
	})
	
	$("#save-emp").click(function() {
		
		let empNo = $("#emp-no").val();
		if (empNo == "") {
			alert("사원번호를 부여하세요");
			return false;
		} 
		
	})

})
</script>
</body>
</html>