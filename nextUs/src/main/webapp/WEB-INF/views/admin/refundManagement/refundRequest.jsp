<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환불관리</title>
<link rel="stylesheet" href="../resources/css/admin/adminMain.css" />
<link rel="stylesheet"
	href="../resources/css/admin/sellerRegistManagement.css" />
<script src="../resources/js/admin/memberStatus.js"></script>
<style>
	#refundRequest{color:purple;}
</style>
</head>
<body>
<div class="page-container">
		<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
		<div class="main-content">
			<%@ include file="/WEB-INF/views/admin/adminHeader.jsp"%>
			<div class="bg-wh seller_div">
				<h1 style="margin-left: 30px;margin-top: 10px;font-size:30px;">환불 요청 목록</h1>
				<p class="NUM_1">&nbsp;6&nbsp;</p>
				<!-- 여기 미승인 건수 넣기 -->
				<p class="NUM_2">미승인 건수</p>
				<!-- form 수정필요 -->
				<form method="get" name="searchForm" id="searchForm" action="">
					<select name="searchType">
						<option value="all">전체</option>
						<option value="email">이메일</option>
						<option value="nickname">닉네임</option>
					</select>
					<input type="text" name="searchWord" />
					<input type="date" name="date1" id="date"> &nbsp; ~ &nbsp;
					<input type="date" name="date2" id="date"> <input type="submit" value="검색">
				</form>
				<br>
				&ensp;&ensp;&ensp;&ensp;
				<table class="sellerRegist_table">
					<colgroup>
						<col width="200px" />
						<col width="250px" />
						<col width="230px" />
						<col width="250px" />
						<col width="230px" />
						<col width="230px" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>이메일</th>
							<th>닉네임</th>
							<th>요청일자</th>
							<th>내용</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<!-- 내용설정하기 -->
					</tbody>
				</table>

			</div>
		</div>
	</div>
</body>
</html>