<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 발급 내역</title>
<link rel="stylesheet" href="../resources/css/admin/adminMain.css" />
<link rel="stylesheet"
	href="../resources/css/admin/simpleTable.css" />
<link rel="stylesheet" href="../resources/css/admin/coupon2.css" />

<script src="../resources/js/admin/memberBanManagement.js"></script>
<script src="../resources/js/admin/coupon.js"></script>
<style>
	#couponManagement{color:purple;}
	#memberStatus_M{color:purple;}
</style>

</head>
<body>
<%@ include file="/WEB-INF/views/admin/adminHeader.jsp" %>
	<div class="container">
		<div class="ad-menu">
			<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
		</div>
		<div class="m_right">
			<div class="header header2">
				<div class="c1" onclick="handleClick('c1')">쿠폰 발급 내역</div>
				<div class="c2" onclick="handleClick('c2')">쿠폰 지급</div>
			</div>
				<div class="bg-wh Ban_div">
					<br>
					<form method="post" name="couponForm" id="couponForm" action="">
					&emsp;&ensp;&ensp;쿠폰 이름:&emsp;<input type="text" name="name"
						placeholder=' 쿠폰 이름을 입력하세요'/>&emsp;
						
					<input type="radio" name="type" value="fixed" checked="checked">고정할인&emsp;
					<input type="radio" name="type" value="percent">%할인
					<!-- 여기 fixed,percent 바꿔야할듯 sql에 맞게 -->
					<br><br>
					
					&emsp;&ensp;&ensp;할&emsp;&nbsp;&emsp;인:&emsp;<input type="text" name="discount" placeholder='할인 금액(원)을 입력해주세요'/>
					<br><br>
					
					&ensp;&nbsp;&ensp;발급대상자: 
					<div class="target_list" style="overflow: auto;">
						
					</div>
					
					<input type="submit" value="쿠폰 지급">
				</form>
				</div>			
		</div>
	</div>

</body>
</html>