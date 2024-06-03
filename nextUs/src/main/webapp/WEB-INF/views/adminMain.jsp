<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/admin.css" type="text/css" />
<style>
body {
	background-color: #F2F0F0;
}

.container {
	display: flex;
}

.ad-menu {
	width: 20%;
	height: 100%;
}

.right {
	width: 80%;
	height: 100%;
	margin: 30px 50px 30px 50px;
}

.right_div {
	background: white;
}

.new_issue {
	width: 25%;
	float: left;
}

.graph {
	width: 30%;
	height: 500px;
}

.visitors_per_day {
	
}

.purchases_per_day {
	
}

.confirm_per_day {
	
}
</style>
</head>
<body>
	<div class="container">
		<div class="ad-menu">
			<%@ include file="/WEB-INF/views/include/adminMenu.jsp"%>
		</div>
		<div class="right">
			<!-- 메인화면이 default로 출력 -->
			<div class="right_div new_issue"></div>
			<div class="three_graph">
				<div class="right_div graph"></div>
				<div class="right_div graph"></div>
				<div class="right_div graph"></div>

			</div>

		</div>
	</div>



</body>
</html>