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
			<c:set var="menu2" value="a/s배정" />
			<%@include file="../common/leftbar.jsp" %>		
		</div>
		<div class="col-10">
			<div class="row">
				<div class="col-12 border bg-light p-2 mb-4"><h2>A/S 기사 배정</h2></div>
			</div>
			<div class="row">
				<p>기사를 배정해주세요.</p>
			</div>
			<div class="row">
			<!-- 
				배정 목록
			 -->
				<div class="col-6">
					<div class="row">
						<div class="col-6 mb-2">
							<div class="input-group">					  
							  <select class="form-select form-select-sm" name="opt" aria-label="Example select with button addon">
							    <option value="cusName">고객명</option>
							    <option value="emp">배정직원</option>
							    <option value="date2">접수일자</option>
							  </select>
					  <input type="text text-end" class="form-control" aria-label="Text input with 2 dropdown buttons">
					  <button class="btn btn-outline-primary" type="submit">검색</button>
    				</div>
						</div>
					</div>
					<div class="row">					
						<table class="table" id="table-assign-list">
							<thead class="table-secondary text-center">
								<tr>								
									<th>접수번호</th>
									<th>접수일자</th>
									<th>고객명</th>
									<th>배정직원</th>
									<th>배정상태</th>								
								</tr>
							</thead>
							<tbody class="text-center">
								<c:choose>
									<c:when test="${empty assignList }">
										<!-- 등록된 접수내역이 없을때 출력 -->
										<tr>
											<td colspan="5">접수내역이 존재하지 않습니다.</td>
										</tr>									
									</c:when>
									<c:otherwise>
										<c:forEach var="assign" items="${assignList }" >
											<!-- 등록된 접수내역이 있을때 갯수만큼 출력 -->
											<tr>
												<td>${assign.no }</td>
												<td><fmt:formatDate value="${assign.registrationDate }" pattern="yyyy-MM-dd" /></td>
												<td><a href="" data-assign-no="${assign.no}">${assign.name }</a></td>
												<td>${assign.empName }</td>
												<td class="${assign.assignStatus eq '미배정' ? 'text-danger' : 'text-success' } fw-bold" >${assign.assignStatus }</td>
											</tr>											
										</c:forEach>
									</c:otherwise>
								</c:choose>	
							</tbody>
						</table>
					</div>
					<div class="row">
						<div class="col">
							<c:if test="${not empty assignList }">
								<nav aria-label="Page navigation example">
								  <ul class="pagination pagination-sm justify-content-center">
								    <li class="page-item">
								      <a class="page-link ${pagination.first ? 'disabled' : '' }" 
								      		href="assign?page=${pagination.prevPage }">이전</a>
								    </li>
								    <c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
									    <li class="page-item">
									    	<a class="page-link ${pagination.page eq num ? 'active' : '' }" href="assign?page=${num }">${num }</a>
									    </li>								    
								    </c:forEach>								    
								    <li class="page-item">
								      <a class="page-link ${pagination.last ? 'disabled' : '' }" 
								      		href="assign?page=${pagination.nextPage }">다음</a>
								    </li>
								  </ul>
								</nav>							
							</c:if>
						</div>					
					</div>	
				</div>
				<div class="col-6">
				<!-- 
					접수상세내역
				 -->
					<div id="box-form-assign" class="row mb-3">
						<div class="col">
							<form id="form-post" class="border bg-light p-3" method="post" action="/assign">
								<sec:csrfInput/>
								<input type="hidden" id="service-no" name="serviceNo" value="">
								<h7 class="fw-bold">접수상세내역</h7>
								<hr class="border border-1 opacity-50">
								<div class="row">
									<label class="col-sm-3 col-form-label">고객명</label>
									<div class="col-sm-5">
										<input type="text" class="form-control-plaintext text-decoration-underline" id="form-cus-name" />
									</div>
								</div>
								<div class="row">
									<label class="col-sm-3 col-form-label">접수일자</label>
									<div class="col-sm-5">
										<input type="text" class="form-control-plaintext text-decoration-underline" id="form-regist-date" />
									</div>
								</div>
								<div class="row">
									<label class="col-sm-3 col-form-label">배정직원</label>
									<div class="col-sm-5">
								        <select class="form-select form-select" name="assignEmp" id="select-emp">
									        	<option value="" selected disabled>직원을 선택하세요.</option>
									        <%-- <c:forEach var="asEmp" items="${allAsEmp }">
											  	<option value="${asEmp.empNo}">${asEmp.empName }</option>							        
									        </c:forEach> --%>
										</select>								
									</div>
								</div>
								<div class="row">
									<label class="col-sm-3 col-form-label">예약일자</label>
									<div class="col-sm-5">
										<input type="text" class="form-control-plaintext text-decoration-underline" id="form-reserv-date" />
									</div>
								</div>
								<div class="row">
									<label class="col-sm-3 col-form-label">예약시간</label>
									<div class="col-sm-5">
										<input type="text" class="form-control-plaintext text-decoration-underline" id="form-reserv-hour" />
									</div>
								</div>
								<div class="row">
									<label class="col-sm-3 col-form-label">접수 내용</label>
									<textarea rows="4" class="form-control text-decoration-underline" id="form-content"></textarea>
								</div>	
								<hr class="border border-1 opacity-50">			
								<div class="text-end">									
									<button type="button" class="btn btn-secondary btn-sm" id="btn-cancer-emp">취소</button>
									<button type="button" class="btn btn-primary btn-sm" id="btn-submit-emp">직원배정</button>
								</div>
							</form>
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
	
	// 직원배정 완료 후 폼 지우기
	function clearForm() {
		$("#service-no").val("");
		$("#form-cus-name").val("");
		$("#form-regist-date").val("");
		$("#select-emp").val("");
		$("#form-reserv-date").val("");
		$("#form-reserv-hour").val("");
		$("#form-content").val("");		
	}
	
	// 배정직원 선택 후 제출
	$("#btn-submit-emp").click(function() {
		if ($("#select-emp").val() == null) {
			alert("직원을 선택하세요");
			return false;
		}
		
		
		let assignEmp = {
			serviceNo: $("#service-no").val(),
			empNo: $("#select-emp").val(),
			'_csrf' : $(":input[name='_csrf']").val()
		};
		
		$.ajax({
			type: 'POST',
			url: "/emp/repair/assign",
			data: assignEmp,
			dataType: "json",
			success: function(response) {
				let empName = $("#select-emp option:selected").text();
				$("#table-assign-list tbody tr.table-primary td:eq(3)").text(empName);
				$("#table-assign-list tbody tr.table-primary td:eq(4)").text("배정완료").removeClass("text-danger").addClass('text-success fw-bold');
				
				alert("배정이 완료되었습니다.");
				
				clearForm();
			},
			error: function() {
				alert("배정중 오류가 발생하였습니다.");
			}
		})
	})
	
	
	/*
		response = {
			assignDetail: {serviceNo: 11111, name:"홍길동", },
			employees : [{no:100, name:''}, {no:200, name:'2--'}]
		}
	*/
	

	// 접수상세내역 조회
	$("#table-assign-list tbody").on('click', 'a', function() {
		event.preventDefault();
		$(this).closest("tr").addClass("table-primary").siblings().removeClass("table-primary");
		
		let no = $(this).attr("data-assign-no");
		
		$.get(`/emp/repair/assign/\${no}`, function(response) {
			
			let $select = $("#select-emp").empty();
			$.each(response.employees, function(index, emp) {
				let opt = `<option value="\${emp.empNo}"> \${emp.empName}</option>`
				$select.append(opt);
			})
			
			$("#service-no").val(response.assignDetail.serviceNo);
			$("#form-cus-name").val(response.assignDetail.name);
			$("#form-regist-date").val(response.assignDetail.registrationDate);
			if (response.assignDetail.empNo != 0) {
				$("#select-emp").val(response.assignDetail.empNo);
			} else {
				$("#select-emp").val("");
			}
			$("#form-reserv-date").val(response.assignDetail.reservationDate);
			$("#form-reserv-hour").val(response.assignDetail.reservationHour);			
			$("#form-content").val(response.assignDetail.serviceCatName);
			
			//$("#select-emp").val(response.employees.empName);
			
		}, 'json')

	})
	
	/*
	$("#form-post").submit(function() {
		let empName = $("#form-post select[name=assignEmp]").val();
		
		if (empName == "") {
			alert("배정 직원을 선택하세요.");
			return false;
		}		
		return true;
	})
	*/
	
})
</script>
</body>
</html>