<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>근태 관리</title>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
   <div class="row mb-3">
   		<div class="col-2">
   			<div class="col-2">
				<h1>leftbar 넣기</h1>
			</div>
   		</div>
   		<div class="col-10">
   			<div class="row mb-1">
				<div class="col-12"><h4 class="fw-bold fs-5">근태 관리</h4></div>
			</div>
			<div class="row mb-3">
				<div class="col-12">
					<div class="bg-light p-2">
						<div class="d-flex justify-content-between">
							<div>
								<table>
									<tr class="align-middle">
										<th>
											<h6 class="mt-2 ms-2 me-2"><span class="text-danger">* </span>근무일자</h6>
										</th>
										<td>
											<input type="date" class="text-left form-control" name="workDate">
										</td>
									</tr>
								</table>
							</div>
							<div>
							<button type="button" class="btn btn-dark btn-xs" id="search-form">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="mb-1 me-1 bi bi-search" viewBox="0 0 16 16">
											<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
								</svg>검색
							</button>
							</div>
						</div>
					</div>
				</div>
			</div>
				
			<div class="row mb-4">
				<div class="col-12">
					<h4 class="fw-bold fs-6 mt-2">일일 근태 등록</h4>
				</div>
				<div class="col-12 border-bottom mb-2">
					<button type="button" class="btn btn-white border-top border-end border-start fs-6">사원개인</button>
				</div>
				<form>
				<div class="col-12">
					<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-2">
						<button class="btn btn-dark me-md-2 btn-sm" type="button">출근</button>
						<button class="btn btn-dark btn-sm" type="button">퇴근</button>
					</div>
				</div>
				<div class="col-12">	
					<table class="table table-sm bg-light">
						<thead class="text-center table-secondary">
							<tr class="align-middle">
								<th>사원번호</th>
								<th>성명</th>
								<th>출근시각</th>
								<th>퇴근시각</th>
								<th>근무시각</th>
								<th>휴일근로</th>
								<th>연장근로</th>
								<th>지각시간</th>
								<th>조퇴시간</th>
							</tr>
						</thead>
						<tbody class="text-center">
							<tr class="align-middle">
								<td>00000000</td>
								<td>홍길동</td>
								<td>09:00</td>
								<td>18:00</td>
								<td>08:00</td>
								<td>00:00</td>
								<td>00:00</td>
								<td>00:00</td>
								<td>00:20</td>
							</tr>
						</tbody>	
					</table>
				</div>
			</div>
			<div class="row mb-4">
				<div class="col-6 border-bottom mb-2">
					<h4 class="fw-bold fs-6 mt-2">월 근태 확인</h4>
				</div>
				<div class="col-6 text-end">
					<button class="mt-1 mb-1 text-end btn btn-outline-secondary btn-sm">행 삭제</button>
				</div>
				<div class="col-12">
					<div style="overflow-y:auto !important; width:100%; max-height:150px !important; display:block !important;">	
						<table class="table table-sm table-bordered bg-light">
							<thead class="text-center table-secondary">
								<tr class="align-middle">
									<th></th>
									<th>근무일자</th>
									<th>출근시각</th>
									<th>퇴근시각</th>
									<th>근무시각</th>
									<th>휴일근로</th>
									<th>연장근로</th>
									<th>지각시간</th>
									<th>조퇴시간</th>
								</tr>
							</thead>
							<tbody class="text-center">
								<tr class="align-middle">
									<td><input type="checkbox"/></td>
									<td>2023-02-10</td>
									<td>09:00</td>
									<td>18:00</td>
									<td>08:00</td>
									<td>00:00</td>
									<td>00:00</td>
									<td>00:00</td>
									<td>00:20</td>
								</tr>
							</tbody>	
						</table>
					</div>	
				</div>
			</div>
			</form>
			<div class="row mb-4">
				<div class="col-12 border-bottom mb-2">
					<h4 class="fw-bold fs-6 mt-2">000님의 월 근태 일수</h4>
				</div>
				<div class="col-12 bg-light">
					<table class="table table-sm mt-2">
						<thead class="text-center">
							<tr class="align-middle">
								<th class="table-secondary">총근무일수</th>
								<td>
									<input type="text" class="form-control" readonly/>
								</td>
								<th class="table-secondary">평일근무일수</th>
								<td>
									<input type="text" class="form-control" readonly/>
								</td>
								<th class="table-secondary">휴일근무일수</th>
								<td>
									<input type="text" class="form-control" readonly/>
								</td>
							</tr>
							<tr class="align-middle">
								<th class="table-secondary">휴가사용일수</th>
								<td>
									<input type="text" class="form-control" readonly/>
								</td>
								<th class="table-secondary">기타휴가일수</th>
								<td>
									<input type="text" class="form-control" readonly/>
								</td>
								<th class="table-secondary">결근일수</th>
								<td>
									<input type="text" class="form-control" readonly/>
								</td>
							</tr>
						</thead>
					</table>
				</div>				
			</div>		
   		</div>
   </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>