<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>서비스 센터</title>
</head>
<body>
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
							<tr>
								<td>3</td>
								<td>2023-02-03</a></td>
								<td>2023-02-01</td>
								<td><a href="">이민형</a></td>
							</tr>	
							<tr>
								<td>2</td>
								<td>2023-02-01</a></td>
								<td>2023-01-30</td>
								<td><a href="">한워치</a></td>
							</tr>	
							<tr>
								<td>1</td>
								<td>2023-01-31</a></td>
								<td>2023-01-26</td>
								<td><a href="">김애플</a></td>
							</tr>	
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<nav aria-label="Page navigation example">
					  <ul class="pagination justify-content-center">
					    <li class="page-item disabled">
					      <a class="page-link">Previous</a>
					    </li>
					    <li class="page-item"><a class="page-link" href="#">1</a></li>
					    <li class="page-item active" aria-current="page">
					    	<a class="page-link" href="#">2</a></li>
					    <li class="page-item"><a class="page-link" href="#">3</a></li>
					    <li class="page-item">
					      <a class="page-link" href="#">Next</a>
					    </li>
					  </ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>