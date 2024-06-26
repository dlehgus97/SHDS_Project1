<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 등록 성공</title>
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<link rel="stylesheet" type="text/css" href="/resources/css/success.css">
</head>
<body>
	<div>
		<%@ include file="/WEB-INF/views/include/header.jsp"%>

		<div class="container">

			<img src="/resources/imgs/success.png" width="200" height="200"
				style="margin-left: 50px;">
			<h1>판매자 등록 성공</h1>
			<p>
				<br>
				<br>저희 nexTus에 셀러등록을 해주셔서 감사합니다.<br>
				<br> 셀러등록까지는 약 2일 간의 시간이 소요될 예정입니다.<br>
				<br> 빠른 시일 내에 결과를 통보드리겠습니다.<br>
				<br> 감사합니다.
			</p>
			<a href="../../index.do" class="button">홈으로 돌아가기</a>
		</div>

		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</div>

</body>
</html>