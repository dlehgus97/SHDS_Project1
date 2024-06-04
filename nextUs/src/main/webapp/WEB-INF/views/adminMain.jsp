<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="../resources/css/adminMain.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">

</head>
<body>
	<div class="container">
		<div class="ad-menu">
			<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
		</div>
		<div class="right">
			<!-- 메인화면이 default로 출력 -->
			<div class="bg-wh new_issue">
				<h1 class="div_header">New issue</h1>
			</div>
			<div class="three_graph">
				<div class="bg-wh main_graph">
					<canvas id="line-chart" width="300" height="250"></canvas>
				</div>
				<div class="bg-wh main_graph"></div>
				<div class="bg-wh main_graph"></div>
			</div>
		</div>
	</div>
</body>
</html>