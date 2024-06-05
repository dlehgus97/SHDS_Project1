<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 제재 내역</title>
<link rel="stylesheet" href="../resources/css/admin/adminMain.css" />
<link rel="stylesheet" href="../resources/css/admin/memberBanManagement.css" />
<script src="../resources/js/admin/memberBanManagement.js"></script>
</head>
<body>
	<div class="container">
		<div class="ad-menu">
			<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
		</div>
		<div class="m_right">
			<div class="Ban_div">
				<h1>회원 제재 내역</h1>
				<button onclick="openPopup(); return false;">제재 내역 추가</button>
			
			</div>
		</div>
	</div>

</body>
</html>