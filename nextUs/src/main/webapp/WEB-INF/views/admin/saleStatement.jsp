<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출통계</title>
<link rel="stylesheet" href="../resources/css/admin/adminMain.css" />
</head>
<body>
	<div class="container">
		<div class="ad-menu">
			<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
		</div>
		<div class="right">
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