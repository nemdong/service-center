<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>서비스 센터</title>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-2">
			<c:set var="menu1" value="A/S관리" />
			<c:set var="menu2" value="a/s접수확인" />
			<%@include file="../common/leftbar.jsp" %>
		</div>
		<div class="col-10">
			<div class="row">
				<div class="col-12 border bg-light p-2 mb-5"><h2>A/S 접수확인 상세페이지</h2></div>
			</div>
			<div class="row">
				<p><strong class="text-primary fs-4">${asCheckDetail.name }</strong>님의 접수 상세내용입니다.</p>
			</div>
			<form id="" class="border bg-light p-3 mb-3" method="" action="">
				<div class="row">
					<table class="table table-bordered">
			         	<colgroup>
				            <col style="width: 15%;">
				            <col style="width: 35%;">
				            <col style="width: 15%;">
				            <col style="width: 35%;">
			         	</colgroup>
			         	<tbody>
				            <tr>
				               <th>고객명</th>
				               <td>${asCheckDetail.name }</td>
				               <th>예약일자</th>
				               <td><fmt:formatDate value="${asCheckDetail.reservationDate }" pattern="yyyy-MM-dd" /></td>
				            </tr>
				            <tr>
				               <th>모델명</th>
				               <td>${asCheckDetail.deviceName }</td>
				               <th>구입시기</th>
				               <td><fmt:formatDate value="${asCheckDetail.sellDate }" pattern="yyyy-MM-dd" /></td>
				            </tr>
				            <tr>
				               <th>예약시간</th>
				               <td>${asCheckDetail.reservationHour }</td>
				            </tr>   
				         </tbody> 
				     </table>
				</div>           
				<div class="row mb-3">
					<textarea class="form-control" placeholder="${asCheckDetail.serviceCatName }" id="floatingTextarea2" style="height: 100px" readonly></textarea>
				</div>
				
				<div class="row mb-3">
					<div class="col text-center">
						<button type="button" class="btn btn-success" id="btn-submit-assign">나에게 배정</button>
					</div>
				</div>
			</form>	
			<div class="col text-end">	
				<a href="check-list" class="btn btn-secondary">목록</a>				
		 	</div>
		</div>
	</div>   
</div>

<%-- 
	접수불가 사유 등록 모달폼
<div class="modal" tabindex="-1" id="modal-form-comment">
	<div class="modal-dialog">
		<form id="form-add-depts" class="p-3" method="post" action="insert-comment">
		<!-- 
			히든 필드에 게시글을 글번호를 설정합니다.
		 -->
		<input type="hidden" name="checkNo" value="">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">접수 불가 사유</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
					<div class="row mb-2">
						<div class="col-sm-12">
							<textarea class="form-control" rows="3" name="content"></textarea>
						</div>
					</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary btn-xs" data-bs-dismiss="modal">닫기</button>
				<button type="submit" class="btn btn-primary btn-xs">등록</button>
			</div>
		</div>
		</form>
	</div>
</div>
--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js">
$(function() {
	
	$("#btn-submit-assign").click(function() {
		if ($("#select-hour").val() == null) {
			alert("시간을 선택해주세요");
			return false;
		}
	})
	
	
})
</script>
</body>
</html>