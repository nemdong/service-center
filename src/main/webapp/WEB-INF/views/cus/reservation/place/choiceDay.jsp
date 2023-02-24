<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title></title>
</head>
<body>
<c:set var="menu" value="reservation" />
<%@ include file="../../common/navbar.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-2"></div>
		
		<div class="col-10">
			<div class="row mb-4">
				<div class="col-12 mb-3">
					<h1>물건 접수 날짜</h1>
				</div>
				<div class="col-10 border-bottom"></div>
			</div>
			
			<h2><strong>${location.name }</strong></h2> 
			<p class="mt-2">${location.basicAddress }</p>
			<p>회수 시간: <strong class="ms-2">${location.pickupDescription }</strong> 
				<a class="ms-3" href="device" style="text-decoration:none;"><strong>(기기 변경)</strong></a>
			</p> 
			
			<div class="row mt-3">
				<div class="col-12 accordion" id="accordionExample">
					<div class="accordion-item col-10">
						<h2 class="accordion-header" id="headingOne">
							<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
								<h5><strong>예약하기</strong></h5>
							</button>
						</h2>
						<div id="collapseOne" class="col-12 accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
							<table>
								<colgroup>
									<col width="20%">
									<col width="20%">
									<col width="60%">
								</colgroup>
								<tbody>
									<tr>
										<td>
											<div class="col-6 bg-light ms-3 mt-1" style="height:270px; width:500px;" >
												<h5 class="p-2"><strong>날짜</strong></h5>
												<table class="m-5">
													<colgroup>
														<col width="5%">
														<col width="5%">
														<col width="5%">
														<col width="5%">
														<col width="5%">
														<col width="5%">
														<col width="5%">
														<col width="5%">
													</colgroup>
													<tr id="day-of-week">
													</tr>
													<tbody>
														<tr id="day">
														</tr>
													</tbody>
												</table>
											</div>
										</td>
										<td>
											<div class="col-4 bg-light ms-3 mt-1" style="height:270px; width:300px;">
												<p class="pt-4 mt-2 d-flex justify-content-center"><strong>${device.deviceCategoryName }</strong></p>
													<c:choose>
														<c:when test="${device.deviceCategoryProduct == 'phone' }">
															<image src="/resources/images/samplePhone-1.png" width="110" height="120" class="img-thumnail rounded mx-auto d-block">
														</c:when>
														<c:when test="${device.deviceCategoryProduct == 'pad' }">
															<image src="/resources/images/simplePad-1.png" width="110" height="120" class="img-thumnail rounded mx-auto d-block">
														</c:when>
														<c:otherwise>
															<image src="/resources/images/earphone-pro.png" width="110" height="120" class="img-thumnail rounded mx-auto d-block">
														</c:otherwise>
													</c:choose>
											<div class="col-10 border-bottom ms-4 mt-3"></div>
											<p class="mt-2 d-flex justify-content-center">${serviceInfo.serviceCatName }</p>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			
			<form class="d-none" id="address-form" method="post" action="successReservation">
				<div class="row mt-3">
					<div class="col-12">
						<input type="hidden" name="reservDate" id="reserv-date" />
						<h5 class="mb-2"><strong>받을 주소</strong></h5>
						<table>
							<colgroup>
								<col width="7%">
								<col width="20%">
								<col width="30%">
							</colgroup>
							<tbody>
								<tr>
									<td>
										<input type="text" class="form-control form-control-sm" placeholder="우편번호" name="zipCode" id="zipCode" readonly />
									</td>
									<td>
										<button type="button" class="btn border btn-sm ms-2" id="find-address">주소 검색</button>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<input type="text" class="form-control form-control-sm" placeholder="주소" name="basicAddress" id="basicAddress" readonly />
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<input type="text" class="form-control form-control-sm" placeholder="상세주소 입력" name="detailAddress" id="detailAddress" />
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				
				<button type="button" class="btn btn-dark font-white btn-sm mt-5" id="check-reservation">접수 등록</button>
			</form>
			
		</div>

</div>

<%-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ확인 모달 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ --%>
<div class="modal" tabindex="-1" id="modal-form">
	<div class="modal-dialog modal-lg">
		<div class="modal-content bg-light">
			<div class="modal-header p-3">
				<h1>정보 확인</h1>
			</div>
			<div class="modal-body col-12 mt-3">
				<form method="post" id="send-form"  >
					<table class="m-3">
						<colspan>
							<col width="15%">
							<col width="50%">
							<col width="20%">
							<col width="15%">
						</colspan>
						<tbody>
							<tr>
								<td></td>
								<td id="check-reserv">
									<div>
										<h5 class="mb-3"><strong>접수 정보</strong></h5>
										<p>이름: ${loginUser.name }</p>
										<p>접수: 지정 장소 접수 </p>
										<p>장소: ${location.name }</p>
										<p id="input-date"></p>
									</div>
								</td>
								<td>
									<div class="border rounded" style="width:200px; height:200px;">
										<p class="text-center"><strong>${device.deviceCategoryName }</strong></p>
											<c:choose>
												<c:when test="${device.deviceCategoryProduct == 'phone' }">
													<image src="/resources/images/samplePhone-1.png" width="110" height="110" class="img-thumnail rounded mx-auto d-block">
												</c:when>
												<c:when test="${device.deviceCategoryProduct == 'pad' }">
													<image src="/resources/images/simplePad-1.png" width="110" height="110" class="img-thumnail rounded mx-auto d-block">
												</c:when>
												<c:otherwise>
													<image src="/resources/images/earphone-pro.png" width="110" height="110" class="img-thumnail rounded mx-auto d-block">
												</c:otherwise>
											</c:choose>
										<p class="text-center pt-3"><strong class="text-danger">${serviceInfo.serviceCatName }</strong></p>
									</div>
								</td>
							</tr>
								<td></td>
								<td colspan="2">
									<div class="col-12 border-bottom mt-1"></div>
									
									<h5 class="mt-3"><strong>받을 주소</strong></h5>
									<p id="input-address"></p>
								<td>
							<tr>
								<td></td>
								<td colspan="2">
									<div class="col-8 border-bottom"></div>
									
									<h5 class="mt-3"><strong>예상 비용</strong></h5>
									<h6 class="mt-3"><strong>수리 비용: </strong> <strong class="text-danger">${serviceInfo.serviceAmount } 원</strong></h6>
									<h6><strong>완료 배송: </strong> <strong class="text-danger">3000 원</strong></h6>
									
									<div class="col-8 border-bottom mt-1"></div>
									
									<h6 class="mt-2"><strong>예상 총 금액: </strong> <strong class="text-danger">${serviceInfo.serviceAmount + 3000 } 원</strong></h6>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div class="modal-footer col-12 text-end mt-3">
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-dark" id="reserv-end">접수</button>
			</div>
		</div>
	</div>
</div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://momentjs.com/downloads/moment-with-locales.min.js"></script>
<script>

	// 달력 표시
	let days = [];
	for(let i = 0; i <8; i++) {
		moment.locale('ko');
		
		let name = moment().add(i, 'd').format('dd');
		let day = moment().add(i, 'd').format('D');
		let date = moment().add(i, 'd').format('YYYY-MM-DD');
		days.push({name:name, day:day, date:date});
	}
	
	$.each(days, function(index, calendar) {
		let th = `<th class="ps-3">\${calendar.name}</th>`;
		let td = `<td><button type="button" class="btn btn-border-white" data-reserv-date=\${calendar.date} >\${calendar.day}</button></td>`;
		$("#day-of-week").append(th);
		$("#day").append(td);
	})
	
	// 날짜 클릭
	$("#day").on('click', 'button', function() {
		$("#address-form").removeClass("d-none");
		$("button[class='accordion-button']").click();
		$("#day button").removeClass("btn-dark font-white");
		$(this).addClass("btn-dark font-white");
		
		let date = $(this).attr("data-reserv-date");
		$("#reserv-date").val(date);
		
		let text = `접수날짜: \${date}`
		$("#input-date").text(text);
	});

	// 주소 버튼
	$("#find-address").click(function() {
		
		new daum.Postcode({
		    oncomplete: function(data) {
		    	
                let addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 도로명 주소 선택
                    addr = data.roadAddress;
                } else { // 지번 주소 선택
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $("#zipCode").val(data.zonecode);
                $("#basicAddress").val(addr);
                // 커서를 상세주소 필드로 이동한다.
                $("#detailAddress").focus();
		    }
		}).open();
		
	});
	
	// 접수 등록 ㅡ> 모달
	let modal = new bootstrap.Modal('#modal-form');
	
	$("#check-reservation").click(function checkReservation(event) {
		let basicAddress = $("#basicAddress").val();
		let detailAddress = $("#detailAddress").val();
		
		if(basicAddress === '') {
			alert("주소를 입력해주세요");
			event.preventDefault();
			return false;
		}
		if(detailAddress === '') {
			alert("상세주소를 입력해주세요");
			$("#detailAddress").focus();
			return false;
		}
		
		let address = `
						\${basicAddress},
						\${detailAddress}
					  `
		$("#input-address").text(address);
		
		modal.show();
	})
	
	// 접수
	$("#reserv-end").click(function() {
		$("#address-form").trigger("submit");
	})
</script>
</body>
</html>