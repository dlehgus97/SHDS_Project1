<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="../resources/css/admin/adminMain.css" />
<link rel="stylesheet" href="../resources/css/admin/serviceCenter.css" />
<style>
	#serviceCenter{color:purple;}
	#notice{color:purple;}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/adminHeader.jsp" %>
	<div class="container">
		<div class="ad-menu">
			<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
		</div>
		<div class="right">
			<div class="bg-wh service_div">
			
				<div class="service_header">
					<h1 class="title_notice">공지사항</h1>
					<button class="button1" onclick="openPopup(); return false;">공지 등록</button>
				</div>
				
			</div>
			
		</div>
	</div>
</body>
</html>