<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출통계</title>
<link rel="stylesheet" href="../resources/css/admin/adminMain.css" />
<style>
	#saleStatement{color:purple;}
	#sellerSettlement_M{color:purple;}
</style>
</head>
<body>
<div class="page-container">
		<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
		<div class="main-content">
			<%@ include file="/WEB-INF/views/admin/adminHeader.jsp"%>
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