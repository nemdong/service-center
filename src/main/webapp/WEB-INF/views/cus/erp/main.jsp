<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>애플리케이션</title>

</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container my-3">
	<div class="row mb-3">
   		<div class="col-2">
   			<c:set var="menu1" value="고객관리" />
   			<c:set var="menu2" value="고객관리" />
   			<%@include file="../common/leftbar.jsp" %>
   		</div>
   		<div class="col-10">
<!-- 등록,삭제버튼 검색창 -->
		   <div class="row mt-5">
		   		<div class="col-6">
	   				<span>
						<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#modal-addform-customer">등록</button>
						<button type="button" class="btn btn-secondary btn-sm" id="btn-del-list-cust">삭제</button>
	   				</span>
	   			</div>
	   			<div class="col-6 text-end">
					<form id="form-search-cust" method="get" action="/erp/main">
				        <div class="input-group input-group-sm mb-3">
  							<input type="text" class="form-control" name="keyword" placeholder="이름를 입력하세요" >
  							<button class="btn btn-dark" type="button" id="button-search">검색</button>
						</div>
					</form>
	   			</div>
   			</div>
<!-- 고객 리스트 -->
		   	<div class="row mb-5">
				<div class="col-12">
				<form id="form-list-customer" method="get" action="/erp/delete">
					<table class="table table-sm border-top" id="table-customer-list">
						<colgroup>
							<col width="15%">
							<col width="20%">
							<col width="25%">
							<col width="25%">
						</colgroup>
						<thead>
							<tr class="table-light">
								<th class="text-center"><input type="checkbox" id="checkbox-all" ></th>	<!-- 전체 값 -->
								<th>이름</th>
								<th>전화번호</th>
								<th>이메일</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${empty customers }">
								<tr>
									<td colspan="6" class="text-center">등록된 고객이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="customer" items="${customers }">
									<tr class="align-middle" data-customer-id="${customer.id }">
										<td class="text-center"><input type="checkbox" name="custId" value="${customer.id }"></td>
										<td><a href="" class="text-decoration-none text-dark" data-cust-id="${customer.id }">${customer.name }</a></td>
										<td>${customer.phone }</td>
										<td>${customer.email }</td>
										<td>
											<a href="#"><button class="btn btn-secondary btn-sm">서비스내역</button></a>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
							<tr class="table-light">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>
									<c:if test="${not empty customers }">
										<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-center pagination-sm">
												<li class="page-item">
													<a class="page-link ${pagination.first ? 'disabled' : '' }" 
														href="main?page=${pagination.prevPage }">이전</a>
												</li>	
												<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
													<li class="page-item">
														<a class="page-link ${pagination.page eq num ? 'active' : '' }" href="main?page=${num }">${num }</a>
													</li>	
												</c:forEach>
												
												<li class="page-item">
													<a class="page-link ${pagination.last ? 'disabled' : '' }" 
														href="main?page=${pagination.nextPage }">다음</a>
												</li>	
											</ul>
										</nav>
									</c:if>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
				</div>
			</div>
			
<!-- 고객 상세정보 -->
			<div id="box-detail-customer" class="row mb-3 d-none">
				<div class="col-12">
					<h3>고객 상세정보</h3>
				</div>	
				<div class="col-12">
					<table class="table table-bordered" id="customer-detail-list">
						<colgroup>
							<col width="*%">
							<col width="*%">
							<col width="*%">
							<col width="*%">
						</colgroup>
						<tr>
							<th>고객명</th><td><span id="customer-name"></span></td>
							<th>전화번호</th><td><span id="customer-phone"></span></td>
						</tr>
						<tr>
							<th>이메일</th><td><span id="customer-email"></span></td>
							<th>주소</th><td><span id="customer-address"></span></td>
						</tr>
					</table>
				</div>
				<div class="col-12">
					<div class="text-end">
						<button type="button" class="btn btn-primary btn-sm" id="btn-open-modify-modal">수정</button>
						<button type="button" class="btn btn-secondary btn-sm" id="btn-del-detail-customer">삭제</button>
					</div>
				</div>
			</div>
 		</div>
   </div>
</div>
	
<!-- 고객등록 모달폼 -->
<div class="modal" tabindex="-1" id="modal-addform-customer">
	<div class="modal-dialog modal-lg">
<form:form modelAttribute="customerAddForm" id="form-register" class="border p-3 bg-light" method="post" action="register">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">고객 등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<p>고객 정보를 입력하세요.</p>
					<div class="row mb-1">
						<label class="col-sm-2 col-form-label">고객명</label>
						<div class="col-sm-6">
							<form:input class="form-control form-control-sm" path="name"/>
							<form:errors path="name" cssClass="text-danger"/>
						</div>
					</div>
					<div class="row mb-1">
						<label class="col-sm-2 col-form-label">전화번호</label>
						<div class="col-sm-6">
							<form:input class="form-control form-control-sm" path="phone"/>
							<form:errors path="phone" cssClass="text-danger"/>
						</div>
					</div>
					<div class="row mb-1">
						<label class="col-sm-2 col-form-label">이메일</label>
						<div class="col-sm-6">
							<form:input class="form-control form-control-sm" path="email"/>
							<form:errors path="email" cssClass="text-danger"/>
						</div>
					</div>
					<div class="row mb-1">
						<label class="col-sm-2 col-form-label">주소</label>
						<div class="col-sm-3">
							<form:input class="form-control form-control-sm" path="zipcode" placeholder="우편번호" readonly="readonly"/>
							<form:errors path="zipcode" cssClass="text-danger"/>
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-outline-secondary btn-sm" id="btn-search-add-zipcode">우편번호 검색</button>
						</div>
					</div>
					<div class="row mb-1">
						<div class="col-sm-10 offset-sm-2">
							<form:input class="form-control form-control-sm" path="basicAddress" placeholder="기본주소" readonly="readonly"/>
							<form:errors path="basicAddress" cssClass="text-danger"/>
						</div>
					</div>
					<div class="row mb-1">
						<div class="col-sm-10  offset-sm-2">
							<form:input class="form-control form-control-sm" path="detailAddress"  placeholder="상세주소"/>
							<form:errors path="detailAddress" cssClass="text-danger"/>
						</div>
					</div>
			</div>
			<div class="modal-footer">
				<a href="/erp/main" class="btn btn-secondary btn-sm" >닫기</a>
				<button type="submit" class="btn btn-primary btn-sm">등록</button>
			</div>
		</div>
</form:form>
	</div>
</div>


<!-- 고객수정 모달폼 -->
<div class="modal" tabindex="-1" id="modal-modifyform-customer">
	<div class="modal-dialog modal-lg">

		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">고객 수정</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<p>고객 정보를 입력하세요.</p>
				<form class="border p-3 bg-light">
				<input type="hidden" id="modify-id" name="id" value="" />
					<div class="row mb-1">
						<label class="col-sm-2 col-form-label">고객명</label>
						<div class="col-sm-6">
							<input type="text" id="modify-name" class="form-control form-control-sm" name="name">
						</div>
					</div>
					<div class="row mb-1">
						<label class="col-sm-2 col-form-label">전화번호</label>
						<div class="col-sm-6">
							<input type="text" id="modify-phone" class="form-control form-control-sm" name="phone">
						</div>
					</div>
					<div class="row mb-1">
						<label class="col-sm-2 col-form-label">이메일</label>
						<div class="col-sm-6">
							<input type="text" id="modify-email" class="form-control form-control-sm" name="email">
						</div>
					</div>
					<div class="row mb-1">
						<label class="col-sm-2 col-form-label">주소</label>
						<div class="col-sm-3">
							<input type="text" id="modify-zipcode" class="form-control form-control-sm" name="zipcode" placeholder="우편번호" readonly="readonly">
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-outline-secondary btn-sm" id="btn-search-modify-zipcode">우편번호 검색</button>
						</div>
					</div>
					<div class="row mb-1">
						<div class="col-sm-10 offset-sm-2">
							<input type="text" id="modify-basicAddress" class="form-control form-control-sm" name="basicAddress" placeholder="기본주소" readonly="readonly">
						</div>
					</div>
					<div class="row mb-1">
						<div class="col-sm-10  offset-sm-2">
							<input type="text" id="modify-detailAddress" class="form-control form-control-sm" name="detailAddress" placeholder="상세주소">
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary btn-sm" id="btn-modify-customer" >수정</button>
			</div>
		</div>

	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function() {
	
	let registerModal = new bootstrap.Modal("#modal-addform-customer");

<c:if test="${openAddModal}">
	registerModal.show();
</c:if>
	
	// 우편번호 검색
	$("#btn-search-add-zipcode, #btn-search-modify-zipcode").click(function() {
	  new daum.Postcode({
	    oncomplete: function(data) {
	      // 기본주소 정보를 대입하는 변수를 선언한다.
	      let address;
	      // 사용자가 도로명 주소를 선택했을 때 data.userSelectedType은 R이다.
	      if (data.userSelectedType === 'R') {
	        address = data.roadAddress;
	      } else {
	        address = data.jibunAddress;
	      }
			
	      // 우편번호 입력필드와 기본주소 입력필드에 값을 입력한다.
	      $(":input[name=zipcode]").val(data.zonecode);
	      $(":input[name=basicAddress]").val(address);
		
	      // 상세주소 입력필드에 포커스를 위치시킨다.
	      $(":input[name=detailAddress]").focus();
	    }
	  }).open();
	});
	
	
	let customerModifyModal = new bootstrap.Modal("#modal-modifyform-customer");
	
	// 고객 이름 클릭시 상세정보 보기
	$("#table-customer-list tbody a[data-cust-id]").click(function(event) {
		event.preventDefault();
		
		let clickedCustomerId = $(this).attr('data-cust-id');	// 클릭한 고객 아이디값 조회
		
		$.getJSON('/erp/info', {id: clickedCustomerId}, function(customer) {
			
			// 상세정보 테이블에 값 표시
			$("#customer-name").text(customer.name);
			$("#customer-phone").text(customer.phone);
			$("#customer-email").text(customer.email);
			$("#customer-address").text(customer.detailAddress);
			
			// 수정모달에 값 표시
			$("#modify-id").val(clickedCustomerId);
			$("#modify-name").val(customer.name);
			$("#modify-phone").val(customer.phone);
			$("#modify-email").val(customer.email);
			$("#modify-zipcode").val(customer.zipcode);
			$("#modify-basicAddress").val(customer.basicAddress);
			$("#modify-detailAddress").val(customer.detailAddress);
			
		});
		
		$(this).closest("tr").addClass("table-primary") 
		   .siblings().removeClass('table-primary');
		
		
		$("#box-detail-customer").removeClass("d-none");
		return false;
		
		
	});
	
	// 상세정보 수정버튼 클릭
	$("#btn-modify-customer").click(function() {
		//  모달창의 입력필드의 값을 읽어서 변수에 대입하기
		let idValue = $("#modify-id").val();
		let nameValue = $("#modify-name").val();
		let phoneValue = $("#modify-phone").val();
		let emailValue = $("#modify-email").val();
		let zipcodeValue = $("#modify-zipcode").val();
		let basicAddressValue = $("#modify-basicAddress").val();
		let detailAddressValue = $("#modify-detailAddress").val();
		
		if (nameValue === "") {
			alert("이름은 필수입력값입니다.");
			return false;
		}
		if (phoneValue === "") {
			alert("번호는 필수입력값입니다.");
			return false;
		}
		var phoneCheck = /^\d{2,3}-\d{3,4}-\d{4}$/;
		if (!phoneCheck.test(phoneValue)) {
			alert("유효한 전화번호 형식이 아닙니다.");
			$("#modify-phone").focus();
			return false;
		}
		if (emailValue === "") {
			alert("이메일은 필수입력값입니다.");
			return false;
		}
		if (zipcodeValue === "") {
			alert("우편번호는 필수입력값입니다.");
			return false;
		}
		if (basicAddressValue === "") {
			alert("기본주소는 필수입력값입니다.");
			return false;
		}
		if (detailAddressValue === "") {
			alert("상세주소는 필수입력값입니다.");
			return false;
		}
		
		
		var data = {
			id: idValue, 
			name: nameValue, 
			phone: phoneValue, 
			email: emailValue, 
			zipcode: zipcodeValue, 
			basicAddress: basicAddressValue, 
			detailAddress: detailAddressValue
		}
		
		$.post("/erp/modify", data, function(customer) {
			// 목록의 값 변경
			$("tr.table-primary td:eq(1) a").text(customer.name)
			$("tr.table-primary td:eq(2)").text(customer.phone)
			$("tr.table-primary td:eq(3)").text(customer.email)
			
			// 표의 값 변경
			$("#customer-name").text(customer.name);
			$("#customer-phone").text(customer.phone);
			$("#customer-email").text(customer.email);
			$("#customer-address").text(customer.detailAddress);
			
			customerModifyModal.hide();
			
		});
	});
	
	// 전체 체크박스 토글
	$("#checkbox-all").change(function(){
		
		let checkboxAllChecked = $(this).prop("checked");
		
		$(":checkbox[name=custId]").prop("checked", checkboxAllChecked);
		
		//toggleDelete()
		
		let total = $("input[name=custId]").length;
		let checked = $("input[name=custId]:checked").length;

		if(total != checked) $("#checkbox-all").prop("checked", false);
		else $("#checkbox-all").prop("checked", true); 
	})
	
	// 고객목록 삭제버튼
	$("#btn-del-list-cust").click(function() {
		let checkedCheckboxLen = $("#form-list-customer :checkbox:checked").length;
		if (checkedCheckboxLen == 0) {
			alert("삭제할 고객을 선택해주세요");
			return false;
		}
		$("#form-list-customer").trigger("submit");
	});
	
	// 상세정보 삭제버튼
	$("#btn-del-detail-customer").click(function() {
		let id = $("#table-customer-list tbody tr.table-primary").attr("data-customer-id");
		location.href = "/erp/delete?custId=" + id;
	});
	
	// 고객수정 모달폼 표시
	$("#btn-open-modify-modal").click(function() {
		customerModifyModal.show();
	})
	
	// 검색
	$("#button-search").click(function(){
		$("#form-search-cust").trigger("submit");
	});
});
</script>
</body>
</html>