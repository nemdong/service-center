<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>애플리케이션</title>
</head>
<style>
{
  box-sizing: border-box; 
}
  
.que:first-child{
    border-top: 1px solid black;
  }
  
.que{
  position: relative;
  padding: 17px 0;
  cursor: pointer;
  font-size: 16px;
  border-bottom: 1px solid #dddddd;
  
}
  
.que::before{
  display: inline-block;
  content: ' ';
  font-size: 16px;
  color: #006633;
  margin: 0 5px;
}

.que.on>span{
  font-weight: bold;
  color: #006633; 
}
  
.anw {
  display: none;
  overflow: hidden;
  font-size: 14px;
}
  
.anw::before {
  display: inline-block;
  font-size: 14px;
  font-weight: bold;
  color: #666;
  margin: 0 5px;
}

.arrow-wrap {
  position: absolute;
  top:50%; right: 10px;
  transform: translate(0, -50%);
}

.que .arrow-top {
  display: none;
}
.que .arrow-bottom {
  display: block;
}
.que.on .arrow-bottom {
  display: none;
}
.que.on .arrow-top {
  display: block; 
}

</style>
<body>
<div class="container">
</head>
<body>

<div id="Accordion_wrap">
     <div class="que ${menu1 eq '고객관리' ?'on' : '' }">
     	 <span>고객관리</span>
     </div>
     <div class="anw" style="${menu1 eq '고객관리' ?'display: block;' : '' }">
	     <div class="list-group ">
			<span><a href="/erp/main" class="list-group-item list-group-item-action border-0 ${menu2 eq '고객관리' ? 'active' : '' }">고객관리</a></span>
			<span><a href="#" class="list-group-item list-group-item-action border-0 ${menu2 eq '서비스이력조회' ? 'active' : '' }">서비스이력조회</a></span>
		 </div>
     </div>
     <div class="que ${menu1 eq '인사관리' ?'on' : '' }">
     	<span>인사관리</span>
     </div>
     <div class="anw" style="${menu1 eq '인사관리' ?'display: block;' : '' }">
	     <div class="list-group ">
			<span><a href="#" class="list-group-item list-group-item-action border-0 ${menu2 eq '인사조회/등록' ? 'active' : '' }">인사조회/등록</a></span>
		 </div>
     </div>
     <div class="que ${menu1 eq '근태관리' ?'on' : '' }">
      	<span>근태관리</span>
     </div>
     <div class="anw" style="${menu1 eq '근태관리' ?'display: block;' : '' }">
     	<div class="list-group ">
			<span><a href="#" class="list-group-item list-group-item-action border-0 ${menu2 eq '근태확인' ? 'active' : '' }">근태확인</a></span>
			<span><a href="#" class="list-group-item list-group-item-action border-0 ${menu2 eq '월근태확인' ? 'active' : '' }">월근태확인</a></span> 
		</div>
     </div>
     <div class="que ${menu1 eq '출장관리' ?'on' : '' }">
      	<span>출장관리</span>
     </div>
     <div class="anw" style="${menu1 eq '출장관리' ?'display: block;' : '' }">
     	<div class="list-group ">
			<span><a href="#" class="list-group-item list-group-item-action border-0 ${menu2 eq '출장현황' ? 'active' : '' }">출장현황</a></span>
			<span><a href="#" class="list-group-item list-group-item-action border-0 ${menu2 eq '출장요청내역' ? 'active' : '' }">출장요청내역</a></span> 
		</div>
     </div>
     <div class="que ${menu1 eq '휴가관리' ?'on' : '' }">
      	<span>휴가관리</span>
     </div>
     <div class="anw " style="${menu1 eq '휴가관리' ?'display: block;' : '' }">
     	<div class="list-group ">
			<span><a href="/vacation/vacStatus" class="list-group-item list-group-item-action border-0 ${menu2 eq '연차현황' ? 'active' : '' }">연차현황</a></span>
			<span><a href="/vacation/manage" class="list-group-item list-group-item-action border-0 ${menu2 eq '휴가신청' ? 'active' : '' }">휴가신청</a></span> 
			<span><a href="/vacation/reqHistories" class="list-group-item list-group-item-action border-0 ${menu2 eq '요청내역' ? 'active' : '' }">요청내역</a></span> 
			<sec:authorize access="hasAnyRole('관리자')">
			<span><a href="/vacation/requestManage" class="list-group-item list-group-item-action border-0 ${menu2 eq '요청관리' ? 'active' : '' }">요청관리</a></span> 
			</sec:authorize>
		</div>
     </div>
     <div class="que ${menu1 eq 'A/S관리' ?'on' : '' }">
      	<span>A/S관리</span>
     </div>
     <div class="anw" style="${menu1 eq 'A/S관리' ?'display: block;' : '' }">
     	<div class="list-group ">
			<span><a href="#" class="list-group-item list-group-item-action border-0 ${menu2 eq 'a/s배정' ? 'active' : '' }">a/s배정</a></span>
			<span><a href="#" class="list-group-item list-group-item-action border-0 ${menu2 eq 'a/s접수확인' ? 'active' : '' }">a/s접수확인</a></span> 
			<span><a href="#" class="list-group-item list-group-item-action border-0 ${menu2 eq 'a/s일정' ? 'active' : '' }">a/s일정</a></span> 
			<span><a href="#" class="list-group-item list-group-item-action border-0 ${menu2 eq 'a/s내역' ? 'active' : '' }">a/s내역</a></span> 
		</div>
     </div>
     <div class="que ${menu1 eq '부품관리' ?'on' : '' }">
      	<span>부품관리</span>
     </div>
     <div class="anw" style="${menu1 eq '부품관리' ?'display: block;' : '' }">
     	<div class="list-group ">
     		
			<span><a href="#" class="list-group-item list-group-item-action border-0 ${menu2 eq '입고관리' ? 'active' : '' }">입고관리</a></span>
			<span><a href="#" class="list-group-item list-group-item-action border-0 ${menu2 eq '출고관리' ? 'active' : '' }">출고관리</a></span> 
			<span><a href="#" class="list-group-item list-group-item-action border-0 ${menu2 eq '재고관리' ? 'active' : '' }">재고관리</a></span> 
			<span><a href="#" class="list-group-item list-group-item-action border-0 ${menu2 eq '부품신청' ? 'active' : '' }">부품신청</a></span> 
		</div>
     </div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$(".que").click(function() {
		$(this).next(".anw").stop().slideToggle(300);
		$(this).toggleClass('on').siblings().removeClass('on');
		$(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
	});
});

</script>
</body>
</html>