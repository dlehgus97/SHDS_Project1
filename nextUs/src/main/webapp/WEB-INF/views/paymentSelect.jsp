<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/paymentSelect.css">
<link rel="stylesheet" type="text/css" href="../resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="../resources/css/header.css">
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div id="payment_container">
		<div id="left">
            <a href="" class="paymentSelections" id="toss">
                <span id="toss_payment">토스결제</span>
            </a>
            <a href="" class="paymentSelections" id="kakao">
                <span id="kakao_payment">카카오페이</span>
            </a>
		</div>
		<div id="right">
		
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>