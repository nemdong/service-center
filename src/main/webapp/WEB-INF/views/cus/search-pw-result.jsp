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
<c:set var="menu" value="login" />
<%@ include file="common/navbar.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light p-2 fs-4">비밀번호 찾기</h1>
		</div>
	</div>
	<div class="row mb-3" style="float: none; margin:100 auto;">
		<div class="col-4" style="float: none; margin:0 auto;">
			
			<p class="text-center">비밀번호 찾기 결과입니다.</p>
			<form class="border bg-light p-3">                                                                         
            <c:choose>
	            <c:when test="${empty customer}">                                                 
	                <p class="text-center">일치하는 고객정보가 없습니다.</p>
	             </c:when>
	             <c:otherwise>             
			<p class="text-center" >비밀번호 재발급:  ${newPassword}</p>                                              
	        </c:otherwise>                                                                    
        </c:choose>                                     
		</form>
		</div>
	</div>
</div>

  


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
</script>
</body>
</html>