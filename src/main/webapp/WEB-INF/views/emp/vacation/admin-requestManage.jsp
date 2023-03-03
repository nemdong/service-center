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
<div class="container">
   <div class="row mb-3">
   		<div class="col-2">
   			<c:set var="menu1" value="휴가관리"/>
   			<c:set var="menu2" value="요청관리"/>
   			<%@include file="../common/leftbar.jsp" %>
   		</div>
   		<div class="col-10">
   		   	<div class="row mb-5">
   				<div class="col-12">
   					<div class="row text-end">                                                                                                             
						<div class="col-lg-12">                                                                                                   
							<form method="get" action="requestManage" id="searchForm">                                                   
								<select name="type">                                                                                              
					                <option value="empName" ${param.type eq 'empName' ? 'selected' : '' }>요청자</option>                 
					                <option value="requestType" ${param.type eq 'requestType' ? 'selected' : '' }>요청종류</option>                 
					                <option value="approvalStatus" ${param.type eq 'approvalStatus' ? 'selected' : '' }>상태</option>                 
								</select>                                                                                                         
								<input type="text" name="keyword" value="${param.keyword }"/>                            
								<button type="submit" class="btn btn-default">검색</button>                                                                   
							</form>                                                                                                               
						</div>                                                                                                                    
					</div> 
   				</div>
   			</div>
   			<div class="row mb-3">
   				<div class="col-12">
   					<table class="table">
   						<colgroup>
   							<col width="*">
   							<col width="*">
   							<col width="*">
   							<col width="*">
   							<col width="*">
   							<col width="*">
   						</colgroup>
   						<thead>
   							<tr>
   								<th>요청종류</th>
   								<th>요청보낸사람</th>
   								<th>요청사항</th>
   								<th>요청사유</th>
   								<th>상태</th>
   								<th>관리</th>
   							</tr>
   						</thead>
   						<tbody>
   						<c:choose>
   							<c:when test="${not empty vacRequests }">
   								<c:forEach var="req" items="${vacRequests }">
		   							<tr>
		   								<td>${req.requestType }</td>
		   								<td>${req.empName }</td>
		   								<td>
		   									<span class="badge bg-warning py-1 px-2">${req.catName }</span>
		   									${req.start} ~ ${req.end }
		   								</td>
		   								<!-- <td>1월 11일(화) 9AM ~ 6PM 반차 (4h, 0.5일)</td> -->
		   								<td>${req.note }</td>
		   								<td>
			   								<c:if test="${req.approvalStatus eq '대기중' }"><span class="badge text-bg-success py-2 px-2">${req.approvalStatus }</span></c:if>
											<c:if test="${req.approvalStatus eq '승인됨' }"><span class="badge text-bg-primary py-2 px-2">${req.approvalStatus }</span></c:if>
											<c:if test="${req.approvalStatus eq '거절됨' }"><span class="badge text-bg-secondary py-2 px-2">${req.approvalStatus }</span></c:if>
		   								</td>
		   								<td>
		   									<c:if test="${req.approvalStatus eq '대기중' }">
		   										<a href="approval?no=${req.requestNo }&minusDays=${req.minusDays}&period=${req.period}&empNo=${req.empNo}&catNo=${req.catNo}" class="btn btn-primary btn-sm">승인</a> 
		   										<a href="deny?no=${req.requestNo }"class="btn btn-secondary btn-sm">거절</a>
		   									</c:if>
		   									<c:if test="${req.approvalStatus eq '승인됨' }"></c:if>
		   									<c:if test="${req.approvalStatus eq '거절됨' }"></c:if>
		   								</td>
		   							</tr>
   								</c:forEach>
   							</c:when>
   							<c:otherwise>
   								<tr>
   									<td colspan="5" class="text-center">요청내용이 없습니다.</td>
   								</tr>
   							</c:otherwise>
   						</c:choose>
   						</tbody>
   					</table>
					<c:if test="${not empty vacRequests }">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center pagination-sm">
								<li class="page-item">
									<a class="page-link ${pagination.first ? 'disabled' : '' }" 
										href="requestManage?page=${pagination.prevPage }">이전</a>
								</li>	
								<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
									<li class="page-item">
										<a class="page-link ${pagination.page eq num ? 'active' : '' }" href="requestManage?page=${num }">${num }</a>
									</li>	
								</c:forEach>
								
								<li class="page-item">
									<a class="page-link ${pagination.last ? 'disabled' : '' }" 
										href="requestManage?page=${pagination.nextPage }">다음</a>
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
<script src="https://momentjs.com/downloads/moment.min.js" type="text/javascript"></script>
</body>
</html>