<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>인사정보 등록/조회</title>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col-2">
			<h1>leftbar 넣기</h1>
		</div>	
		<div class="col-10">
			<div class="row mb-1">
				<div class="col-12"><h4 class="fw-bold fs-5">인사정보 등록</h4></div>
			</div>
			<div class="row mb-3">
				<div class="col-12">
					<div class="bg-light p-2">
						<form>
							 <div class="input-group">
								<select class="form-select " style="max-width: 150px !important;" name="opts" id="inputGroupSelect04" aria-label="Example select with button addon">
									<option value="empNo">사원번호</option>
									<option value="Name">성명</option>
									<option value="department">부서</option>
								</select>
								<input type="text" class="form-control" name="keyword" />
								<button type="button" class="btn btn-dark btn-xs" id="search-form">
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
					<h4 class="fw-bold fs-6 mt-2">기본 정보</h4>
				</div>
				<div class="col-6 text-end">
					<button type="button" class="mt-1 mb-1 text-end btn btn-primary btn-sm" id="emp-registration">인사 등록</button>
				</div>
				<div class="col-12">
					<div class="bg-light p-2">
						<div style="overflow-y:scroll; width:100%; height:100%">
							<table class="table table-sm table-bordered"  id="table-emp-list">
								<thead class="table-secondary">
									<tr>
										<th>사원번호</th>
										<th>성명</th>
										<th>직책</th>
										<th>부서</th>
										<th>입사일자</th>
										<th>퇴사일자</th>
										<th>회사이메일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="emp" items="${empList }">
										<tr data-emp-no="${emp.no }" style="cursor: pointer;">
											<td>${emp.no }</td>
											<td >${emp.name }</td>
											<td>${emp.positionName }</td>
											<td>${emp.deptName }</td>
											<td><fmt:formatDate value="${emp.hireDate }" pattern="yyyy-MM-dd"/></td>
											<td><fmt:formatDate value="${emp.retirementDate }" pattern="yyyy-MM-dd"/></td>
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
				<div class="col-12">
					<h4 class="fw-bold fs-6">상세 정보</h4>
				</div>
				<form action="">
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
										<td colspan="2" rowspan="6">사진</td>
									</tr>
									<tr class="align-middle">
										<th class="table-secondary">사원번호</th>
										<td colspan="2">
											<input type="text" class="form-control" name="empNo" id="emp-no" readonly="readonly"/>
										</td>
										<td>
											<button type="button" class="mt-1 btn btn-secondary btn-sm btn-sm">번호 부여</button>
										</td>
									</tr>
									<tr class="align-middle">
										<th class="table-secondary" id="name-label">성명</th>
										<td colspan="3"><input type="text" class="form-control" name="name" id="name"/></td>
									</tr>
									<tr class="align-middle">
										<th class="table-secondary">주민번호</th>
										<td>
											<div class="row">
											 	<div class="col ms-2">
											   	 <input type="text" class="form-control" name="citizenNo1" id="citizen-no-front">
											 	</div>
											 	<div class="col me-2">
											    	<input type="password" class="form-control" name="citizenNo2" id="citizen-no-second">
											  	</div>
											</div>
										</td>
										<th class="table-secondary">성별</th>
										<td>
											<span class="me-2 text-center">
												<input class="form-check-input" type="radio" name="gender" value="M" id="male">
												<label class="form-check-label">남</label>	
											</span>
											<span class="me-2">
												<input class="form-check-input" type="radio" name="gender" value="F" id="female">
												<label class="form-check-label">여</label>
											</span>
										</td>
									</tr>
									<tr class="align-middle">
										<th class="table-secondary">부서</th>
										<td>
											<select class="form-select form-select-xs" name="department" id="department">
												<option select="select"> 부서를 선택하세요</option>
												<option value="100"> 인사팀</option>
												<option value="101"> 서비스팀</option>
												<option value="102"> 부품팀</option>
											</select>
										</td>
										<th class="table-secondary">입사일자</th>
										<td style="text-align: center;"><input type="date" class="form-control" name="hireDate" id="hire-date"/></td>
									</tr>
									<tr class="align-middle">
										<th class="table-secondary">직책</th>
										<td>
											<select class="form-select form-select-xs" name="position" id="position">
												<option select="select"> 직책을 선택하세요</option>
												<option value="10"> 사원</option>
												<option value="11"> 대리</option>
												<option value="12"> 관리자</option>
											</select>
										</td>
										<th class="table-secondary">퇴사일자</th>
										<td style="text-align: center;"><input type="date" class="form-control" name="retirementDate" id="retirement-date"/></td>
									</tr>
									<tr  class="align-middle">
										<th class="table-secondary">회사전화</th>
										<td><input type="text" class="form-control" name="companyTel" id="company-tel"/></td>
										<th class="table-secondary">자택전화</th>
										<td><input type="text" class="form-control" name="homeTel" id="home-tel"/></td>
										<th class="table-secondary">핸드폰</th>
										<td><input type="text" class="form-control" name="mobileTel" id="mobile-tel"/></td>
									</tr>		
									<tr class="align-middle">
										<th class="table-secondary">회사이메일</th>
										<td colspan="5"><input type="email" class="form-control" name="companyEmail" id="company-email"/></td>
										
									</tr>
									<tr class="align-middle">
										<th class="table-secondary">외부이메일</th>
										<td colspan="5"><input type="email" class="form-control" name="externalEmail" id="external-email"/></td>
										
									</tr>
									<tr class="align-middle">
										<th rowspan="3" class="table-secondary">자택주소</th>
										<td><input type="text" class="form-control" name="zipCode" readonly="readonly" id="zipCode"/></td>
										<td colspan="3"><button type="button" class="btn btn-secondary btn-sm">우편번호검색</button></td>
									</tr>
									<tr class="align-middle">
										<td colspan="5">
											<input type="text" class="form-control" name="basicAddress" id="basic-address"/>
										</td>
									<tr class="align-middle">
										<td colspan="5">
											<input type="text" class="form-control" name="detailAddress" id="detail-address"/>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="col-12 text-end mt-1">
					<a href="" class="btn btn-primary btn-sm">엑셀업로드</label></a>
					<button type="button" class="btn btn-secondary btn-sm">삭제</button>
					<button type="submit" class="btn btn-dark btn-sm">저장</button>
				</div>					
				</form>
			</div>
		</div>
		</div>
	</div>					
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function() {
	
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
				$(":input[name=address1]").val(address);
				$(":input[name=address2]").focus();
			}
		}).open();
	});
	
	// 인사 등록 버튼 활성화
	$detailInfo = $("#detail-info");
	
	$("#emp-registration").click(function() {
		
		$("#detail-info").removeClass("d-none");
		
	});
	
	// 직원 상세보기
	$("#table-emp-list tbody tr").click(function() {
		
		let empNo = $(this).attr("data-emp-no");
		let $detailTobody = $("#table-emp-detail tbody");
		let $detail = $("#table-emp-detail");
		
		$.getJSON("/emp/register/detail.json", {no: empNo}, function(emp) {
			
			//alert(JSON.stringify(emp));
			
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
			
			$(":input[name=position]").val(emp.positionNo);
			$(":input[name=department]").val(emp.deptNo);
			
			$("#citizen-no-second").val(emp.citizenNo);
			$("#citizen-no-front").val(emp.citizenNo);			
			
			if (emp.gender == 'M') {
				
				$("#male").prop("checked", "checked");
			}
			if (emp.gender == 'F') {
				
				$("#female").prop("checked", "checked");
			}
			
			let str = emp.citizenNo;
			citizenNoFirst = str.substr(0, 6);
			citizenNoSecond = str.substr(7, 14);
			$("#citizen-no-front").val(citizenNoFirst);
			$("#citizen-no-second").val(citizenNoSecond);
			
		})
		
		$(this).addClass("table-info").siblings().removeClass("table-info")
		$("#detail-info").removeClass("d-none");
		
	})
	
	// Gender
	$(":input[name=gender]").change(function() {
		
	})

})
</script>
</body>
</html>