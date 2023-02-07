<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>애플리케이션</title>

</head>
<body>
<div class="container my-3">
	<div class="row mb-3">
   		<div class="col-2">
   			<h3>메뉴</h3>
   		</div>
   		<div class="col-10">
<!---------------- 등록,삭제버튼 검색창 ----------------->
		   <div class="row mt-5">
		   		<div class="col-6">
	   				<span>
						<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#modal-addform-customer">등록</button>
						<a href="#"><button type="button" class="btn btn-secondary btn-sm">삭제</button></a>
	   				</span>
	   			</div>
	   			<div class="col-6 text-end">
					<form class="">
				        <div class="input-group input-group-sm mb-3">
  							<input type="text" class="form-control" placeholder="검색어를 입력하세요" >
  							<button class="btn btn-dark" type="button" id="button-addon2">검색</button>
						</div>
					</form>
	   			</div>
   			</div>
<!------------------- 고객 리스트 ------------------->
		   	<div class="row mb-5">
				<div class="col-12">
					<table class="table table-sm border-top" id="table-customer-list">
						<colgroup>
							<col width="15%">
							<col width="15%">
							<col width="25%">
							<col width="25%">
						</colgroup>
						<thead>
							<tr class="table-light">
								<th class="text-center"><input type="checkbox" id="" ></th>
								<th></th>
								<th>이름</th>
								<th>전화번호</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="8" class="text-center">연락처가 없습니다.</td>
							</tr>
							<tr class="align-middle">
								<td class="text-center"><input type="checkbox" name="" value=""></td>
								<td></td>
								<td><a href="" class="text-decoration-none text-dark" data-cust-id="100">홍길동</a></td>
								<td>010-2222-2222</td>
								<td>
									<a href="#"><button class="btn btn-secondary btn-sm"">서비스내역</button></a>
								</td>
							</tr>
							<tr class="align-middle">
								<td class="text-center"><input type="checkbox" name="" value=""></td>
								<td></td>
								<td><a href=""  class="text-decoration-none text-dark" data-cust-id="100">홍길동</a></td>
								<td>010-2222-2222</td>
								<td>
									<a href="#"><button class="btn btn-secondary btn-sm"">서비스내역</button></a>
								</td>
							</tr>
							<tr class="align-middle">
								<td class="text-center"><input type="checkbox" name="" value=""></td>
								<td></td>
								<td><a href="" class="text-decoration-none text-dark" data-cust-id="100">홍길동</a></td>
								<td>010-2222-2222</td>
								<td>
									<a href="#"><button class="btn btn-secondary btn-sm"">서비스내역</button></a>
								</td>
							</tr>
							<tr class="table-light">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>
									<nav aria-label="Page navigation example">
									  <ul class="pagination pagination-sm">
									    <li class="page-item">
									      <a class="page-link" href="#" aria-label="Previous">
									        <span aria-hidden="true">&laquo;</span>
									      </a>
									    </li>
									    <li class="page-item"><a class="page-link" href="#">1</a></li>
									    <li class="page-item"><a class="page-link" href="#">2</a></li>
									    <li class="page-item"><a class="page-link" href="#">3</a></li>
									    <li class="page-item">
									      <a class="page-link" href="#" aria-label="Next">
									        <span aria-hidden="true">&raquo;</span>
									      </a>
									    </li>
									  </ul>
									</nav>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
	<!-------------------- 고객 상세정보 ----------------------->
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
								<th>고객명</th><td>홍길동</td>
								<th>전화번호</th><td>010-2222-2222</td>
							</tr>
							<tr>
								<th>이메일</th><td>hong@mail</td>
								<th>주소</th><td>길동아파트</td>
							</tr>
					</table>
				</div>
				<div class="col-12">
					<div class="text-end">
						<button type="button" class="btn btn-primary btn-sm" id="btn-open-modify-modal">수정</button>
						<a href="#"><button type="button" class="btn btn-secondary btn-sm">삭제</button></a>
					</div>
				</div>
			</div>
 		</div>
   </div>
</div>
	
<!--------------------- 고객등록 모달폼 ------------------------>
<div class="modal" tabindex="-1" id="modal-addform-customer">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">고객 등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<p>고객 정보를 입력하세요.</p>
				<form class="border p-3 bg-light">
					<div class="row mb-1">
						<label class="col-sm-2 col-form-label">고객명</label>
						<div class="col-sm-6">
							<input type="text" class="form-control form-control-sm" name="">
						</div>
					</div>
					<div class="row mb-1">
						<label class="col-sm-2 col-form-label">전화번호</label>
						<div class="col-sm-6">
							<input type="text" class="form-control form-control-sm" name="">
						</div>
					</div>
					<div class="row mb-1">
						<label class="col-sm-2 col-form-label">이메일</label>
						<div class="col-sm-6">
							<input type="text" class="form-control form-control-sm" name="">
						</div>
					</div>
					<div class="row mb-1">
						<label class="col-sm-2 col-form-label">주소</label>
						<div class="col-sm-3">
							<input type="text" class="form-control form-control-sm" name="" placeholder="우편번호">
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-outline-secondary btn-sm">우편번호 검색</button>
						</div>
					</div>
					<div class="row mb-1">
						<div class="col-sm-10 offset-sm-2">
							<input type="text" class="form-control form-control-sm" name="" placeholder="기본주소">
						</div>
					</div>
					<div class="row mb-1">
						<div class="col-sm-10  offset-sm-2">
							<input type="text" class="form-control form-control-sm" name="" placeholder="상세주소">
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary btn-sm" >등록</button>
			</div>
		</div>
	</div>
</div>
<!----------------------- 고객수정 모달폼 -------------------------->
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
					<div class="row mb-1">
						<label class="col-sm-2 col-form-label">고객명</label>
						<div class="col-sm-6">
							<input type="text" class="form-control form-control-sm" name="name">
						</div>
					</div>
					<div class="row mb-1">
						<label class="col-sm-2 col-form-label">전화번호</label>
						<div class="col-sm-6">
							<input type="text" class="form-control form-control-sm" name="">
						</div>
					</div>
					<div class="row mb-1">
						<label class="col-sm-2 col-form-label">이메일</label>
						<div class="col-sm-6">
							<input type="text" class="form-control form-control-sm" name="">
						</div>
					</div>
					<div class="row mb-1">
						<label class="col-sm-2 col-form-label">주소</label>
						<div class="col-sm-3">
							<input type="text" class="form-control form-control-sm" name="" placeholder="우편번호">
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-outline-secondary btn-sm">우편번호 검색</button>
						</div>
					</div>
					<div class="row mb-1">
						<div class="col-sm-10 offset-sm-2">
							<input type="text" class="form-control form-control-sm" name="" placeholder="기본주소">
						</div>
					</div>
					<div class="row mb-1">
						<div class="col-sm-10  offset-sm-2">
							<input type="text" class="form-control form-control-sm" name="" placeholder="상세주소">
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary btn-sm" >수정</button>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	let customerModifyModal = new bootstrap.Modal("#modal-modifyform-customer");
	
	$("#table-customer-list tbody a[data-cust-id]").click(function() {
		//alert("aaa")
		$("#box-detail-customer").toggleClass("d-none");
		return false;
	});
	
	$("#btn-open-modify-modal").click(function() {
		
		$("#modal-modifyform-customer :input[name=name]").val("홍길동");
		
		customerModifyModal.show();
	})
});
</script>
</body>
</html>