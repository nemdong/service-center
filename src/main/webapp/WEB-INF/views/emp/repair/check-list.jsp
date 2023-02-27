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
			<p>메뉴</p>		
		</div>
		<div class="col-10">
			<div class="row">
				<div class="col-12 border bg-light p-2 mb-4"><h2>A/S 접수확인</h2></div>
			</div>
			<div class="row justify-content-end">
				<div class="col-4 mb-2">
					<div class="input-group">					  
					  <select class="form-select form-select-sm" name="opt" aria-label="Example select with button addon">
					    <option value="cusName">고객명</option>
					    <option value="date1">예정일자</option>
					    <option value="date2">접수일자</option>
					  </select>
					  <input type="text text-end" class="form-control" aria-label="Text input with 2 dropdown buttons">
					  <button class="btn btn-outline-primary" type="submit">검색</button>
    				</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<table class="table">
						<thead class="table-secondary text-center">
							<tr>
								<th>접수번호</th>
								<th>예약일자</th>
								<th>접수일자</th>
								<th>고객명</th>
							</tr>
						</thead>
						<tbody class="text-center">
							<c:choose>
								<c:when test="${empty asCheckList }">
									<tr>
										<td colspan="4" class="text-center">배정된 고객이 존재하지 않습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="asCheck" items="${asCheckList }">
										<tr>
											<td>${asCheck.registrationNo }</td>
											<td><fmt:formatDate value="${asCheck.reservationDate }" pattern="yyyy-MM-dd"/></td>
											<td><fmt:formatDate value="${asCheck.registrationDate }" pattern="yyyy-MM-dd"/></td>
											<td><a href="check-detail?registrationNo=${asCheck.registrationNo }">${asCheck.name }</a></td>
										</tr>										
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<c:if test="${not empty asCheckList }">
						<nav aria-label="Page navigation example">
						  <ul class="pagination pagination-sm justify-content-center">
						    <li class="page-item">
						      <a class="page-link ${pagination.first ? 'disabled' : '' }" 
						      		href="assign?page=${pagination.prevPage }">이전</a>
						    </li>
						    <c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
							    <li class="page-item">
							    	<a class="page-link ${pagination.page eq num ? 'active' : '' }" href="check-list?page=${num }">${num }</a>
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
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>