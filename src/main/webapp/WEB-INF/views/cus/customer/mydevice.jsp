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
			<h1 class="border bg-light p-2 fs-4">나의 기기 확인</h1>
		</div>
	</div>
	
	<div class="row mb-3">
		<div class="col-12">
			<p class="mb-2 p-2">   
				[나의 기기 정보]
				<button class="btn btn-secondary float-end btn-sm"  data-bs-toggle="modal" data-bs-target="#modal-device-register">제품 등록</button>
			</p>
			<table class="table table-bordered mt-2">
				<colgroup>
					<col width="10%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr class="text-center">
						<th>순번</th>
						<th>제품종류</th>
						<th>제품명</th>
						<th>구입시기</th>
						<th>렌탈여부</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${empty dtos }">
					<tr>
						<td colspan="6" class="text-center">등록된 기기가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${dtos}" varStatus="loop">
					<tr class="align-middle text-center">
						<td>${loop.count }</td>
						<td>${dto.deviceCategoryName } (${dto.deviceCategoryProduct })</td>
						<td>${dto.deviceName }</td>
						<td><fmt:formatDate value="${dto.sellDate }" pattern="yyyy년 M월 d일" /></td>
						<td><input type="checkbox" class="form-check-input" value="${dto.rental }" ${dto.rental eq 'Y' ? 'checked' : ''} /></td>
						<td><a href="/customer/mypage" class="btn btn-outline-primary btn-sm">서비스이력</a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>






			
<!----------------------- 제품 등록 모달폼 ------------------------>
<div class="modal" tabindex="-1" id="modal-device-register">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">보유 제품</h5>
			</div>
			<div class="modal-body">
				<p><strong><sec:authentication property="principal.name" /></strong>님이 보유한 디바이스를 등록해주세요.</p>
				<form id="modal-device-register" class="border bg-light p-3" method="post" action="register">
					<div class="mb-3">
						<label class="form-label">제품명</label>
						<input class="form-control" name="deviceName" >
					</div>
					<div class="mb-3">
	                    <label class="form-label">구입시기</label>
	                    <input type="date" class="form-control" name="sellDate" />
					</div>
					<div class="mb-3">
						<label class="form-label">제품 종류</label>
						<select class="form-select form-select-sm" name="catNo">
							<option value="">디바이스 종류를 선택해주세요.</option>
							<c:forEach var="cat" items="${categories }">
								<option value="${cat.deviceCategoryNo }"> ${cat.deviceCategoryName } (${cat.deviceCategoryProduct })</option>
							</c:forEach>
					     </select> 
					</div>
					<div class="mb-3">
					    <label class="form-label">렌탈여부</label>
					    <input type="radio" name="rental" value="Y" > 예
                        <input type="radio" name="rental" value="N" checked> 아니오		
					</div>
					<div class="text-end">
					    <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-primary btn-sm">제품등록</button>
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
	
	$("#modal-device-register").submit(function() {
		let deviceName = $("#modal-device-register :input[name=deviceName]").val();
		let sellDate = $("#modal-device-register :input[name=sellDate]").val();
		let catNo = $("#modal-device-register :input[name=catNo]").val();
		let rental = $("#modal-device-register :input[name=rental]").val();
		
		if (deviceName == "") {
			alert("제품명을 선택해주세요.");
			return false;
		}
		if (sellDate == "") {
			alert("구입시기를 입력해주세요.");
			return false;
		}
		
		if (catNo == "") {
			alert("디바이스 종류 선택해주세요.");
			return false;
		}
		if (rental == "") {
			alert("렌탈여부를 입력해주세요.");
			return false;
		}
		alert("제품이 등록되었습니다.");
		return true;
	});
	
});

</script>
</body>
</html>