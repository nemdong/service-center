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
<c:set var="menu" value="customer" />
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light p-2 fs-4">내 정보 수정</h1>
		</div>
	</div>

	<div class="row mb-3" style="float: none; margin:100 auto;">
		<div class="col-8" style="float: none; margin:0 auto;">
	    	
	        <form id="form-modify" class="border bg-light p-3" method="post" action="modify">
	         	<div class="mb-3">
					<label class="form-label">이름</label>
					<input class="form-control form-control-sm" style="width:550px;" name="name" value="${customer.name }" />
				<div class="mb-3">
					<label class="form-label">이메일</label>
					<input class="form-control form-control-sm" style="width:550px;" name="email" value="${customer.email }" />
				</div>
				<div class="mb-3">
					<label class="form-label">전화번호</label>
					<input class="form-control form-control-sm" style="width:550px;" name="phone" value="${customer.phone }"  />
			    </div>
				<div class="mb-1">
					<label class="form-label">주소</label>
				</div>
				<div>
                    <input id="sample6_postcode" name="zipcode" class="form-control form-control-sm d-inline-block" style="width:270px;" value="${customer.zipcode }" />
                    <input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-primary btn-sm" value="우편번호 찾기">
                </div>
                <div class="mb-1">
                    <input  name="basicAddress" id="sample6_address" class="form-control form-control-sm" style="width:550px;" value="${customer.basicAddress }" />                 
                </div> 
                <div class="mb-3">
                    <input name="detailAddress" id="sample6_detailAddress" class="form-control form-control-sm" style="width:550px;" value="${customer.detailAddress }"/>
                  </div>
                 <div class="mb-5">
                    <label class="form-label">생년월일</label>
                    <input type="date" class="form-control form-control-sm" style="width:550px;" name="birthday" value="<fmt:formatDate value="${customer.birthday }" pattern="yyyy-MM-dd" />" />
                 </div>
				<div class="text-end" style="width:550px;">
				<div class="row mb-3" style="float: none; margin:100 auto;">
		         <div class="col-8" style="float: none; margin:0 auto;">
					<a href="/customer/mypage" class="btn btn-secondary"> 취 소 </a>
					<button type="submit" class="btn btn-primary"> 수정 </button>
				</div>
				</div>
				</div>
				</div>
			</form>
		</div>
	</div>
</div>		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
//우편번호 검색
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}

$(function() {
	  $("#form-modify").submit(function() {
	    alert("수정되었습니다.");
	    return true;
	  });
});




</script>
</body>
</html>