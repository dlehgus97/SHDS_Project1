<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 정산 내역</title>
<link rel="stylesheet" href="../resources/css/admin/adminMain.css" />
<link rel="stylesheet"
	href="../resources/css/admin/sellerSettlement.css" />
<style>
	#sellerSettlement{color:purple;}
	#sellerSettlement_M{color:purple;}
</style>
</head>
<body>
<div class="page-container">
		<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
		<div class="main-content">
			<%@ include file="/WEB-INF/views/admin/adminHeader.jsp"%>
			<div class="bg-wh seller_div">
				<h1 style="margin-left: 30px;margin-top:10px;font-size:30px;">판매자 정산 내역</h1><br>
				
				
				
				
				<table class="settlement_table">
					<colgroup>
						<col width="210px" />
						<col width="260px" />
						<col width="210px" />
						<col width="210px" />
						<col width="210px" />
						<col width="210px" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>판매자ID</th>
							<th>결제일</th>
							<th>구매 확정 일자</th>
							<th>상품금액</th>
							<th>정산하기</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="vo" items="${map.list }">
							<tr>
								<!-- 여기에 테이블 -->
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</div>
	<%@ include file="/WEB-INF/views/admin/adminFooter.jsp"%>
</body>
</html>