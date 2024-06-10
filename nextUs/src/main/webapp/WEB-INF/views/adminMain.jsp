<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="../resources/css/admin/adminMain.css" />
<style>
	#adminMain{color:purple;}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/adminHeader.jsp" %>
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