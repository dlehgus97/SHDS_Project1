<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FaQ</title>
<link rel="stylesheet" href="../resources/css/admin/adminMain.css" />
<link rel="stylesheet" href="../resources/css/admin/serviceCenter.css" />
<style>
	#serviceCenter{color:purple;}
	#event{color:purple;}
</style>
</head>
<body>
<div class="page-container">
		<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
		<div class="main-content">
			<%@ include file="/WEB-INF/views/admin/adminHeader.jsp"%>
			<div class="bg-wh service_div">
				
				<div class="service_header">
					<h1 class="title_event">이벤트</h1>
					<button class="button1" onclick="openPopup(); return false;">이벤트 등록</button>
				</div>
				
			</div>
			
		</div>
	</div>
</body>
</html>