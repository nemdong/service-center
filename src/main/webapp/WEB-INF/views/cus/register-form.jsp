<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>애플리케이션</title>
</head>
<body>
<c:set var="menu" value="register" />
<%@ include file="common/navbar.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light p-2 fs-4">회원가입</h1>
		</div>
	</div>

	<div class="row mb-3" style="float: none; margin:100 auto;">
		<div class="col-8" style="float: none; margin:0 auto;">
		    
		    <p class="text-center">회원가입 정보를 입력하세요</p>   
			<form:form modelAttribute="customerRegisterForm" id="form-register" class="border bg-light p-3" method="post" action="register">
				<input type="hidden" name="type" value="온라인고객" />
				<div class="mb-1">
					<label class="form-label">아이디</label>
				</div>
				<div>
					<form:input class="form-control form-control-sm d-inline-block" style="width:270px;" path="id" />
					<button id="btn-check-id" type="button" class="btn btn-primary btn-sm">중복확인</button>
					<form:errors path="id" cssClass="text-danger small d-block"></form:errors>
				</div>
				<div class="mb-3">
					<label class="form-label">비밀번호</label>
					<form:input class="form-control form-control-sm" style="width:550px;" path="password"/>
				     <form:errors path="password" cssClass="text-danger small"></form:errors>
				</div>
				<div class="mb-3">
					<label class="form-label">비밀번호 확인</label>
					<input class="form-control form-control-sm" type="text" style="width:550px;" id="password-confirm" />
				    <span id="password-confirm-message" class="text-danger small d-none">*비밀번호가 일치하지 않습니다.</span>
				</div>
				<div class="mb-3">
					<label class="form-label">이름</label>
					<form:input class="form-control form-control-sm" style="width:550px;" path="name" />
					<form:errors path="name" cssClass="text-danger small"></form:errors>
				</div>
				<div class="mb-3">
					<label class="form-label">이메일</label>
					<form:input class="form-control form-control-sm" style="width:550px;" path="email" />
					<form:errors path="email" cssClass="text-danger small"></form:errors>
				</div>
				<div class="mb-3">
					<label class="form-label">전화번호</label>
					<form:input class="form-control form-control-sm" style="width:550px;" path="phone" />
					<form:errors path="phone" cssClass="text-danger small"></form:errors>
			    </div>
				<div class="mb-1">
					<label class="form-label">주소</label>
				</div>
				<div>
                    <form:input id="sample6_postcode" path="zipcode" class="form-control form-control-sm d-inline-block" style="width:270px;" />
                    <input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-primary btn-sm" value="우편번호 찾기">
                    <form:errors path="zipcode" cssClass="text-danger small"></form:errors>
                </div>
                <div class="mb-1">
                    <form:input  path="basicAddress" id="sample6_address" class="form-control form-control-sm" style="width:550px;" />                 
                </div> 
                <div class="mb-3">
                    <form:input   path="detailAddress" id="sample6_detailAddress" class="form-control form-control-sm" style="width:550px;"/>
                    <form:errors path="detailAddress" cssClass="text-danger small"></form:errors> 
                  </div>
                 <div class="mb-5">
                    <label class="form-label">생년월일</label>
                    <form:input type="date" class="form-control form-control-sm" style="width:550px;" path="birthday" />
                    <form:errors path="birthday" cssClass="text-danger small"></form:errors>
                 </div>
				<div class="text-end" style="width:550px;">
				<div class="row mb-3" style="float: none; margin:100 auto;">
		         <div class="col-8" style="float: none; margin:0 auto;">
					<a href="/cus" class="btn btn-secondary"> 취 소 </a>
					<button type="submit" class="btn btn-primary"> 가 입 </button>
				</div>
				</div>
				</div>
			</form:form>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

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
    
    
    //비밀번호 확인
    $(function(){
    	
    	// 아이디 중복체크를 수행하고, 사용가능한 경우에만 true
    	let idChecked = false;
    	
    	// 비밀번호 일치 확인
    	$("#form-register").submit(function(){	  
    		// 아이디중복체크 여부를 확인
        	if (!idChecked) {
        		alert("아이디 중복체크를 하지 않았거나 이미 사용중인 아이디입니다.");
        		return false;
        	}
    		
    		var password = $("#form-register :input[id=password]").val();
         	var passwordConfirm =$("#form-register :input[id=password-confirm]").val();
         
         	if( password != passwordConfirm ) {
        		$('#password-confirm-message').removeClass("d-none");
            	return false;
      		} 
       		$('#password-confirm-message').addClass("d-none");
       		
       		
        	return true;
  		});
    	
    	// 아이디 중복체크
    	$("#btn-check-id").click(function() {
    		var inputValue = $("#id").val();
    		if (inputValue == "") {
    			alert("아이디를 입력하세요");
    			idChecked = false;
    			return;
    		}
    		// http://localhost/checkId?id=hong
    		$.get("/cus/checkId", {id: inputValue}, function(text){
    			if (text == 'exist') {
    				idChecked = false;
    				alert("사용할 수 없는 아이디입니다.");			
    			} else if (text == 'notExist') {
    				idChecked = true;
    				alert("사용할 수 있는 아이디입니다.");
    			}
    		})
    	});
  
    });
    
       

    
    
    
    
</script>


</body>
</html>